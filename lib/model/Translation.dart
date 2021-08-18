import 'dart:convert';

Translation translationFromJson(String str) => Translation.fromJson(json.decode(str));

String translationToJson(Translation data) => json.encode(data.toJson());

class Translation {
  Translation({
    required this.data,
  });

  Data data;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.translations,
  });

  Translations translations;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    translations: Translations.fromJson(json["translations"]),
  );

  Map<String, dynamic> toJson() => {
    "translations": translations.toJson(),
  };
}

class Translations {
  Translations({
    required this.translatedText,
  });

  String translatedText;

  factory Translations.fromJson(Map<String, dynamic> json) => Translations(
    translatedText: json["translatedText"],
  );

  Map<String, dynamic> toJson() => {
    "translatedText": translatedText,
  };
}
