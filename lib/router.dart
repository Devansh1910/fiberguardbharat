import 'package:fiberguardbharat/home/lang_screen.dart';
import 'package:fiberguardbharat/screens/login.dart';
import 'package:fiberguardbharat/screens/registration.dart';

import 'package:fiberguardbharat/news/home_news_screen.dart';
import 'package:fiberguardbharat/news/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: LangScreen()),
  '/OpenNewsAll': (_) => const MaterialPage(child: NewsScreen()),
  '/HomeNews': (_) => const MaterialPage(child: HomeNewsPage()),
  '/Registrationseller': (_) => const MaterialPage(child: RegistrationSeller()),
  '/LoginScreen': (_) => MaterialPage(child: LoginScreen()),
});

final loggedInRoute = RouteMap(routes: const {});
