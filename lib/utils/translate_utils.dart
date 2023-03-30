import 'package:google_ml_kit/google_ml_kit.dart';

class TranslateUtils {
  TranslateLanguage getString (String code) {
  switch (code) {
    case 'af':
      return TranslateLanguage.afrikaans;
    case 'sq':
      return TranslateLanguage.albanian;
    case 'ar':
      return TranslateLanguage.arabic;
    case 'be':
      return TranslateLanguage.belarusian;
    case 'bn':
      return TranslateLanguage.bengali;
    case 'bg':
      return TranslateLanguage.bulgarian;
    case 'ca':
      return TranslateLanguage.catalan;
    case 'zh':
      return TranslateLanguage.chinese;
    case 'hr':
      return TranslateLanguage.croatian;
    case 'cs':
      return TranslateLanguage.czech;
    case 'da':
      return TranslateLanguage.danish;
    case 'nl':
      return TranslateLanguage.dutch;
    case 'en':
      return TranslateLanguage.english;
    case 'eo':
      return TranslateLanguage.esperanto;
    case 'et':
      return TranslateLanguage.estonian;
    case 'fi':
      return TranslateLanguage.finnish;
    case 'fr':
      return TranslateLanguage.french;
    case 'gl':
      return TranslateLanguage.galician;
    case 'ka':
      return TranslateLanguage.georgian;
    case 'de':
      return TranslateLanguage.german;
    case 'el':
      return TranslateLanguage.greek;
    case 'gu':
      return TranslateLanguage.gujarati;
    case 'ht':
      return TranslateLanguage.haitian;
    case 'he':
      return TranslateLanguage.hebrew;
    case 'hi':
      return TranslateLanguage.hindi;
    case 'hu':
      return TranslateLanguage.hungarian;
    case 'is':
      return TranslateLanguage.icelandic;
    case 'id':
      return TranslateLanguage.indonesian;
    case 'ga':
      return TranslateLanguage.irish;
    case 'it':
      return TranslateLanguage.italian;
    case 'ja':
      return TranslateLanguage.japanese;
    case 'kn':
      return TranslateLanguage.kannada;
    case 'ko':
      return TranslateLanguage.korean;
    case 'lv':
      return TranslateLanguage.latvian;
    case 'lt':
      return TranslateLanguage.lithuanian;
    case 'mk':
      return TranslateLanguage.macedonian;
    case 'ms':
      return TranslateLanguage.malay;
    case 'mt':
      return TranslateLanguage.maltese;
    case 'mr':
      return TranslateLanguage.marathi;
    case 'no':
      return TranslateLanguage.norwegian;
    case 'fa':
      return TranslateLanguage.persian;
    case 'pl':
      return TranslateLanguage.polish;
    case 'pt':
      return TranslateLanguage.portuguese;
    case 'ro':
      return TranslateLanguage.romanian;
    case 'ru':
      return TranslateLanguage.russian;
    case 'sk':
      return TranslateLanguage.slovak;
    case 'sl':
      return TranslateLanguage.slovenian;
    case 'es':
      return TranslateLanguage.spanish;
    case 'sw':
      return TranslateLanguage.swahili;
    case 'sv':
      return TranslateLanguage.swedish;
    case 'tl':
      return TranslateLanguage.tagalog;
    case 'ta':
      return TranslateLanguage.tamil;
    case 'te':
      return TranslateLanguage.telugu;
    case 'th':
      return TranslateLanguage.thai;
    case 'tr':
      return TranslateLanguage.turkish;
    case 'uk':
      return TranslateLanguage.ukrainian;
    case 'ur':
      return TranslateLanguage.urdu;
    case 'vi':
      return TranslateLanguage.vietnamese;
    case 'cy':
      return TranslateLanguage.welsh;
    default:
      return TranslateLanguage.french;
  }
}
}