import 'package:components/src/pages/alerta_page.dart';
import 'package:components/src/pages/animated_container.dart';
import 'package:components/src/pages/avatar_page.dart';
import 'package:components/src/pages/card_page.dart';
import 'package:components/src/pages/home_page.dart';
import 'package:components/src/pages/input_page.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (context) => const HomePage(),
    'alert': (context) => const AlertPage(),
    'avatar': (context) => const AvatarPage(),
    'card': (context) => const CardPage(),
    'animatedContainer': (context) => const AnimatedContainerPage(),
    'inputs': (context) => InputPage()
  };
}
