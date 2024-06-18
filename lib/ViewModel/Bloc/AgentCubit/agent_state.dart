part of 'agent_cubit.dart';

@immutable
abstract class AgentState {}

class AgentInitial extends AgentState {}

class LoadingAgentState extends AgentState {}

class SuccessAgentState extends AgentState {}

class ErrorAgentState extends AgentState {}

class LoadingDataState extends AgentState {}

class SuccessDataState extends AgentState {}

class ErrorDataState extends AgentState {}

class LoadingDeleteState extends AgentState {}

class SuccessDeleteState extends AgentState {}

class ErrorDeleteState extends AgentState {}

class ClearState extends AgentState {}

class ShowDataState extends AgentState {}
