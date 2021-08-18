import 'package:comp_ia/controller/ProjectController.dart';
import 'package:comp_ia/controller/toggleButtonsController.dart';
import 'package:comp_ia/view/TextInputScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:comp_ia/assets.dart';

class ProjectCreationScreen extends StatelessWidget {

  TextEditingController textEditingController = TextEditingController();
  final ProjectController projectController = Get.put(ProjectController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Creating project"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [_inputText(), _languageSelection()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(textEditingController.text.length > 2) {
            projectController.name = textEditingController.text.obs;
            Get.to(() => TextInputScreen());
            textEditingController.clear();
          } else {
            Get.snackbar("Alert", "Select a proper name for your project");
          }
        },
        child: Icon(Icons.arrow_right_alt),
      ),
    );
  }

  Widget _inputText() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0xFFBABABA))),
      height: Get.height * 0.15,
      width: Get.width * 0.8,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Name:"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textEditingController,
              autofocus: false,
              style: TextStyle(fontSize: 25.0),
              keyboardType: TextInputType.name,
              maxLines: 1,
            ),
          )
        ],
      ),
    );
  }

  Widget _languages(String text, Color color) {
    return Container(
      padding: EdgeInsets.all(8.0),
      height: Get.height * 0.1,
      width: Get.width * 0.6,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget _toggleButtons() {

    return GetBuilder<ToggleButtonsController>(
        init: ToggleButtonsController(),
        builder: (value) => ToggleButtons(
          renderBorder: false,
          direction: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _languages("French", Assets().colors[0]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _languages("Russian", Assets().colors[1]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _languages("Greek", Assets().colors[2]),
            )
          ],
          onPressed: (int index) {
            for (int buttonIndex = 0; buttonIndex < value.selections.length; buttonIndex++) {
              if (buttonIndex == index) {
                value.selections[buttonIndex] = true;
                projectController.language = Assets().languageKeys[buttonIndex].obs;
                print(projectController.language);
                value.update();
              } else {
                value.selections[buttonIndex] = false;
                value.update();
              }
            }
          },
          isSelected: value.selections,
        ),
    );
  }

  Widget _languageSelection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Color(0xFFBABABA),
        ),
      ),
      height: Get.height * 0.55,
      width: Get.width * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Text("Translate from"), _toggleButtons()],
      ),
    );
  }
}
