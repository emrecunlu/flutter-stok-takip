import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/init/dependencies.dart';
import 'package:flutter_stok_takip/screens/home_screen.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(StokApp());
}

class StokApp extends StatelessWidget {
  const StokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        brightness: Brightness.dark,
      ),
      initialBinding: Dependencies(),
      home: HomeScreen(),
    );
  }
}
