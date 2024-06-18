import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Model/Countries/Countries.dart';
import '../../../Model/Request/OfferModel.dart';
import '../../../Model/Request/RequestModel.dart';
import '../../../View/Component/ShowToast/ShowToast.dart';
import '../../Data/Network/DioHelper.dart';
import '../../Data/Network/EndPoint.dart';

part 'req_and_offer_state.dart';

class ReqAndOfferCubit extends Cubit<ReqAndOfferState> {
  ReqAndOfferCubit() : super(ReqAndOfferInitial());

  static ReqAndOfferCubit get(context) =>
      BlocProvider.of<ReqAndOfferCubit>(context);
  TextEditingController? countryController = TextEditingController();
  TextEditingController? destinationController = TextEditingController();
  TextEditingController? destinationTwoController = TextEditingController();
  TextEditingController? weightController = TextEditingController();
  TextEditingController? lengthController = TextEditingController();
  TextEditingController? widthController = TextEditingController();
  TextEditingController? heightController = TextEditingController();
  TextEditingController? safetyController = TextEditingController();
  TextEditingController? commentController = TextEditingController();
  TextEditingController? goodsTypeController = TextEditingController();
  TextEditingController? dangerousController = TextEditingController();
  TextEditingController? typeOfContainer = TextEditingController();
  TextEditingController? numberOfContainers = TextEditingController();
  TextEditingController? typeOfTruck = TextEditingController();
  TextEditingController? weightOfSingleCarton = TextEditingController();
  TextEditingController? numberOfCarton = TextEditingController();
  TextEditingController? oceanFreightController = TextEditingController();
  TextEditingController? thcController = TextEditingController();
  TextEditingController? totalPriceController = TextEditingController();
  TextEditingController? extraFeesController = TextEditingController();
  TextEditingController? customsPrice = TextEditingController();
  TextEditingController? truckingPrice = TextEditingController();
  TextEditingController? bLController = TextEditingController();
  TextEditingController? powerPerDayController = TextEditingController();
  TextEditingController? transTimeController = TextEditingController();
  TextEditingController? freeTimeController = TextEditingController();
  List<String> countriesLocation = [];
  List<String> countriesLocationTwo = [];
  List<RequestModel> allRequest = [];
  List<RequestModel> myRequest = [];
  List<OfferModel> allOffer = [];
  List<OfferModel> requestOffer = [];
  String? countryLocation;
  String? countryLocationTwo;
  bool dangerous = false;
  bool customClear = false;
  int customClearValue = 0;
  int trackingValue = 0;
  bool tracking = false;
  String dangerousNo = '0';
  String? typeTrans;


  CountryModel country = CountryModel();
  RequestModel req = RequestModel();
  OfferModel offer = OfferModel();
  OfferModel offerSpecific = OfferModel();

  changeMore(int index) async {
    if (index == -1) {
      offerSpecific.more = !offerSpecific.more;
    } else {
      requestOffer[index].more = !requestOffer[index].more;
    }
    emit(ChangeMoreState());
  }

  Future<void> postRequest({String? requestType, String? id}) async {
    emit(LoadingRequestState());
    Map<String, dynamic>? data;
    if (requestType == '3') {
      data = {
        'req_type': requestType,
        'client_id': id,
        'Country': countryLocation,
        'Location': destinationController?.text,
        'Destination': destinationTwoController?.text,
        'GoodsType': goodsTypeController?.text,
        'Weight': weightController?.text,
        'dangerous': dangerousNo,
        'Safety': dangerous,
        'Comment': commentController?.text,
      };
    } else {
      data = {
        'req_type': requestType,
        'client_id': id,
        'Location': countryLocation,
        'Country': countryLocation,
        'Destination': destinationController?.text,
        'Location2': countryLocationTwo,
        'Destination2': destinationTwoController?.text,
        'GoodsType': goodsTypeController?.text,
        'Weight': weightController?.text,
        'Width': widthController?.text,
        'Length': lengthController?.text,
        'Height': heightController?.text,
        'dangerous': dangerousNo,
        'Safety': dangerous,
        'Comment': commentController?.text,
        'ContainerTypeAndSize': typeOfContainer?.text,
        'NumberOfContainer': numberOfContainers?.text,
        'TypesOfTruck': typeOfTruck?.text,
        'NumberOfCartons': numberOfCarton?.text,
        'WeightOfSingleCarton': weightOfSingleCarton?.text,
        'Transport': typeTrans,
        'CustomsClearness': customClearValue,
        'Tracking': trackingValue,
      };
    }
    DioHelper.post(
      endPoint: EndPoint.request,
      data: data,
    ).then((value) {
      ShowToast(msg: '${value?.data['message']}').show();
      getRequest();
      clear();
      emit(SuccessRequestState());
    }).catchError((error) {
      ShowToast(msg: 'Internet Error').show();
      emit(ErrorRequestState());
      throw error;
    });
  }

  Future<void> postOffer({int? idRequest, int? idAgent}) async {
    emit(LoadingOfferState());
    Map<String, dynamic>? data;
    data = {
      'From': destinationController?.text,
      'To': destinationTwoController?.text,
      'THC': thcController?.text??0,
      'FT': freeTimeController?.text??0,
      'TT': transTimeController?.text,
      'PL': bLController?.text??0,
      'OF': oceanFreightController?.text??0,
      'PowerPerDay': powerPerDayController?.text??0,
      'Price': totalPriceController?.text,
      'ExtraFees': extraFeesController?.text??0,
      'Comment': commentController?.text??'',
      'CustomsPrice': customsPrice?.text,
      'TruckingPrice': truckingPrice?.text,
      'agents_id': idAgent,
      'request_id': idRequest,
    };
    DioHelper.post(
      endPoint: EndPoint.offer,
      data: data,
    ).then((value) {
      ShowToast(msg: '${value?.data['message']}').show();
      clear();
      emit(SuccessOfferState());
    }).catchError((error) {
      ShowToast(msg: 'Internet Error').show();
      emit(ErrorOfferState());
      throw error;
    });
  }

  Future<void> getRequest({int? id}) async {
    emit(LoadingGetRequest());
    DioHelper.get(endPoint: EndPoint.allRequest).then((value) {
      allRequest.clear();
      myRequest.clear();
      for (var item in value?.data) {
        req = RequestModel.fromJson(item);
        allRequest.add(req);
        if (req.clientId == id) {
          myRequest.add(req);
        }
      }
      emit(SuccessGetRequest());
    }).catchError((error) {
      ShowToast(msg: 'Internet Error').show();
      emit(ErrorGetRequest());
      throw error;
    });
  }

 /* Future<void> postFeedback({int? idClient, int? idShipping}) async {
    emit(LoadingFeedbackState());
    Map<String, dynamic>? data;
    data = {
      'message': commentController?.text,
      'rate': rate,
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
  rateChange(int rateUpdate) async {
    rate = rateUpdate;
    emit(RateState());
  }
  */


  Future<void> offerAccept({int? idReq, int? idOffer}) async {
    emit(LoadingOfferAccept());
    DioHelper.get(endPoint: '${EndPoint.offerAccept}/$idReq/$idOffer')
        .then((value) {
      ShowToast(msg: value?.data['message']).show();
      emit(SuccessOfferAccept());
    }).catchError((error) {
      ShowToast(msg: 'Internet Error').show();
      emit(ErrorOfferAccept());
      throw error;
    });
  }

  Future<void> getSpecificOffers({required int id}) async {
    emit(LoadingGetSpecificOffer());
    try {
      DioHelper.get(endPoint: "${EndPoint.offers}/$id").then((value) {
        offerSpecific = OfferModel.fromJson(value?.data['1']);
        emit(SuccessGetSpecificOffer());
      });
    } catch (error) {
      ShowToast(msg: 'Internet Error').show();
      emit(ErrorGetSpecificOffer());
      rethrow;
    }
  }
  Future<void> getOffers({required int id}) async {
    emit(LoadingGetOffer());
    try {
      DioHelper.get(endPoint: "${EndPoint.offersForSpecificRequest}/$id").then((value) {
        requestOffer.clear();

        // Assuming the JSON data is in a list format
        List<dynamic> jsonData = value?.data as List<dynamic>;
        for (var item in jsonData) {
          if (item is Map<String, dynamic>) {
            // Assuming the data is in the "1" key
            offer = OfferModel.fromJson(item);
            if (item.containsKey("1")) {
              offer = OfferModel.fromJson(item["1"]);
            }
            requestOffer.add(offer);

          }
        }

        emit(SuccessGetOffer());
      });
    } catch (error) {
      ShowToast(msg: 'Internet Error').show();
      emit(ErrorGetOffer());
      rethrow;
    }
  }

  /*Future<void> getOffers({required int id}) async {
    emit(LoadingGetOffer());
    try {
      DioHelper.get(endPoint: "${EndPoint.offersForSpecificRequest}/$id")
          .then((value) {
        requestOffer.clear();
        for (var item in value?.data) {
          if(value?.data.containsKey('1')){
            offer = OfferModel.fromJson(item['1']);
          }
         */
  /* if(value?.data['2']!=null){
            offer = OfferModel.fromJson(item['2']);
          }else if(value?.data['3']!=null){
            offer = OfferModel.fromJson(item['3']);
          }else if(value?.data['1']!=null){

          }*/
  /*else{
            offer = OfferModel.fromJson(item);
          }*/
  /*
          requestOffer.add(offer);
        }
        emit(SuccessGetOffer());
      });
    } catch (error) {
      ShowToast(msg: 'Internet Error').show();
      emit(ErrorGetOffer());
      rethrow;
    }
  }*/

  getCountries() async {
    countriesLocation.clear();
    countriesLocationTwo.clear();
    DioHelper.get(endPoint: EndPoint.countries).then((value) {
      for (var item in value?.data) {
        country = CountryModel.fromJson(item);
        countriesLocation.add(country.name!);
        countriesLocationTwo.add(country.name!);
      }
    });
    emit(SuccessCountryState());
  }

  changCountryLocation(String? choose) async {
    countryLocation = choose;
    emit(ChooseLocationState());
  }

  changCountryTwo(String? choose) async {
    countryLocationTwo = choose;
    emit(ChooseLocationTwoState());
  }

  putTrans(String type) async {
    typeTrans = type;
    emit(Transport());
  }

  changeCheckBox(int i) async {
    if (i == 1) {
      dangerous = !dangerous;
      if (dangerousNo == '1') {
        dangerousNo = '0';
      } else {
        dangerousNo = '1';
      }
    } else if (i == 2) {
      customClear = !customClear;
      if (customClear == true) {
        customClearValue = 1;
      } else {
        customClearValue = 0;
      }
    } else if (i == 3) {
      tracking = !tracking;
      if (tracking == true) {
        trackingValue = 1;
      } else {
        trackingValue = 0;
      }
    }
    emit(ChangeSafetyState());
  }

  void clear() {
    goodsTypeController!.clear();
    destinationTwoController!.clear();
    destinationController!.clear();
    commentController!.clear();
    heightController!.clear();
    widthController!.clear();
    weightController!.clear();
    lengthController!.clear();
    typeOfTruck!.clear();
    typeOfContainer!.clear();
    numberOfCarton!.clear();
    numberOfContainers!.clear();
    weightOfSingleCarton!.clear();
    destinationTwoController!.clear();
    safetyController!.clear();
    countryController!.clear();
    oceanFreightController!.clear();
    totalPriceController!.clear();
    thcController!.clear();
    bLController!.clear();
    extraFeesController!.clear();
    freeTimeController!.clear();
    transTimeController!.clear();
    powerPerDayController!.clear();
    customsPrice!.clear();
    truckingPrice!.clear();
    countryLocation = 'Country Location';
    countryLocationTwo = 'Country Location Two';
    dangerous = false;
    tracking = false;
    customClear = false;
    emit(ClearState());
  }
}
