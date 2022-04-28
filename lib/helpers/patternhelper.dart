import 'package:flutter/cupertino.dart';

class PatternHelper {
  String getMailDomain(String value) {
    Pattern pattern = r"[@][\.a-z0-9]{2,50}";

    var matchResult = regexResult(pattern, value);

    if (matchResult.isNotEmpty && matchResult != "null") {
      debugPrint("Mail Domain: $matchResult");
    }

    return matchResult;
  }

  String getWebDomain(String value) {
    Pattern pattern = r"(www)(\.)[\.a-z0-9]*(\.)[a-z]+";

    var matchResult = regexResult(pattern, value);

    if (matchResult.isNotEmpty && matchResult != "null") {
      debugPrint("Mail Domain: $matchResult");
    }

    return matchResult;
  }

  String getWebUrl(String value) {
    Pattern pattern =
//        r"((W:)?((http|https):\/\/)?[w]{3}[\.]{1}[a-zA-Z0-9_-]{1,}[\.]{1}[a-z]{1,5}[\.]?[a-z]{1,2})";
        // r"(www.)?\w+[a-z0-9][.](com.tr|com|net.tr|net)(\.[a-z]{2,3})?";
        r"(www.)?(\w+[a-z]{2,50}[\.][a-z0-9]{2,50})(\.[a-z]\w{1,3})?";

    return regexResult(pattern, value);
  }

  String getIndustirialArea(String value) {
    Pattern pattern = r"\w+(\s|[\.])+([oO0]\.S\.B\.)";

    return regexResult(pattern, value);
  }

  String getAddress(String value) {
    Pattern pattern =
        r"[a-zçşğüıö\.]*(\s|[\.])+(i[sşSŞ] merkezi|[Iıİi][SsŞş] mrkz\.|bI\.|blok|sitesi|plaza|Rezidans|Dist.)|(Headquarters)\s*\w+";
    var matchResult = regexResult(pattern, value);

    if (matchResult.isNotEmpty && matchResult != "null") {
      debugPrint("FirstPattern: $matchResult");
      return matchResult;
    }
    return regexResult(pattern, value);
  }

  String getTitle(String value) {
    Pattern pattern =
        r"\s*?(Travel and Tours Consultant|VP Postal Operators|Courier Sales|Lojistik M[üÜuU]hendisli[gGğĞ]i Grup Y[oOöÖ]neticisi|software\s?\/\s?business development|enterprise project manager|financial controller|mali m[üÜuU][ŞşSs]avir|serbest muhasebeci|serbest muhasebeci|Muhasebe M[a-zü]d[a-zü]]r[a-zü]]|Brand Manager|Sales Manager|Finansal Dan[ıiIİ][a-zş]man|Financial Advisor|Junior Software Developer|Software Development Specialist|Yaz[ıiIİ]l[ıiIİ]m Gel[ıiIİ][a-zş]t[ıiIİ]rme Uzman[ıiIİ]|Sat[ıiIİ]nalma M[uUüÜ]d[uUüÜ]r[uUüÜ]|Purchasing Manager|Head of Protocol Department|Head of Protocol|VIP Guest Management|S[\s]?a[\s]?l[\s]?e[\s]?s M[\s]?a[\s]?n[\s]?a[\s]?g[\s]?e[\s]?r)\s*?";

    var matchResult = regexResult(pattern, value);

    if (matchResult.isNotEmpty && matchResult != "null") {
      return matchResult;
    }

    pattern =
        r"\s*?(Operation Head|General Manager|Events & CSR Manager|Director Of Sales|Operation Manager|Product Contracting Officer|Tours Executive|Branch Manager|IT Manager|Office In-Charge|MANAGING PARTNER|General Director|Sales Specialist|Director of Sales|Marketing|Project Manager|Govt Operation Team Leader|Account Manager|Corporate and Government|[ıIiİ][sSşŞ] Geli[sSşŞ]tirme M[uUüÜ]d[uUüÜ]r[uUüÜ]|Business Development Manager|Assistant Manager|Kurumsal M[uUüÜ][sSşŞ]teriler Y[oOöÖ]netimi|M[uUüÜ][sSşŞ]teri Y[oOöÖ]neticisi|Corporate Business)[\s#]*?";

    return regexResult(pattern, value);
  }

  String getNames(String value, String name) {
    Pattern pattern =
        r"\s*?(Ziya|Do[ğĞgG]]an|[oOÖö]]nc[uUüÜ]]|Mohamed|Mohammed|Mohammad|Mohammed|Ashfaq|Azfar|Enrico|Rosa|Suleiman|Suleiman|Ayda|Zeki|Uzunkaya|Andrea|Miliccia|Burak|Taylan|Do[gğGĞ]]an|Bozkurt|Do[gğGĞ]]u[sSşŞ]]|Alaa|Ayad|Ali)[\s#]{1,50}"
            .replaceAll("$name|", "");

    var matchResult = regexResult(pattern, value);

    if (matchResult.isNotEmpty && matchResult != "null") {
      debugPrint("FirstPattern: $matchResult");
      return matchResult;
    }

    pattern =
        r"\s*(Meeran|Rania|Sharqawi|Abdullah|Amoudi|Shady|Ghoneem|Irfan|Shafeeq|Tarek|Al-Kurdi|Syed|Zainulabeddin|Qadri|Salman|Ian|Hyndman|Tahani|Dhafer|Turgut|Karc[ıIiİ]]|Uddin|Natalia|Pchelintseva|Emre|Kudu|Serafima|Segal)[\s#]{1,9}";

    matchResult = regexResult(pattern, value);

    if (matchResult.isNotEmpty && matchResult != "null") {
      debugPrint("FirstPattern: $matchResult");
      return matchResult;
    }

    pattern = r"\s*(Ayda)\s{1,9}";

    matchResult = regexResult(pattern, value);

    if (matchResult.isNotEmpty && matchResult != "null") {
      debugPrint("FirstPattern: $matchResult");
      return matchResult;
    }

    pattern = r"\s*(Ayda)\s{1,9}";

    return regexResult(pattern, value);
  }

  String getSocialMediaAccount(String value) {
    Pattern pattern = r"[\s#](@)[a-z0-9.]*";

    var matchResult = regexResult(pattern, value);

    if (matchResult.isNotEmpty && matchResult != "null") {
      return matchResult;
    }

    return regexResult(pattern, value);
  }

  String getDistrict(String value) {
    Pattern pattern = r"";

    return regexResult(pattern, value);
  }

  String getTown(String value) {
    return "";

    // Pattern pattern =r"";
    // var matchResult = regexResult(pattern, value);

    // if (matchResult.isNotEmpty && matchResult != "null") {
    //   debugPrint("FirstPattern: $matchResult");
    //   return matchResult;
    // }

    // debugPrint("Secondpattern");

    // pattern =
    //     r"";

    // matchResult = regexResult(pattern, value);

    // if (matchResult.isNotEmpty && matchResult != "null") {
    //   debugPrint("FirstPattern: $matchResult");
    //   return matchResult;
    // }

    // pattern = r'\s(Town Center)[s*\/*,]{1}?';

    // matchResult = regexResult(pattern, value);

    // if (matchResult.isNotEmpty && matchResult != "null") {
    //   debugPrint("FirstPattern: $matchResult");
    //   return matchResult;
    // }
    // return regexResult(pattern, value);
  }

  String getForDirections(String value) {
    var pattern = r'\s*(Opposite)[a-z\s]+';

    var matchResult = regexResult(pattern, value);

    if (matchResult.isNotEmpty && matchResult != "null") {
      debugPrint("FirstPattern: $matchResult");
      return matchResult;
    }
    return regexResult(pattern, value);
  }

  String getCity(String value) {
    var pattern =
        r"(Dhahran|Genova|Riyadh|Dubai|(St.\s*)?Petersburg|Samara|Al Ain|Abu Dhabi|Jeddah|Al-Khobar|Khobar)";

    var matchResult = regexResult(pattern, value);

    if (matchResult.isNotEmpty && matchResult != "null") {
      debugPrint("FirstPattern: $matchResult");
      return matchResult;
    }

    pattern = r"";

    matchResult = regexResult(pattern, value);

    if (matchResult.isNotEmpty && matchResult != "null") {
      debugPrint("FirstPattern: $matchResult");
      return matchResult;
    }

    return regexResult(pattern, value);
  }

  String getCountry(String value) {
    Pattern pattern =
        r"(Kingdom of Saudi Arabia|United Arab Emirates|Saudi Arabia|Turkey|Türkiye|England|Italy|France|Germany|UAE|Russia|KSA)";

    var matchResult = regexResult(pattern, value);

    if (matchResult.isNotEmpty && matchResult != "null") {
      return matchResult;
    }
    return regexResult(pattern, value);
  }

  String getNeighborhood(String value) {
    Pattern pattern =
        r"[a-z,A-Z,üÜuUşŞÖöğĞ]*(\s|[.])+(mahallesi|mahalle|mah.|mah|mh.|mh)";

    return regexResult(pattern, value);
  }

  String getNeighborhood2(String value) {
    Pattern pattern = r"\w+(\s|[.])+(Yan yol)";

    return regexResult(pattern, value);
  }

  String getMainStreet(String value) {
    Pattern pattern =
        r"[a-z,A-Z,üÜuUşŞÖöğĞ]*(\s|[.])+(caddesi|cadde|cad.|cd.|cad|cd)";

    return regexResult(pattern, value);
  }

  String getStreet(String value) {
    Pattern pattern =
        r"\w+[a-zsSşŞüÜöÖğĞçÇ][\.]?(?=\s+(sok.|sk.|sokak|sokağı|road))[\x20](sok.|sk.|sokak|sokağı|road)|[a-z\s]*(Street|str|st)[.,]";

    return regexResult(pattern, value);
  }

  String getBuildingNumber(String value) {
    Pattern pattern =
        r"(Building|Post Office Box|P.O. Box No|PO. Box|P.O.Box|P.O. Box|PO. Box|P.O.B.ox|Office)[:.]?(\s){1}[0-9a-z\-]{1,5}|(Head Office)\s*[-]?\s*[0,9]*\w+|(No)(\:|\.)\s*[1-9]*\s*([\/]\s*[a-zA-Z0-9]*)?";

    var matchResult = regexResult(pattern, value);

    if (matchResult.isNotEmpty && matchResult != "null") {
      return matchResult;
    }

    return regexResult(pattern, value);
  }

  String getFloor(String value) {
    Pattern pattern =
        r"([0-9]{1,}\.{1}\s*?(Kat))|((K\:|Kat\:)\s*[1-9]{1,})|(Floor)\s[0-9]\w+";

    return regexResult(pattern, value);
  }

  String getApartmentNumber(String value) {
    Pattern pattern = r"(D\:)\s*[1-9]{1,}";

    return regexResult(pattern, value);
  }

  String getApartmentName(String value) {
    Pattern pattern = r"\w+(?=\s+(apt.))[\x20](apt.)";

    return regexResult(pattern, value);
  }

  String getEMailAddress(String value) {
    Pattern pattern =
        // r"\w+[.]?\w+(@)\w+(.com.tr|.com|.net.tr|.net)(\.[a-z]{2,3}?)?";
        r"\w[a-z0-9\.]{1,50}(@)[a-z0-9-_]{1,50}\.[a-z]{1,3}(\.[a-z]{1,3})?";

    var result = regexResult(pattern, value);

    return result.toLowerCase().replaceAll("e-mail:", "").trim();
  }

  String getFaxNumber(String value) {
    Pattern pattern =
        r"(\()*?(Faks|Fax|F)(\))*?\s*?(\:?)\s*?([\(\+]{1}?)[0-9\s\)]{1,16}";

    return regexResult(pattern, value);
  }

  String getPhoneNumber(String value) {
    Pattern pattern =
        r"[+][0-9\(\)\s]*|(Tel|T|Gsm|M)?\s*?(?!No\:)(\:?)\s*?([\(\+\:\-]{1}?)[0-9\s\.)]{9,16}|[+][0-9]*[\s\(]*[0-9]*\s*?[\)\s]*[0-9\-]*";

    return regexResult(pattern, value);
  }

  String regexResult(Pattern pattern, String value) {
    RegExp regex = new RegExp(
      pattern,
      caseSensitive: false,
    );

    return regex.stringMatch(value) ?? "";
  }
}
