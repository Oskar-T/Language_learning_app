import 'package:comp_ia/controller/services.dart';
import 'package:comp_ia/model/Project.dart';
import 'package:get/get.dart';
import 'package:comp_ia/controller/SelectionSort.dart';

class ProjectViewController extends GetxController {

  RxList<Project> languageProjectsList = List<Project>.empty(growable: true).obs;
  RxBool isEmpty = true.obs;
  RxString dropdownValue = "A-Z".obs;

  void setSelected(String value){
    dropdownValue.value = value;
  }


  void sortProjectsInAscendingOrder(List<Project> languageProjectsList) {

    SelectionSort selectionSort = SelectionSort();
    selectionSort.selectionSortInAscendingOrder(languageProjectsList);

  }

  void sortProjectsInDescendingOrder(List<Project> languageProjectsList) {

    SelectionSort selectionSort = SelectionSort();
    selectionSort.selectionSortInDescendingOrder(languageProjectsList);

  }

  String setAppBarTitle(String language) {
    if(language == "fr") {
      return "French";
    } else if (language == "ru") {
      return "Russian";
    } else {
      return "Greek";
    }

  }

  Future<List<Project>> getProjects() async {
    List<Project> projectsList = await projects();
    return projectsList;
  }

  Future<List<Project>> getLanguageProjects(String language) async {
    List<Project> projectsList = await getProjects();
      for (int i = 0; i < projectsList.length; i++) {
        if (language == projectsList[i].language) {
          languageProjectsList.add(projectsList[i]);
        }
      }
      if(languageProjectsList.isEmpty) {
        isEmpty = true.obs;
      }  else {
        isEmpty = false.obs;
      }
      return languageProjectsList;
  }


}