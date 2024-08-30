import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_application/core/domain/model/profile/policy_model.dart';
import 'package:ride_application/core/domain/service/profile_service.dart';

import 'policy_event.dart';
import 'policy_state.dart';

class PolicyBloc extends Bloc<PolicyEvent, PolicyState> {
  PolicyBloc() : super(PolicyInitial()) {
    on<PolicySuccessEvent>((event, emit) async {
      emit(PolicyLoadingState());
      try {
        var policy = await ProfileServiceImpl().policy();
        PolicyModel policyModel = PolicyModel.fromMap((policy['body']));
        emit(PolicySuccessState(policyModel));
      } catch (e) {
        emit(PolicyFailedState());
      }
    });
  }
}
