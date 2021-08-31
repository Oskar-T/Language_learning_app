import 'package:comp_ia/model/Project.dart';
import 'package:comp_ia/view/ProjectViewScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:comp_ia/controller/ProjectController.dart';
import 'package:get/get.dart';
import 'package:comp_ia/model/TextEditor.dart';
import 'package:get/route_manager.dart';

class TranslationsList extends StatelessWidget {
  TranslationsList({required this.project});

  final Project project;
  ProjectController controller = Get.find();

  Widget _wordsView() {

    List<String> wordsList = project.text.split("!!");
    List<String> translationList = project.translatedText.split("!!");
    print(wordsList);
    print(translationList);


    return ListView.builder(
      itemCount: wordsList.length-1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text(wordsList[index].trim(), style: TextStyle(
                        fontSize: 24
                      ),),
                    ),
                    //68
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text(translationList[index].trim(), style: TextStyle(
                        fontSize: 24
                      ),),
                    )
                  ],
                ),
              ),
              Divider(thickness: 1,)
            ],
          );
        }
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.name),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.back();
        },
        child: Icon(Icons.arrow_back),
      ),

      body: Container(
        padding: EdgeInsets.all(12.0),
        child: _wordsView(),
      ),
    );
  }
}
