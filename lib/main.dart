import 'package:camnote/RouteGenerator.dart';
import 'package:camnote/screens/Home.dart';
import 'package:camnote/state/CameraState.dart';
import 'package:camnote/state/NotesState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),

          //home: Home(),
          onGenerateRoute: RouteGenerator.routeGenerator,
        ),
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => NotesState(),
          ),
        ]);
  }
}
