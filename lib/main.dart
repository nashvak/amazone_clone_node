import 'package:ecommerce_app/admin_panel/admin_screen.dart';
import 'package:ecommerce_app/constants/global_variables.dart';
import 'package:ecommerce_app/providers/auth/user_provider.dart';
// import 'package:ecommerce_app/screens/auth/auth_screen.dart';
import 'package:ecommerce_app/common/bottonbar.dart';
import 'package:ecommerce_app/router/router.dart';
import 'package:ecommerce_app/screens/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
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
          // home: const BottomBar(),
          home: Provider.of<UserProvider>(context).user.token.isNotEmpty
              ? Provider.of<UserProvider>(context).user.type == 'user'
                  ? const BottomBar()
                  : const AdminScreen()
              : const AuthScreen()),
    );
  }
}
