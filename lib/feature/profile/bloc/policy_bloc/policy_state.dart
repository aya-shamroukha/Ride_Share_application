import 'package:ride_application/core/domain/model/profile/policy_model.dart';

class PolicyState {}

final class PolicyInitial extends PolicyState {}

class PolicySuccessState extends PolicyState {
  final PolicyModel policyModel;

  PolicySuccessState(this.policyModel);
}

class PolicyLoadingState extends PolicyState {}

class PolicyFailedState extends PolicyState {}
