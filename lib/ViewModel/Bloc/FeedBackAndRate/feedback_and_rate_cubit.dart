import 'package:dlsm/Model/Feedback/FeedbackModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../View/Component/ShowToast/ShowToast.dart';
import '../../Data/Network/DioHelper.dart';
import '../../Data/Network/EndPoint.dart';

part 'feedback_and_rate_state.dart';

class FeedbackAndRateCubit extends Cubit<FeedbackAndRateState> {
  FeedbackAndRateCubit() : super(FeedbackAndRateInitial());

  static FeedbackAndRateCubit get(context) =>
      BlocProvider.of<FeedbackAndRateCubit>(context);
  int activeStep = 0;
  int rate = -1;
  TextEditingController? commentController = TextEditingController();
  FeedbackModel feedback=FeedbackModel();
  List<FeedbackModel> totalFeedback=[];

  Future<void> postFeedback({int? idClient, int? idShipping,String? feedbackType}) async {
    emit(LoadingFeedbackState());
    Map<String, dynamic>? data;
    data = {
      'message': commentController?.text,
      'rate': rate,
      'feedback_type': feedbackType,
      'shipping_company_id': idShipping,
      'client_id': idClient,
    };
    DioHelper.post(
      endPoint: EndPoint.feedback,
      data: data,
    ).then((value) {
      ShowToast(msg: '${value?.data['message']}').show();
      clear();
      emit(SuccessFeedbackState());
    }).catchError((error) {
      ShowToast(msg: 'Internet Error').show();
      emit(ErrorFeedbackState());
      throw error;
    });
  }

  Future<void> current({int? idReq}) async {
    emit(LoadingCurrentState());
    DioHelper.get(endPoint: '${EndPoint.current}/$idReq').then((value) {
      final parsedInt = int.tryParse(value?.data!);
      if (parsedInt == null) {
        activeStep = 0;
      } else {
        activeStep = parsedInt;
      }
      emit(SuccessCurrentState());
    }).catchError((error) {
      ShowToast(msg: 'Internet Error').show();
      emit(ErrorCurrentState());
      throw error;
    });
  }

  Future<void> process({int? idReq, int? num}) async {
    emit(LoadingDone());
    String? processStep;
    if (num == 0) {
      processStep = EndPoint.booking;
    } else if (num == 1) {
      processStep = EndPoint.loading;
    } else if (num == 2) {
      processStep = EndPoint.tracking;
    } else if (num == 3) {
      processStep = EndPoint.customClear;
    } else if (num == 4) {
      processStep = EndPoint.onTrip;
    } else if (num == 5) {
      processStep = EndPoint.done;
    }
    DioHelper.get(endPoint: '$processStep/$idReq').then((value) {
      ShowToast(msg: value?.data['message']).show();
      current(idReq: idReq);
      emit(SuccessDone());
    }).catchError((error) {
      ShowToast(msg: 'Internet Error').show();
      emit(ErrorDone());
      throw error;
    });
  }

  Future<void> getShippingFeedback({int? idShipping}) async {
    emit(LoadingGetFeedback());
    DioHelper.get(endPoint: '${EndPoint.getFeedbackShipping}/$idShipping').then((value) {
      totalFeedback.clear();
      for(var item in value?.data){
        feedback=FeedbackModel.fromJson(jsonData: item);
        totalFeedback.add(feedback);
      }
    }).catchError((error){
      ShowToast(msg: 'Internet Error').show();
      emit(ErrorGetFeedbackState());
      throw error;
    });
  }

  rateChange(int rateUpdate) async {
    rate = rateUpdate;
    emit(RateState());
  }

  clear() {
    rate = -1;
    activeStep = 0;
    emit(ClearState());
  }

}
