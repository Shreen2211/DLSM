part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoadingLoginState extends AuthState {}

class SuccessLoginState extends AuthState {}

class ErrorLoginState extends AuthState {}

class LoadingDataState extends AuthState {}

class SuccessDataState extends AuthState {}

class ErrorDataState extends AuthState {}

class LoadingDataCompanyState extends AuthState {}

class SuccessDataCompanyState extends AuthState {}

class ErrorDataCompanyState extends AuthState {}

class TypeState extends AuthState {}

class ShowPasswordState extends AuthState {}

class ShowConfirmPasswordState extends AuthState {}

class ShowPasswordRegisterState extends AuthState {}

class LoadingRegState extends AuthState {}

class LoadingClient extends AuthState {}

class SuccessfulRegState extends AuthState {}

class ErrorRegState extends AuthState {}

class ErrorClient extends AuthState {}

class TableState extends AuthState {}

class ClearState extends AuthState {}

class ChangeSign extends AuthState {}

class DoneClient extends AuthState {}

class History extends AuthState {}
