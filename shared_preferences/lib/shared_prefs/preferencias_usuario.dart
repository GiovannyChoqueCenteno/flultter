import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _preferencias =
      PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _preferencias;
  }

  PreferenciasUsuario._internal();

  late SharedPreferences _prefs;

  bool? _colorSecundario;
  int? _genero;
  String? _nombre;
  String? _lastPath;
  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  int get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }

  bool get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }

  String get nombre {
    return _prefs.getString('nombre') ?? '';
  }

  set nombre(String value) {
    _prefs.setString('nombre', value);
  }

  String get lastPath => _prefs.getString('lastPath') ?? 'home';

  set lastPath(String value) {
    _prefs.setString('lastPath', value);
  }
}
