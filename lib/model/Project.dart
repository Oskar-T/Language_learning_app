class Project {
  final String name;
  final String language;
  final String text;
  final String translatedText;

  Project({
    required this.name,
    required this.language,
    required this.text,
    required this.translatedText
  });


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'language': language,
      'text': text,
      'translatedText': translatedText
    };
  }

  @override
  String toString() {
    return "name: $name language: $language text: $text translatedText: $translatedText";
  }

}
