part of 'req_and_offer_cubit.dart';

@immutable
abstract class ReqAndOfferState {}

class ReqAndOfferInitial extends ReqAndOfferState {}

class LoadingRequestState extends ReqAndOfferState {}

class ErrorRequestState extends ReqAndOfferState {}

class SuccessRequestState extends ReqAndOfferState {}

class LoadingGetRequest extends ReqAndOfferState {}

class ErrorGetRequest extends ReqAndOfferState {}

class SuccessGetRequest extends ReqAndOfferState {}

class LoadingGetOffer extends ReqAndOfferState {}

class ErrorGetOffer extends ReqAndOfferState {}

class SuccessGetOffer extends ReqAndOfferState {}

class LoadingGetSpecificOffer extends ReqAndOfferState {}

class ErrorGetSpecificOffer extends ReqAndOfferState {}

class SuccessGetSpecificOffer extends ReqAndOfferState {}

class LoadingOfferState extends ReqAndOfferState {}

class ErrorOfferState extends ReqAndOfferState {}

class SuccessOfferState extends ReqAndOfferState {}

class LoadingOfferAccept extends ReqAndOfferState {}

class ErrorOfferAccept extends ReqAndOfferState {}

class SuccessOfferAccept extends ReqAndOfferState {}

class SuccessCountryState extends ReqAndOfferState {}

class ChooseLocationState extends ReqAndOfferState {}

class ChooseLocationTwoState extends ReqAndOfferState {}

class DoneRequest extends ReqAndOfferState {}

class ChangeSafetyState extends ReqAndOfferState {}

class ChangeMoreState extends ReqAndOfferState {}

class ClearState extends ReqAndOfferState {}

class Transport extends ReqAndOfferState {}
