import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/component/screensfree/screensfree.dart';
import 'package:graduation_project/health_today/page1.dart';
import 'package:bloc/bloc.dart';
import 'package:graduation_project/map/map.dart';
import 'package:graduation_project/map/map_bloc/bloc_map.dart';
import 'bloc/bloc_obsarve/bloc_obsarve.dart';
import 'health_today/page2.dart';
import 'health_today/page3.dart';
import 'health_today/page4.dart';
import 'map/mapfile.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  BlocOverrides.runZoned(
    () {
      BlocMap();
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BlocMap()..getMyCurrentLocation()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              color: Colors.white,
              elevation: 0.0,
              titleSpacing: 4,
              toolbarTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
              ),
              iconTheme: IconThemeData(
                color: Colors.blue,
                size: 17,
              ),
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 19,
                overflow: TextOverflow.ellipsis,
                letterSpacing: 2,
              ),
              actionsIconTheme: IconThemeData(
                color: Colors.purple,
              ),
            ),
            bottomNavigationBarTheme:
                const BottomNavigationBarThemeData(elevation: 0.0)),
        home: const MapFileRun(),
      ),
    );
  }
}
