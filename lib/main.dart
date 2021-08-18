import 'package:flutter/material.dart';
import 'view/MainScreen.dart';
import 'package:get_storage/get_storage.dart';


void main() async {
  // initializing database for preferred theme
  await GetStorage.init();
  //binding is required for the widget recognition by GetX library
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainScreen());
}
