class GetCycleByIdEvent {}

class GetCycleByIdSuccessEvent extends GetCycleByIdEvent {
  final dynamic id;

  GetCycleByIdSuccessEvent({required this.id});
}
