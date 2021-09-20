import 'package:turkish/turkish.dart';

class StringHelper {
  static String clearSpaces(String text) {
    return text.replaceAll(" ", "");
  }

  static String replaceAll(String value, String replaceText) {
    return value.replaceAll(replaceText, "");
  }

  static String getWebUrlText(String value) {
    return turkish
        .toLowerCase(value)
        .replaceAll("web:", "")
        .replaceAll(":", "")
        .replaceAll(" ", "");
  }

  static String getMailText(String value) {
    return turkish
        .toLowerCase(value)
        .replaceAll("mail:", "")
        .replaceAll(":", "")
        .replaceAll(" ", "");
  }

  static String getPhoneText(String value) {
    return turkish
        .toUpperCase(value)
        .replaceAll("+", "")
        .replaceAll("-", "")
        .replaceAll(".", "")
        .replaceAll(" ", "")
        .replaceAll("A", "")
        .replaceAll("B", "")
        .replaceAll("C", "")
        .replaceAll("Ç", "")
        .replaceAll("D", "")
        .replaceAll("E", "")
        .replaceAll("F", "")
        .replaceAll("G", "")
        .replaceAll("Ğ", "")
        .replaceAll("H", "")
        .replaceAll("I", "")
        .replaceAll("İ", "")
        .replaceAll("J", "")
        .replaceAll("K", "")
        .replaceAll("L", "")
        .replaceAll("M", "")
        .replaceAll("N", "")
        .replaceAll("O", "")
        .replaceAll("Ö", "")
        .replaceAll("P", "")
        .replaceAll("R", "")
        .replaceAll("S", "")
        .replaceAll("Ş", "")
        .replaceAll("T", "")
        .replaceAll("U", "")
        .replaceAll("Ü", "")
        .replaceAll("V", "")
        .replaceAll("Y", "")
        .replaceAll("Z", "")
        .replaceAll("Q", "")
        .replaceAll("W", "");
  }
}
