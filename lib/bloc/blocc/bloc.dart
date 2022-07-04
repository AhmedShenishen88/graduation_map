import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project/bloc/bloc_state/bloc_state.dart';

class BlocPage extends Cubit<BlocState> {
  BlocPage() : super(InitializeBlocState());

  static BlocPage get(context) => BlocProvider.of(context);

  String dropDownValue = 'item1';

  var items = [
    'item1',
    'item2',
    'item3',
    'item4',
    'item5',
  ];

  int val = 1;

  increaseVal() {
    val += 1;
    emit(BlocStateIncrease());
  }

  decreaseVal() {
    val -= 1;
    emit(BlocStateDecrease());
  }

  changeItem(String? newValue) {
    dropDownValue = newValue!;
    emit(BlocStateHappened());
  }

  //camera position component
  Completer<GoogleMapController> controlMap = Completer();
  CameraPosition positionOld =
      const CameraPosition(target: LatLng(30.671025, 30.948486), zoom: 14.756);
  Marker mMarker = const Marker(
      markerId: MarkerId('positionOld'),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(title: 'Google plex'),
      position: LatLng(30.671025, 30.948486));

  CameraPosition kLake = const CameraPosition(
    target: LatLng(30.680569, 30.940295),
    zoom: 19.546,
    tilt: 59.440717697143555,
    bearing: 192.8334901395799,
  );
  Marker lLake = Marker(
      markerId: const MarkerId('kLake'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: const InfoWindow(title: 'home'),
      position: const LatLng(30.680569, 30.940295));

  Future<void> newPosition() async {
    final GoogleMapController control = await controlMap.future;
    control.animateCamera(CameraUpdate.newCameraPosition(kLake));
    emit(ChangeMapLocation());
  }
}
