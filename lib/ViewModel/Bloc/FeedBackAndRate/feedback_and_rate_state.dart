part of 'feedback_and_rate_cubit.dart';

@immutable
sealed class FeedbackAndRateState {}

final class FeedbackAndRateInitial extends FeedbackAndRateState {}

class ClearState extends FeedbackAndRateState {}

class LoadingDone extends FeedbackAndRateState {}

class ErrorDone extends FeedbackAndRateState {}

class SuccessDone extends FeedbackAndRateState {}

class LoadingCurrentState extends FeedbackAndRateState {}

class ErrorCurrentState extends FeedbackAndRateState {}

class SuccessCurrentState extends FeedbackAndRateState {}

class LoadingFeedbackState extends FeedbackAndRateState {}

class ErrorFeedbackState extends FeedbackAndRateState {}

class SuccessFeedbackState extends FeedbackAndRateState {}

class RateState extends FeedbackAndRateState {}

class LoadingGetFeedback extends FeedbackAndRateState {}

class ErrorGetFeedbackState extends FeedbackAndRateState {}
