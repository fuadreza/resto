import 'package:flutter/material.dart';
import 'package:resto/feature/resto/presentation/pages/home/home_page.dart';
import 'package:resto/injection/injection.dart' as di;
import 'package:resto/core/route/main_route.dart' as router;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resto',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      onGenerateRoute: router.generateRoute,
      initialRoute: router.HomePageRoute,
    );
  }
}