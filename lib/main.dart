import 'package:flutter/material.dart';
import 'package:flutter_stok_takip/core/models/customer/customer_model.dart';
import 'package:flutter_stok_takip/core/models/product/product_model.dart';
import 'package:flutter_stok_takip/core/services/navigation_service.dart';
import 'package:flutter_stok_takip/locator.dart';
import 'package:flutter_stok_takip/ui/screens/common/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(CustomerModelAdapter());
  Hive.registerAdapter(ProductModelAdapter());

  setupLocator();

  runApp(StokTakipApp());
}

class StokTakipApp extends StatelessWidget {
  const StokTakipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.globalKey,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.black,
        brightness: Brightness.dark,
      ),
      home: HomeScreen(),
    );
  }
}
