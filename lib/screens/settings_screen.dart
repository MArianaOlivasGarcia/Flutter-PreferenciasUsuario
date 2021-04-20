import 'package:flutter/material.dart';
import 'package:preferencias/share_prefs/preferencias_usuario.dart';
import 'package:preferencias/widgets/menu_widget.dart';

class SettingsScreen extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _colorSecundario;
  int _genero;
  /* String _nombre = ''; */

  TextEditingController _textController;

  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    
    prefs.ultimaPagina = SettingsScreen.routeName;

    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;

    _textController = new TextEditingController(text: prefs.nombre);

    super.initState();
  }

  _setSelectedRadio(int valor) {
    prefs.genero = valor;
    _genero = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Preferencias de Usuario'),
          backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: [
            Container(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  'Settings',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                )),
            Divider(),
            SwitchListTile(
                value: _colorSecundario,
                title: Text('Color secundario'),
                onChanged: (value) {
                  _colorSecundario = value;
                  prefs.colorSecundario = value;
                  setState(() {});
                }),
            RadioListTile(
                value: 1,
                title: Text('Masculino'),
                groupValue: _genero,
                onChanged: _setSelectedRadio),
            RadioListTile(
                value: 2,
                title: Text('Femenino'),
                groupValue: _genero,
                onChanged: _setSelectedRadio),
            Divider(),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                      labelText: 'Nombre',
                      helperText: 'Nombre de la persona usando el teléfono'),
                  onChanged: (value) {
                    prefs.nombre = value;
                  },
                ))
          ],
        ));
  }
}
