import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/app_state.dart';
import 'router.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const UnganishaWifiApp());
}

class UnganishaWifiApp extends StatelessWidget {
  const UnganishaWifiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: MaterialApp.router(
        title: 'Unganisha WiFi',
        debugShowCheckedModeBanner: false,
        theme: buildUnganishaTheme(),
        routerConfig: appRouter,
      ),
    );
  }
}
