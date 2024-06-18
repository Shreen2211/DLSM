part of 'post_cubit.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

class LoadingPostState extends PostState {}

class SuccessPostState extends PostState {}

class ErrorPostState extends PostState {}

class ClearPostState extends PostState {}

class LoadingDataState extends PostState {}

class SuccessDataState extends PostState {}

class ErrorDataState extends PostState {}

class LoadingDeleteState extends PostState {}

class SuccessDeleteState extends PostState {}

class ErrorDeleteState extends PostState {}

class LoadingShippingState extends PostState {}

class SuccessShippingState extends PostState {}

class ErrorShippingState extends PostState {}
class LoadingState extends PostState {}
