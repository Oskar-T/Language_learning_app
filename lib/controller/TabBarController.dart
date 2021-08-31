import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBarController extends GetxController with SingleGetTickerProviderMixin {

  late TabController tabBarController;

  @override
  void onInit() {

    tabBarController = TabController(length: 2, vsync: this);
    super.onInit();
  }

}