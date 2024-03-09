import 'package:ecommerce_app/admin_panel/admin_screen.dart';
import 'package:ecommerce_app/constants/global_variables.dart';
import 'package:ecommerce_app/user_panel/providers/auth/user_provider.dart';
import 'package:ecommerce_app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'common/bottonbar.dart';
import 'user_panel/screens/auth/auth_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        // useMaterial3: true,
      ),
      onGenerateRoute: ((settings) => generateRoute(settings)),
      home: const AdminScreen(),
      // home: Provider.of<UserProvider>(context).user.token.isNotEmpty
      //     ? Provider.of<UserProvider>(context).user.type == 'user'
      //         ? const BottomBar()
      //         : const AdminScreen()
      //     : const AuthScreen(),
    );
  }
}
