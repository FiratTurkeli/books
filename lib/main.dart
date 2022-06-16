import 'package:books_app/database/darktheme_provider.dart';
import 'package:books_app/responsive.dart';
import 'package:books_app/router/router.dart';
import 'package:books_app/services/book_services.dart';
import 'package:books_app/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/user_model.dart';

void main()  {
  SharedPreferences.setMockInitialValues({});
  runApp(
      MultiProvider(
          providers:[
            Provider<BookServices>(create: (context)=> BookServices() ),
            ChangeNotifierProvider(create: (context) => User(context)),
            ChangeNotifierProvider<ThemeProvider>(create: (_)=> ThemeProvider()..initialize() )
          ],
          child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context,provider,child){
        return MaterialApp.router(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: provider.themeMode,
            debugShowCheckedModeBanner: false,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            //home: Responsive(destkop: Home(), mobile: Home(), tablet: Home())
        );
      },

    );
  }
}