import 'package:comp_ia/controller/ProjectController.dart';
import 'package:comp_ia/controller/ProjectViewController.dart';
import 'package:comp_ia/controller/services.dart';
import 'package:comp_ia/view/MainScreen.dart';
import 'package:comp_ia/view/TranslationsList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProjectsViewScreen extends StatelessWidget {
  ProjectsViewScreen({required this.language});

  ProjectViewController controller = ProjectViewController();

  final String language;

  Widget _sortProjectsWidget() {
    return Obx(
      () => Container(
          child: DropdownButton<String>(
        value: controller.dropdownValue.value,
        icon: Icon(Icons.arrow_drop_down),
        items: <String>["A-Z", "Z-A"]
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          controller.setSelected(newValue!);
          if (newValue == "A-Z") {
            controller
                .sortProjectsInAscendingOrder(controller.languageProjectsList);
          } else {
            controller
                .sortProjectsInDescendingOrder(controller.languageProjectsList);
          }
        },
      )),
    );
  }

  Widget projectsViewList() {
    if (controller.isEmpty.value) {
      return Center(
        child: Text(
          "No projects in this category",
          style: TextStyle(fontSize: 24.0),
        ),
      );
    } else {
      return Column(
        children: [
          _sortProjectsWidget(),
          Container(
            height: Get.height * 0.8,
            child: Obx(
              () => ListView.builder(
                  itemCount: controller.languageProjectsList.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        deleteProject(
                            controller.languageProjectsList[index].name);
                        controller.languageProjectsList.removeAt(index);
                      },
                      key: UniqueKey(),
                      child: MaterialButton(
                        padding: EdgeInsets.all(12.0),
                        onPressed: () {

                          Get.put(ProjectController());
                          Get.to(TranslationsList(
                              project: controller.languageProjectsList[index]));
                        },
                        child: Container(
                          width: Get.width * 0.8,
                          height: Get.height * 0.1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Color(0xFFBABABA))),
                          child: Center(
                            child: Text(
                              controller.languageProjectsList[index].name,
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,  // add custom icons also
          ),
        ),
        title: Text(controller.setAppBarTitle(language)),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
              future: controller.getLanguageProjects(language),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return projectsViewList();
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ),
      ),
    );
  }
}
