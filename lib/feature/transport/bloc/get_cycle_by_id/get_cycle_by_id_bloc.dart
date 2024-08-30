import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_application/core/domain/service/cycle_service.dart';

import '../../../../core/domain/model/cycle/get_all_bicycle.dart';
import 'get_cycle_by_id_event.dart';
import 'get_cycle_by_id_state.dart';

class GetCycleByIdBloc extends Bloc<GetCycleByIdEvent, GetCycleByIdState> {
  GetCycleByIdBloc() : super(GetCycleByIdInitial()) {
    on<GetCycleByIdSuccessEvent>((event, emit) async {
      emit(GetCycleByIdLoadingState());
      var cycle = await CycleImpl().getBicycleById(event.id);
      GetAllBicycleModel cycledata =
          GetAllBicycleModel.fromMap((cycle['body']));
      emit(GetCycleByIdSuccessState(getallbicycle: cycledata));
    });
  }
}
