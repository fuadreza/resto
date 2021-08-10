import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:resto/core/route/main_route.dart' as router;
import 'package:resto/core/route/navigation_service.dart';
import 'package:resto/core/theme/custom_theme.dart';
import 'package:resto/core/utils/connectivity_util.dart';
import 'package:resto/core/utils/shared_pref_util.dart';
import 'package:resto/feature/resto/presentation/pages/home/home_page.dart';
import 'package:resto/injection/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await connectivity.init();
  await sp.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final brightness = SchedulerBinding.instance?.window.platformBrightness;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resto',
      darkTheme: CustomTheme().dark,
      theme: CustomTheme().light,
      themeMode: brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(),
      navigatorKey: navigatorKey,
      onGenerateRoute: router.generateRoute,
      initialRoute: router.HomePageRoute,
    );
  }
}
