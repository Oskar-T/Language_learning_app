import 'package:comp_ia/model/Translation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class CreateTranslation {

  static Future<dynamic> fetchWord(String word, String lang) async {

    Map<String, String> requestHeaders = {
      "content-type": "application/json",
      "x-rapidapi-key": "fa1c05273fmshf909e1f944fc61dp11ef7djsn36eafab12b7b",
      "x-rapidapi-host": "deep-translate1.p.rapidapi.com",
    };

    String body = json.encode({
        "q": utf8.decode(utf8.encode(word)),
        "source": lang,
        "target": "en"
    });

    var response = await http.post(Uri.parse("https://deep-translate1.p.rapidapi.com/language/translate/v2"),
        headers: requestHeaders, body: body);

    print(response.statusCode);
    if (response.statusCode == 200) {
      return Translation.fromJson(jsonDecode(response.body)).data.translations.translatedText;
    } else {
      throw Exception('Failed to load translation');
    }

  }

}