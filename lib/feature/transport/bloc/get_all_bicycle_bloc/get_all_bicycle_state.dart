import 'package:ride_application/core/domain/model/cycle/get_all_bicycle.dart';

class GetAllBicycleState {}

final class GetAllBicycleInitial extends GetAllBicycleState {}

class GetAllBicycleSuccessState extends GetAllBicycleState {
  final List<GetAllBicycleModel> getallbicycle;

  GetAllBicycleSuccessState(this.getallbicycle);
}

class GetAllBicycleLoadingState extends GetAllBicycleState {}

class GetAllBicycleFaieldState extends GetAllBicycleState {}
