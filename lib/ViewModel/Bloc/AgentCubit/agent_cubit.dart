import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Model/MyAgent/ShowDataAgent.dart';
import '../../../View/Component/ShowToast/ShowToast.dart';
import '../../Data/Network/DioHelper.dart';
import '../../Data/Network/EndPoint.dart';

part 'agent_state.dart';

class AgentCubit extends Cubit<AgentState> {
  AgentCubit() : super(AgentInitial());

  static AgentCubit get(context) => BlocProvider.of<AgentCubit>(context);

  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? nameController = TextEditingController();
  TextEditingController? phoneNumberController = TextEditingController();
  TextEditingController? passwordConfirmController = TextEditingController();
  var formKeyAgent = GlobalKey<FormState>();
  List<MyAgentData> dataAgent = [];

  void clear() {
    emailController!.clear();
    nameController!.clear();
    passwordController!.clear();
    passwordConfirmController!.clear();
    phoneNumberController!.clear();
    emit(ClearState());
  }

  void showData(int i) {
    dataAgent[i].isShow = !dataAgent[i].isShow;
    emit(ShowDataState());
  }

  Future<void> addAgent(dynamic currentUserID) async {
    emit(LoadingAgentState());
    DioHelper.post(
      endPoint: EndPoint.agent,
      data: {
        'Email': emailController?.text,
        'Password': passwordController?.text,
        'Name': nameController?.text,
        'PhoneNumber': phoneNumberController?.text,
        'Password_confirmation': passwordConfirmController?.text,
        'shipping_id': currentUserID,
      },
    ).then((value) {
      ShowToast(msg: '${value?.data['message']}').show();
      clear();
      getDate(currentUserID: currentUserID);
      emit(SuccessAgentState());
    }).catchError((error) {
      ShowToast(msg: 'Internet Error').show();
      emit(ErrorAgentState());
      throw error;
    });
  }

  Future<void> getDate({dynamic currentUserID}) async {
    emit(LoadingDataState());
    DioHelper.get(
      endPoint: '${EndPoint.shippingAgent}/$currentUserID',
    ).then((value) {
      dataAgent.clear();
      for (var item in value?.data) {
          dataAgent.add(MyAgentData.fromJson(jsonData: item));
      }
      emit(SuccessDataState());
    }).catchError((error) {
      ShowToast(msg: 'Internet Error').show();
      emit(ErrorDataState());
      throw error;
    });
  }

  Future<void> agentDelete({dynamic currentUserID, dynamic agentID}) async {
    emit(LoadingDeleteState());
    DioHelper.get(
      endPoint: '${EndPoint.agentDelete}/$agentID',
    ).then((value) {
      getDate(currentUserID: currentUserID);
      emit(SuccessDeleteState());
    }).catchError((error) {
      ShowToast(msg: 'Internet Error').show();
      emit(ErrorDeleteState());
      throw error;
    });
  }
}
