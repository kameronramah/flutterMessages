// A virer
  import 'dart:typed_data';
  import 'dart:ui';
  import 'package:google_ml_kit/google_ml_kit.dart';
  import 'package:google_mlkit_translation/google_mlkit_translation.dart';
  import 'package:m2tldigitalcampus/utils/translate_utils.dart';


class TranslateController {

  // attribus
  String text = "Je suis roi";
  late LanguageIdentifier identifier;

  TranslateController () {
    identifier = LanguageIdentifier(confidenceThreshold: 0.4);
  }


  String getDeviceLanguage() {
      return  window.locale.languageCode;
  } 


  //  String getLang () {
      
  // }
  late final onDeviceTranslator = OnDeviceTranslator(sourceLanguage: TranslateLanguage.french, targetLanguage: TranslateUtils().getString(getDeviceLanguage()));
 
  Future <String> translate () async {
    final result = await onDeviceTranslator.translateText(text);
    return result;
  }


  
  }

