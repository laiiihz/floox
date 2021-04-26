const genMain = '''
import 'package:flutter/material.dart';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'provider/app_provider.dart';
import 'const/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppProvider()),
        ],
        child: GetMaterialApp(
          //TODO set your own app name
          // use onGenerateTitle to generate title
          title: 'Floox',
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          theme: AppTheme.lightTheme,
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.light,
          //TODO add home page
          home: Scaffold(),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('zh'),
          ],
        ),
      ),
    );
  }
}

''';
