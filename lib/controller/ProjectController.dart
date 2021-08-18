import 'package:get/get.dart';
import 'package:comp_ia/model/createTranslation.dart';
import 'package:comp_ia/model/TextEditor.dart';
import 'package:comp_ia/model/Project.dart';
import 'services.dart';

class ProjectController extends GetxController {


  EditedText textEditor = EditedText();
  List<String> wordsList = [];
  var name = "".obs;
  var language = "fr".obs;
  var text = "";
  var translation = "";

  Future<String> translateText() async {
    wordsList = textEditor.formatText(text);
    wordsList = textEditor.deleteRepetitions(wordsList);
    textEditor.separateText(wordsList);
    text = wordsList.join(" ");
    translation = await CreateTranslation.fetchWord(text, language.value);

    return translation;
  }

    Future<Project> createProject() async {
      translation = await translateText();
      Project project = Project(
          name: this.name.value,
          language: this.language.value,
          text: this.text,
          translatedText: translation);
      if(GetPlatform.isAndroid || GetPlatform.isIOS) {
        await saveProject(project);
      }
      return project;
    }

     Future<void> saveProject(Project project) async {
       await insertProject(project);
     }



  }

