import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project/map/helper_location.dart';
import 'package:graduation_project/map/map_bloc/bloc_map.dart';
import 'package:graduation_project/map/map_bloc/new_bloc_state.dart';

class MapFileRun extends StatelessWidget {
  const MapFileRun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlocMap, BlocMapState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocMap.get(context);
        return Scaffold(
          body: Stack(
            children: [
              BlocMap.position != null
                  ? cubit.buildMap()
                  : const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: cubit.goToMyCurrentPosition,
            child: const Icon(
              Icons.place,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
