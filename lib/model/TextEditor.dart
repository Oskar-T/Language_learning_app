import 'dart:convert';

class EditedText {
  // method returns a list of Strings, where all elements are written
  // in lower case and with removed punctuation

  void separateText(List list) {

    for (int i = 0; i < list.length; i++) {
      list[i] = list[i] + "!!";
    }
  }

  List<String> formatText(String text) {

    text = text.toLowerCase();
    var a = utf8.encode(text.replaceAll(RegExp("[-+.^:,?!]"), "").replaceAll("\n", " "));
    return utf8.decode(a).split(" ");

  }

  // method deletes repeating words, but saves one copy
  List<String> deleteRepetitions(List<String> wordsList) {
    for(int i = 0; i < wordsList.length; i++) {
      for(int k = i + 1; k < wordsList.length; k++) {
        if(wordsList[i] == wordsList[k]) {
          wordsList.removeAt(k);
          k = k - 1;
        }
      }
    }
    return wordsList;
  }


}