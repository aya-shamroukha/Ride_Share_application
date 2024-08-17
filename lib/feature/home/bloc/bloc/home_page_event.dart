// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:latlong2/latlong.dart';

class HomePageEvent {}

class ForMyLoactionEvent extends HomePageEvent {}

class AddMarkerOnSelectedLocationEvent extends HomePageEvent {
  LatLng position;
  AddMarkerOnSelectedLocationEvent({
    required this.position,
  });
}

class SearchEvent extends HomePageEvent {
  String query;
  SearchEvent({
    required this.query,
  });
}

class MovieToSpecificLocationEvent extends HomePageEvent {
  double lat;
  double lon;
  MovieToSpecificLocationEvent({
    required this.lat,
    required this.lon,
  });
}

class GetCurrentLocationAppEvent extends HomePageEvent {}

class TextFieldEvent extends HomePageEvent {}
