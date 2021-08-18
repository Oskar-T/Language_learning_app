import 'package:comp_ia/model/Project.dart';

class SelectionSort {

  void selectionSortInAscendingOrder(List<Project> list) {
    // Find the string reference that should go in each cell of
    // the array, from cell 0 to the end
    for (int j = 0; j < list.length - 1; j++) {
      // Find min: the index of the string reference that should go into cell j.
      // Look through the unsorted strings (those at j or higher) for the one that is first in lexicographic order
      int min = j;
      for (int k = j + 1; k < list.length; k++) {
        if (list[k].name.compareTo(list[min].name) < 0) {
          min = k;
        }
      }
      // Swap the reference at j with the reference at min
      Project temp = list[j];
      list[j] = list[min];
      list[min] = temp;
    }
  }

  void selectionSortInDescendingOrder(List<Project> list) {

    // Find the string reference that should go in each cell of
    // the array, from cell 0 to the end
    for (int j = 0; j < list.length - 1; j++) {
      // Find min: the index of the string reference that should go into cell j.
      // Look through the unsorted strings (those at j or higher) for the one that is first in lexicographic order
      int min = j;
      for (int k = j + 1; k < list.length; k++) {
        if (list[k].name.toLowerCase().compareTo(list[min].name.toLowerCase()) > 0) {
          min = k;
        }
      }
      // Swap the reference at j with the reference at min
      Project temp = list[j];
      list[j] = list[min];
      list[min] = temp;
    }


  }

}
