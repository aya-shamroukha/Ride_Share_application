// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_application/core/domain/model/cycle/get_all_bicycle.dart';
import 'package:ride_application/core/domain/service/cycle_service.dart';
import 'package:ride_application/feature/transport/bloc/get_all_bicycle_bloc/get_all_bicycle_state.dart';

import 'get_all_bicycle_event.dart';

class GetAllBicycleBloc extends Bloc<GetAllBicycleEvent, GetAllBicycleState> {
  GetAllBicycleBloc() : super(GetAllBicycleInitial()) {
    on<GetAllBicycleSuccessEvent>((event, emit) async {
      emit(GetAllBicycleLoadingState());
      print('-----------------------------------befor');
      var allcycle = await CycleImpl().getAllbicyles();
      print(allcycle);
      List<GetAllBicycleModel> cycledata = List.generate(
          allcycle['body'].length,
          (index) => GetAllBicycleModel.fromMap(
              (allcycle['body'][index] as Map<String, dynamic>)));
      emit(GetAllBicycleSuccessState(cycledata));
    });
  }
}
