import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project/map/map_bloc/new_bloc_state.dart';

import '../helper_location.dart';

class BlocMap extends Cubit<BlocMapState> {
  BlocMap() : super(InitializeMapState());
  static BlocMap get(context) => BlocProvider.of(context);

  static Position? position;
  final Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _myCameraPosition = CameraPosition(
    target: LatLng(position!.latitude, position!.longitude),
    bearing: 0.0,
    zoom: 17,
    tilt: 0.0,
  );

  Future<void> getMyCurrentLocation() async {
    await LocationHelper.getCurrentLocation();
    position = await Geolocator.getLastKnownPosition().whenComplete(() {
      // setState(() {});
    });
    emit(GetMyCurrentLocation());
  }

  Marker mMarker = const Marker(
      markerId: MarkerId('positionOld'),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(title: 'حضانات مستشفي تلا المركزي'),
      position: LatLng(30.68468960025776, 30.950258077911204));

  Marker lLake = Marker(
      markerId: const MarkerId('kLake'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: const InfoWindow(
        title:
            'مستشفى الجمعية الشرعية للأطفال المبتسرين وحديثي الولادة(فرع شبين الكوم)',
      ),
      position: const LatLng(30.566007802710622, 31.003274406612015));

  Marker anotherLake = Marker(
      markerId: const MarkerId('kLake1'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: const InfoWindow(
        title: 'حضانات مستشفي بركة السبع',
      ),
      position: const LatLng(30.63556566863241, 31.090300845741908));

  Marker hospital = const Marker(
      markerId: MarkerId('positionOld1'),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
          title:
              'مستشفى الجمعية الشرعية للاطفال المبتسرين وحديثى الولادة(فرع الباجور)'),
      position: LatLng(30.427208867294507, 31.04418245458604));

  Marker hospitalNew = Marker(
      markerId: const MarkerId('kLake2'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: const InfoWindow(
        title: 'حضانات مستشفي شبين الكوم التعليمي',
      ),
      position: const LatLng(30.574689955178687, 31.012118722088793));

  Marker anotherHospital = Marker(
      markerId: const MarkerId('kLake3'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: const InfoWindow(
        title: 'حضانات مستشفي قويسنا المركزي',
      ),
      position: const LatLng(30.552845181564265, 31.138939791404646));

  Marker hospital7 = const Marker(
      markerId: MarkerId('positionOld2'),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(title: 'حضانات مستشفى الباجور'),
      position: LatLng(30.432908982790973, 31.02921514468324));

  Marker hospital8 = Marker(
      markerId: const MarkerId('kLake4'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: const InfoWindow(
        title: 'حضانات مستشفي السادات المركزي',
      ),
      position: const LatLng(30.367358113357238, 30.505989041491624));

  Marker hospital9 = Marker(
      markerId: const MarkerId('kLake5'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: const InfoWindow(
        title: 'حضانات مستشفي منوف العام',
      ),
      position: const LatLng(30.47204027362369, 30.927744353136436));

  Marker hospital10 = const Marker(
      markerId: MarkerId('positionOld3'),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(title: 'حضانات مستشفي اشمون العام'),
      position: LatLng(30.296018054178056, 30.98903153743087));

  Marker hospital11 = Marker(
      markerId: const MarkerId('kLake6'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: const InfoWindow(
        title: 'حضانات مستشفي سرس الليان المركزي',
      ),
      position: const LatLng(30.44251807408193, 30.96086503118979));

  Marker hospital12 = Marker(
      markerId: const MarkerId('kLake7'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: const InfoWindow(
        title: 'حضانات مستشفي الشهداء المركزي',
      ),
      position: const LatLng(30.59683293125478, 30.9046417512878));

  Marker hospital13 = const Marker(
      markerId: MarkerId('positionOld4'),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(title: 'مركز تبارك للأطفال'),
      position: LatLng(30.11875176101537, 31.320729370564067));

  Marker hospital14 = Marker(
      markerId: const MarkerId('kLake8'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: const InfoWindow(
        title: 'مركز المنارة التخصصى لحديثى الولادة',
      ),
      position: const LatLng(30.118484174851268, 31.32043337300127));

  Marker hospital15 = Marker(
      markerId: const MarkerId('kLake9'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: const InfoWindow(
        title:
            'مستشفى الجمعية الشرعية للاطفال المبتسرين وحديثى الولادة(فرع الماظة-القاهرة)',
      ),
      position: const LatLng(30.083156210945962, 31.354493647593657));

  Marker hospital16 = const Marker(
      markerId: MarkerId('positionOld5'),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
          title:
              'مستشفى الجمعية الشرعية للاطفال المبتسرين وحديثى الولادة(فرع الحي السادس القاهرة)'),
      position: LatLng(30.04791938287215, 31.31356655149757));

  Marker hospital17 = Marker(
      markerId: const MarkerId('kLake10'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: const InfoWindow(
        title:
            'مستشفى الجمعية الشرعية للاطفال المبتسرين وحديثى الولادة(فرع عين شمس- القاهرة)',
      ),
      position: const LatLng(30.136947945925815, 31.367895078606384));

  Marker hospital18 = Marker(
      markerId: const MarkerId('kLake11'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: const InfoWindow(
        title:
            'مركز الاسراء الطبى للاطفال و الحضانات لحديثى الولادة والمبتسرين',
      ),
      position: const LatLng(30.008143781365394, 31.309437893253282));

  Marker hospital19 = const Marker(
      markerId: MarkerId('positionOld6'),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow:
          InfoWindow(title: 'د. شهيرة لويز - استشارى طب اطفال وحديثى الولادة'),
      position: LatLng(29.98439261419109, 31.28498639745618));

  Marker hospital20 = Marker(
      markerId: const MarkerId('kLake12'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: const InfoWindow(
        title:
            'د. نشوة حسين العشرى - استشارى طب اطفال وحديثى الولادة والرضاعة الطبيعية',
      ),
      position: const LatLng(29.973989313786646, 31.28053687545031));

  Marker hospital21 = Marker(
      markerId: const MarkerId('kLake13'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: const InfoWindow(
        title:
            'مستشفى الجمعية الشرعية للاطفال المبتسرين وحديثى الولادة(فرع شبرا الخيمة)',
      ),
      position: const LatLng(30.1233281847178, 31.26093435119303));

  Marker hospital22 = const Marker(
      markerId: MarkerId('positionOld7'),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow:
          InfoWindow(title: 'مركز حياة لرعاية حديثى الولادة والمبتسرين'),
      position: LatLng(30.791849022546675, 30.99442753738349));

  Marker hospital23 = Marker(
      markerId: const MarkerId('kLake15'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: const InfoWindow(
        title:
            'مستشفى الجمعية الشرعية للاطفال المبتسرين وحديثى الولادة(ايتاي البارود)',
      ),
      position: const LatLng(30.823681303102756, 30.81452307784013));

  Marker hospital24 = Marker(
      markerId: const MarkerId('kLake16'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: const InfoWindow(
        title:
            'مستشفى الجمعية الشرعية للاطفال المبتسرين وحديثى الولادة فرع اسكندرية)',
      ),
      position: const LatLng(31.118223715014565, 29.792431406746726));

  Marker hospital25 = Marker(
      markerId: const MarkerId('kLake17'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: const InfoWindow(
        title:
            'مستشفى الجمعية الشرعية للاطفال المبتسرين وحديثى الولادة(فرع كفر الشيخ)',
      ),
      position: const LatLng(31.11088609642273, 30.938184808462147));

  Marker hospital26 = const Marker(
      markerId: MarkerId('positionOld8'),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow:
          InfoWindow(title: 'المركز الطبى التخصصى للاطفال وحديثى الولادة'),
      position: LatLng(27.179640495499928, 31.18842327656822));

  Marker hospital27 = Marker(
      markerId: const MarkerId('kLake18'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: const InfoWindow(
        title:
            'مستشفى الجمعية الشرعية للاطفال المبتسرين وحديثى الولادة(فرع سوهاج)',
      ),
      position: const LatLng(26.560327675317097, 31.691802015395293));
  Marker hospital28 = Marker(
      markerId: const MarkerId('kLake19'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: const InfoWindow(
        title:
            'مستشفى الجمعية الشرعية للاطفال المبتسرين وحديثى الولادة(فرع حي السويس)',
      ),
      position: const LatLng(30.082701716307582, 31.354481933004045));

  Widget buildMap() {
    return GoogleMap(
        initialCameraPosition: _myCameraPosition,
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          mMarker,
          lLake,
          anotherLake,
          hospital,
          hospitalNew,
          anotherHospital,
          hospital7,
          hospital8,
          hospital9,
          hospital10,
          hospital11,
          hospital12,
          hospital13,
          hospital14,
          hospital15,
          hospital16,
          hospital17,
          hospital18,
          hospital19,
          hospital20,
          hospital21,
          hospital22,
          hospital23,
          hospital24,
          hospital25,
          hospital26,
          hospital27,
          hospital28,
        });
  }

  Future<void> goToMyCurrentPosition() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_myCameraPosition));
    emit(GoToMyCurrentPosition());
  }
}
