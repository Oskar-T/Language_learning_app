import 'package:comp_ia/controller/themeController.dart';
import 'package:comp_ia/view/ProjectCreationScreen.dart';
import 'package:comp_ia/view/ProjectViewScreen.dart';
import 'package:comp_ia/view/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:comp_ia/assets.dart';


class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: ThemeController().getThemeMode(),
      home: _home()
    );
  }

  Widget _switch() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color:Color(0xFFBABABA))
        ),
        width: Get.width * 0.41,
        height: Get.height * 0.07,
        child:  MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
          ),
          onPressed: () {
            ThemeController().changeThemeMode();
          },
          child: Text("Change mode"),
        )
    );
  }

// to change Theme:
//ThemeController().changeThemeMode();
  Widget _cards(Color color, String text, String language) {
    return Container(
      width: Get.width * 0.41,
      height: Get.height * 0.35,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        onPressed: () {
            if(text != "Add new\n project") {
              Get.to(() => ProjectsViewScreen(language: language));
            } else {
              Get.to(() => ProjectCreationScreen());
            }
        },
        child: Center(
          child: Text(text, style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 29.0
          ),),
        ),
      ),
    );
  }

  Widget _home() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main page"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                SizedBox(height: 25,),
                _cards(Assets().colors[0], Assets().languages[0], Assets().languageKeys[0]),
                SizedBox(height: 25,),
                _cards(Assets().colors[1], Assets().languages[1], Assets().languageKeys[1])
              ],
            ),
            Column(
              children: [
                SizedBox(height: 25),
                _switch(),
                SizedBox(height: 25),
                _cards(Assets().colors[2], "Add new\n project", "none"),
                 SizedBox(
                   height: 25,
                 ),
                _cards(Assets().colors[3], Assets().languages[2], Assets().languageKeys[2])
              ],
            )
          ],
        ),
      ),
    );
  }
}



