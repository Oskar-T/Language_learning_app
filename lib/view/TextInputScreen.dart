import 'package:comp_ia/controller/ProjectController.dart';
import 'package:comp_ia/model/Project.dart';
import 'package:comp_ia/view/TranslationsList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextInputScreen extends StatelessWidget {
  ProjectController controller = Get.find();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.name.value),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xFFBABABA))),
            child: Container(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                controller: textEditingController,
                autofocus: false,
                style: TextStyle(fontSize: 25.0),
                keyboardType: TextInputType.name,
                maxLines: 300,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if(textEditingController.text.length > 1) {
            controller.text = textEditingController.text;
            Project project = await controller.createProject();
            Get.to(() => TranslationsList(project: project));
            textEditingController.clear();
          } else {
            Get.snackbar("Alert", "Translate a proper text");
          }
        },
        child: Icon(Icons.arrow_right_alt),
      ),
    );
  }
}
