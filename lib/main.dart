import 'package:flutter/material.dart';
import 'package:preferencias/screens/home_screen.dart';
import 'package:preferencias/screens/settings_screen.dart';
import 'package:preferencias/share_prefs/preferencias_usuario.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        initialRoute: prefs.ultimaPagina,
        routes: {
          HomeScreen.routeName: (BuildContext context) => HomeScreen(),
          SettingsScreen.routeName: (BuildContext context) => SettingsScreen(),
        });
  }
}
