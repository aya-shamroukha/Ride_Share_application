// ignore_for_file: unused_element, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import 'package:ride_application/feature/home/pages/marker_date.dart';
import 'package:http/http.dart' as http;

import '../../../../core/resources/app_color.dart';
import 'home_page_event.dart';
import 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  getCurrentLocationApp() async {
    bool serviceEnabled;
    LocationPermission permission;
    //!للتاكد انو خدمة الموقع عل الموبايل شغالة
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled == false) {
      print('trun onnn');
    }
    //!لحتى اعطي صلاحية للتطبيق
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.whileInUse) {
      return await Geolocator.getCurrentPosition();
    }
  }

  List<Marker> marker = [];
  // ignore: prefer_final_fields
  List<MarkerDate> _markerdate = [];
  LatLng? selectPosition;
  final MapController mapController = MapController();

  LatLng? myLocation;
  bool isDragging = false;
  LatLng? draggedPosition;
  TextEditingController search = TextEditingController();
  List<dynamic> searchResults = [];
  bool isSearching = false;
  HomePageBloc() : super(HomePageInitial()) {
    on<GetCurrentLocationAppEvent>((event, emit) {
      getCurrentLocationApp() async {
        bool serviceEnabled;
        LocationPermission permission;
        //!للتاكد انو خدمة الموقع عل الموبايل شغالة
        serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (serviceEnabled == false) {
          print('trun onnn');
        }
        //!لحتى اعطي صلاحية للتطبيق
        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
        }
        if (permission == LocationPermission.whileInUse) {
          return await Geolocator.getCurrentPosition();
        }
      }

      emit(GetCurrentLocationAppState());
    });
    //!mylocation
    on<ForMyLoactionEvent>((event, emit) async {
      try {
        Position position = await getCurrentLocationApp();
        LatLng currrntLatLng = LatLng(position.latitude, position.longitude);
        mapController.move(currrntLatLng, 18.0);

        myLocation = currrntLatLng;
        emit(ForMyLoactionState());
      } catch (e) {
        print(e);
      }
    });
    //!AddMarker
    on<AddMarkerOnSelectedLocationEvent>((event, emit) async {
      final markerdate = MarkerDate(
        position: event.position,
      );

      _markerdate.add(markerdate);
      marker.add(Marker(
          point: event.position,
          child: GestureDetector(
            child: const Icon(
              Icons.location_on,
              color: AppColor.red,
              size: 50,
            ),
            onTap: () {},
          ),
          width: 80,
          height: 80));
      emit(AddMarkerOnSelectedLocationState());
    });
//!search
    on<SearchEvent>(
      (event, emit) async {
        if (event.query.isEmpty) {
          searchResults = [];

          return;
        }
        final url =
            'https://nominatim.openstreetmap.org/search?q=$event.query&format=json&limit=5';
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          if (data.isNotEmpty) {
            searchResults = data;
            emit(SearchState());
          } else {}
        } else {
          print('Failed to load data...........');
        }
      },
    );
    //!move to location
    on<MovieToSpecificLocationEvent>(
      (event, emit) {
        LatLng location = LatLng(event.lat, event.lon);
        mapController.move(location, 18.0);

        selectPosition = location;
        searchResults = [];
        isSearching = false;
        MarkerLayer(markers: [
          Marker(
              point: LatLng(event.lat, event.lon),
              width: 80,
              height: 80,
              child: Icon(
                Icons.location_on,
                color: AppColor.primary,
              )),
        ]);
        //  search.clear();
        emit(MovieToSpecificLocationState());
      },
    );

    on<TextFieldEvent>(
      (event, emit) {
        search.addListener(
          () {
            add(SearchEvent(query: search.text));
          },
        );
        isSearching = true;
        emit(TextFieldState());
        print(isSearching);
      },
    );
  }
}
