import '../../../../core/domain/model/cycle/get_all_bicycle.dart';

class GetCycleByIdState {}

final class GetCycleByIdInitial extends GetCycleByIdState {}

class GetCycleByIdSuccessState extends GetCycleByIdState {
  final GetAllBicycleModel getallbicycle;

  GetCycleByIdSuccessState({required this.getallbicycle});
}

class GetCycleByIdLoadingState extends GetCycleByIdState {}

class GetCycleByIdFaieldState extends GetCycleByIdState {}
