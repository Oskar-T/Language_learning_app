import 'package:comp_ia/controller/TabBarController.dart';
import 'package:comp_ia/view/TranslationsList.dart';
import 'package:flutter/material.dart';
import 'package:comp_ia/model/Project.dart';
import 'package:get/get.dart';


class TabBarWidget extends StatelessWidget {

  TabBarWidget({required this.project});
  Project project;
  final controller = Get.put(TabBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.name),
        bottom: TabBar(
          controller: controller.tabBarController,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.list_sharp),
            ),
            Tab(
              icon: Icon(Icons.text_snippet_rounded),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller.tabBarController,
        children: <Widget>[
          TranslationsList(project: project),
          Center(
            child: Text("It's rainy here"),
          ),
        ],
      ),
    );
  }


}