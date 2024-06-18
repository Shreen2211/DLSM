import 'package:dlsm/ViewModel/Data/Network/EndPoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Model/User/UserData.dart';
import '../../../View/Component/ShowToast/ShowToast.dart';
import '../../../View/Screens/Sign/Login_Screen.dart';
import '../../Data/Network/DioHelper.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? passwordConfirmController = TextEditingController();
  TextEditingController? nameController = TextEditingController();
  TextEditingController? countryController = TextEditingController();
  TextEditingController? phoneNumberController = TextEditingController();
  TextEditingController? addressController = TextEditingController();
  TextEditingController? websiteController = TextEditingController();
  TextEditingController? businessHoursController = TextEditingController();
  TextEditingController? sSNController = TextEditingController();
  TextEditingController? locationController = TextEditingController();
  TextEditingController? nationalityController = TextEditingController();
  TextEditingController? countriesDealing = TextEditingController();
  TextEditingController? countriesTarget = TextEditingController();
  String photoUser = 'emptyPhoto';
  String taxCard = 'emptyPhoto';
  String importCard = 'emptyPhoto';
  String commercialRecord = 'emptyPhoto';
  String industrialRecord = 'emptyPhoto';
  List<User> allClients = [];
  List<Map<String, dynamic>> showData = [];
  List<Map<String, dynamic>> showPhoto = [];
  bool obscurePassLogin = true;
  bool obscurePassRegister = true;
  bool obscureConfirmPassRegister = true;
  DateTime? history;

  User dataUser = User();
  User agentCompany = User();
  User client = User();
  int tableChoice = 0;

  var currentUserID;
  var currentUserType;

  String typeUser({var myType}) {
    String type = '';
    if (myType == '2') {
      type = 'Ex & Im Company';
    } else if (myType == '3') {
      type = 'Factory';
    } else if (myType == 4) {
      type = 'Shipping Company';
    } else if (myType == 6) {
      type = 'Agent Shipping';
    }
    return type;
  }

  void table(int num) {
    tableChoice = num;
    emit(TableState());
  }
  void businessYear(DateTime historyBusiness) {
    history= historyBusiness;
    emit(History());
  }

  void showPassword() {
    obscurePassLogin = !obscurePassLogin;
    emit(ShowPasswordState());
  }

  void showPasswordRegister() {
    obscurePassRegister = !obscurePassRegister;
    emit(ShowPasswordRegisterState());
  }

  void showConfirmPassword() {
    obscureConfirmPassRegister = !obscureConfirmPassRegister;
    emit(ShowConfirmPasswordState());
  }

  void clear() {
    emailController!.clear();
    passwordController!.clear();
    passwordConfirmController!.clear();
    phoneNumberController!.clear();
    businessHoursController!.clear();
    history==null;
    websiteController!.clear();
    locationController!.clear();
    sSNController!.clear();
    nameController!.clear();
    nationalityController!.clear();
    countriesTarget!.clear();
    countriesDealing!.clear();
    emit(ClearState());
  }

  Future<void> login(BuildContext context) async {
    emit(LoadingLoginState());
    try {
      await DioHelper.post(
        endPoint: EndPoint.login,
        data: {
          'Email': emailController?.text,
          'Password': passwordController?.text
        },
      ).then((value) {
        ShowToast(msg: '${value?.data['message']}').show();
        currentUserID = value?.data['id'];
        currentUserType = value?.data['TypeOfClient'];
        getClient();
        emit(SuccessLoginState());
      });
    } catch (error) {
      ShowToast(msg: 'Internet Error').show();
      emit(ErrorLoginState());
      rethrow;
    }
  }

  Future<void> getDate({int? id, var type}) async {
    emit(LoadingDataState());
    DioHelper.post(
      endPoint: EndPoint.dataUser,
      data: {
        'id': id,
        'TypeOfClient': type,
      },
    ).then((value) {
      dataUser = User.fromJson(jsonData: value?.data, typeUser: typeUser(myType: type));
      emit(SuccessDataState());
    }).catchError((error) {
      ShowToast(msg: 'Internet Error').show();
      emit(ErrorDataState());
      throw error;
    });
  }

  Future<void> getClient() async {
    emit(LoadingClient());
    DioHelper.get(endPoint: EndPoint.allRequest).then((value) {
      allClients.clear();
      for (var item in value?.data) {
        client = User.fromJson(jsonData: item);
        allClients.add(client);
      }
      emit(DoneClient());
    }).catchError((error) {
      ShowToast(msg: 'Internet Error').show();
      emit(ErrorClient());
      throw error;
    });
  }

  /*Future<void> getAgentCompanyDate({var agentShippingID}) async {
    emit(LoadingDataCompanyState());
    DioHelper.post(
      endPoint: EndPoint.dataUser,
      data: {
        'id': agentShippingID,
        'TypeOfClient': 4,
      },
    ).then((value) {
      agentCompany =
          User.fromJson(jsonData: value?.data, typeUser: typeUser(myType: 4));
      emit(SuccessDataCompanyState());
    }).catchError((error) {
      ShowToast(msg: 'Internet Error').show();
      emit(ErrorDataCompanyState());
      throw error;
    });
  }*/

  Future<void> postReg(BuildContext context) async {
    emit(LoadingRegState());
    Map<String, dynamic>? data;
    if (tableChoice.toString() == '1') {
      data = {
        'Email': emailController?.text,
        'Name': nameController?.text,
        'Password': passwordController?.text,
        'Password_confirmation': passwordConfirmController?.text,
        'table_choice': tableChoice.toString(),
        'PhoneNumber': phoneNumberController?.text,
        'SSN': sSNController?.text,
        'Photo': photoUser,
        'Nationality': nationalityController?.text,
      };
    } else if (tableChoice.toString() == '2') {
      data = {
        'Email': emailController?.text,
        'Name': nameController?.text,
        'Password': passwordController?.text,
        'Password_confirmation': passwordConfirmController?.text,
        'table_choice': tableChoice.toString(),
        'PhoneNumber': phoneNumberController?.text,
        'BusinessHistory': history?.year.toString(),
        'BusinessHours': businessHoursController?.text,
        'Website': websiteController?.text,
        'Address': locationController?.text,
      };
    } else if (tableChoice.toString() == '3' || tableChoice.toString() == '4') {
      data = {
        'Email': emailController?.text,
        'Name': nameController?.text,
        'Password': passwordController?.text,
        'Password_confirmation': passwordConfirmController?.text,
        'table_choice': tableChoice.toString(),
        'PhoneNumber': phoneNumberController?.text,
        'Website': websiteController?.text,
        'Address': locationController?.text,
        'TaxCard': locationController?.text,
        'CommercialRecord': commercialRecord,
        'IndustrialRecord': industrialRecord,
        'CountryDealing': countriesDealing?.text,
        'CountryTarget': countriesTarget?.text,
      };
    }
    DioHelper.post(
      endPoint: EndPoint.register,
      data: data,
    ).then((value) {
      ShowToast(msg: '${value?.data['message']}').show();
      clear();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
      emit(SuccessfulRegState());
    }).catchError((error) {
      ShowToast(msg: '${error.response?.data['message']}').show();
      emit(ErrorRegState());
      throw error;
    });
  }
}
