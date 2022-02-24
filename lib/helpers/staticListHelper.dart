import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../localizations.dart';

class StaticListHelper {
  static getSelectedList(BuildContext context) {
    var localization = new DemoLocalizations(Localizations.localeOf(context));

    final _formKey = GlobalKey<FormState>();

    // Map<String, dynamic> formData;

    // selectedScCategories() {
    //   getFirmCategories = {
    //     'City': 'Bangalore',
    //     'Country': 'INDIA',
    //   };
    // }

    return <String>[
      localization.choose,
      localization.address1,
      localization.address2,
      localization.address3,
      localization.eMail,
      localization.fax,
      localization.firmTitle1,
      localization.firmTitle2,
      localization.mobilePhone,
      localization.name,
      localization.position,
      localization.web,
      localization.workPhone,
      localization.workPhoneExtension,
    ].map<DropdownMenuItem<String>>(
      (String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      },
    ).toList();
  }

  Map<String, dynamic> formData;
  final List<String> category = [
    'Agency',
    'Company',
    'Consortia',
    'Guests',
    'Partners',
    'Preferences'
  ];

  final List<String> guestsCategory = [
    ///Guests
    'Transit',
    'Wholesale ',
    'Tourseries',
    'FIT',
    'Corporate & Mice',
    'Social & Events',
    'Incentive',
    'OTA'
  ];
  final List<String> agentyCategory = [
    ///Agenty
    'FİT',
    'Incentıve',
    'Group',
    'Leisure',
    'Social',
    'Corporate',
    'Private Services'
  ];
  final List<String> companyCategory = [
    ///Company
    'Textile',
    'Health',
    'Cosmetic',
    'Transportation',
    'Construction',
    'Sport',
    'Embassy & Goverment',
    'Food & Beverage Co.'
  ];
  final List<String> consortiaCategory = [
    ///Consortia
    'Der',
    'Virtuoso',
    'Amex',
    'Signature',
    'Alhi',
    'LHW'
  ];

  final List<String> partnersCategory = [
    ///Partners
    'Art/ Galleries',
    'Buddha Bar',
    'Spa',
    'Hairdresser'
  ];
  final List<String> preferencesCategory = [
    ///Preferences
    'VIP (High Rate)',
    'Length of stay',
    'Special Occasion',
    'Repeat Guest',
    'Purpose of Visit',
    'Guest with Pets',
    'Family  with Kids',
    'Allergic'
  ];

  static getFirmList() {
    return [
      "SYSTEC",
      "PERMAK",
      "SANCLEMENTE",
    ];
  }

  static List<String> getSectors() {
    return [
      'Guests',
      'Agency',
      'Company',
      'Consortia',
      'Partners',
      'Preferences',
    ];
  }

  static List<String> getGuests() {
    return [
      "Transit",
      "Wholesale",
      "Tourseries",
      "FIT",
      "Corporate & Mice",
      "Social & Events",
      "Incentive",
      "OTA",
    ];
  }

  static List<String> getAgency() {
    return [
      "FIT",
      "Incentive",
      "Group",
      "Leisure",
      "Social",
      "Corporate",
      "Private Services",
    ];
  }

  static List<String> getAltCompany() {
    return [
      "Textile",
      "Health",
      "Cosmetic",
      "Transportation",
      "Construction",
      "Sport",
      "Embassy & Goverment",
      "Food & Beverage Co.",
    ];
  }

  static List<String> getConsortia() {
    return [
      "Der",
      "Virtuoso",
      "Amex",
      "Signature",
      "Alhi",
      "LHW",
    ];
  }

  static List<String> getPartners() {
    return [
      "Art/ Galleries",
      "Buddha Bar",
      "Spa",
      "Hairdresser",
    ];
  }

  static List<String> getPreferences() {
    return [
      "VIP (High Rate)",
      "Length of stay",
      "Special Occasion",
      "Repeat Guest",
      "Purpose of Visit",
      "Guest with Pets",
      "Family  with Kids",
      "Allergic",
    ];
  }

  static List<String> getCategories(String selectedSector) {
    switch (selectedSector) {
      case "Guests":
        return getGuests();
        break;
      case "Agency":
        return getAgency();
        break;
      case "Company":
        return getAltCompany();
        break;
      case "Consortia":
        return getConsortia();
        break;
      case "Partners":
        return getPartners();
        break;
      case "Preferences":
        return getPreferences();
        break;
      default:
        return [""];
    }
  }

  static List<String> getFirmCategories() {
    // Permak
    return ["SelectedAltCategory"];
  }

  static List<String> getCountryList() {
    return [
      'ABD KÜÇÜK DIŞ ADALARI',
      'ABHAZYA',
      'AFGANISTAN',
      'ALMANYA',
      'AMERİKA',
      'AMERIKAN SAMOASI',
      'ANDORRA',
      'ANGOLA',
      'ANGUİLLA',
      'ANTARTİKA',
      'ANTİGUA VE BARBUDA',
      'ARJANTİN',
      'ARNAVUTLUK',
      'ARUBA',
      'AVUSTRALYA',
      'AVUSTURYA',
      'AZERBAYCAN',
      'BAHAMALAR',
      'BAHREYN',
      'BANGLADEŞ',
      'BARBADOS',
      'BATI SAHRA',
      'BATI ŞERİA VE GAZZE ŞERİDİ',
      'BELARUS',
      'BELÇİKA',
      'BELİZE',
      'BENİN',
      'BERMUDA',
      'BİRLEŞİK ARAP EMİRLİKLERİ',
      'BOLİVYA',
      'BOSNA-HERSEK',
      'BOTSVANA',
      'BREZİLYA',
      'BRUNEİ',
      'BULGARİSTAN',
      'BURKİNA FASO',
      'BURUNDİ',
      'BUTAN',
      'ÇAD',
      'CAYMAN ADALARI',
      'CEBELİTARIK',
      'ÇEK CUM.',
      'CEZAYİR',
      'CHRISTMAS ADL.',
      'CİBUTİ',
      'ÇİN',
      'COCOS(KEELING) ADL.',
      'COOK AD.',
      'DAĞLIK KARABAĞ',
      'DANİMARKA',
      'DOĞU TİMOR',
      'DOMİNİK CUM.',
      'DOMİNİKA',
      'EKVADOR',
      'EKVATOR GINESI',
      'EL SALVADOR',
      'ERİTRE',
      'ERMENİSTAN',
      'ESTONYA',
      'ETİYOPYA',
      'FALKLAND AD.',
      'FAROE ADL.',
      'FAS',
      'FİJİ',
      'FİLDİŞİ KIYISI',
      'FİLİPİNLER',
      'FİNLANDİYA',
      'FRANSA',
      'FRANSIZ GÜNEY BÖLGELERİ',
      'FRANSIZ GUYANASI',
      'FRANSIZ POLINEZYASI',
      'GABON',
      'GAMBİYA',
      'GANA',
      'GİNE BISSAU',
      'GİNE',
      'GRENADA',
      'GRÖNLAND',
      'GUADELOUPE',
      'GUAM',
      'GUATEMALA',
      'GUERNSEY',
      'GÜNEY AFRICA',
      'GÜNEY KORE',
      'GÜNEY OSETYA',
      'GÜNEY SUDAN',
      'GÜRCİSTAN',
      'GUYANA',
      'HAİTİ',
      'HİNDİSTAN',
      'HIRVATİSTAN',
      'HOLLANDA ANTİLLERİ',
      'HOLLANDA',
      'HONDURAS',
      'HONG KONG',
      'İNDONEZYA',
      'İNGİLTERE',
      'IRAK',
      'İRAN',
      'İRLANDA',
      'İSKOÇYA',
      'İSPANYA',
      'İSRAİL',
      'İSVEÇ',
      'İSVİÇRE',
      'İTALYA',
      'İZLANDA',
      'JAMAİKA',
      'JAPONYA',
      'JERSEY',
      'KAMBOÇYA',
      'KAMER ADALARI',
      'KAMERUN',
      'KANADA',
      'KAPE VERDE',
      'KATAR',
      'KAZAKISTAN',
      'KENYA',
      'KIBRIS',
      'KIRGIZİSTAN',
      'KIRIBATI',
      'KKTC',
      'KOLOMBİYA',
      'KONGO DEM. CUM.',
      'KONGO',
      'KOSOVA',
      'KOSTA RIKA',
      'KÜBA',
      'KUVEYT',
      'KUZEY KORE',
      'KUZEY MARİANA ADL.',
      'LAOS',
      'LESOTHO',
      'LETONYA',
      'LİBYA',
      'LİBYA',
      'LIHTENSTEIN',
      'LİTVANYA',
      'LÜBNAN',
      'LÜKSEMBURG',
      'MACARİSTAN',
      'MADAGASKAR',
      'MAKAO',
      'MAKEDONYA',
      'MALAVİ',
      'MALDİVLER',
      'MALEZYA',
      'MALİ',
      'MALTA',
      'MAN AD.',
      'MARSHALL AD.',
      'MARTINİK',
      'MAURİTİUS',
      'MAYOTTE',
      'MEKSİKA',
      'MİKRONEZYA',
      'MISIR',
      'MOĞOLİSTAN',
      'MOLDOVA',
      'MONAKO',
      'MONTENEGRO',
      'MONTSERRAT',
      'MORİTANYA',
      'MOZAMBİK',
      'MYANMAR',
      'NAMİBYA',
      'NAURU',
      'NEPAL',
      'NİJER',
      'NİJERYA',
      'NİKARAGUA',
      'NİUE',
      'NORFOLK AD.',
      'NORVEÇ',
      'ORTA AFRIKA CUM.',
      'ÖZBEKİSTAN',
      'PAKİSTAN',
      'PALAU',
      'PANAMA',
      'PAPUA YENİ GİNE',
      'PARAGUAY',
      'PERU',
      'PİTCAİRN ADL.',
      'POLONYA',
      'PORTEKİZ',
      'PORTO RİKO',
      'REUNION',
      'ROMANYA',
      'RUANDA',
      'RUSYA',
      'SAINT HELENA',
      'SAINT KITTS VE NEVİS',
      'SAINT LUCIA',
      'SAINT VINCENT VE GRENADINES',
      'SAINT-PIERRE VE MIQUELON',
      'SAMOA',
      'SAN MARINO',
      'SAO TOME VE PRINCIPE',
      'SENEGAL',
      'SEYCHELLES ADALARI',
      'SIERRA LEONE',
      'ŞİLİ',
      'SİNGAPUR',
      'SIRBISTAN-KARADAĞ',
      'SLOVAKYA',
      'SLOVENYA',
      'SOLOMON ISLANDS',
      'SOMALİ',
      'SOMALİLAND',
      'SRİ LANKA',
      'SUDAN',
      'SURİNAM',
      'SURİYE',
      'SUUDİ ARABİSTAN',
      'SVALBARD',
      'SVAZILAND',
      'TACİKİSTAN',
      'TANZANYA',
      'TAYLAND',
      'TAYVAN',
      'TOGO',
      'TOKELAU',
      'TONGA',
      'TRANSNISTRIA',
      'TRINIDAD VE TOBAGO',
      'TUNUS',
      'TÜRKİYE',
      'TÜRKMENİSTAN',
      'TURKS VE CAICOS ADL.',
      'TUVALU',
      'UGANDA',
      'UKRAYNA',
      'UMMAN',
      'ÜRDÜN',
      'URUGUAY',
      'VALLIS VE FUTUNA',
      'VANUATU',
      'VATİKAN',
      'VENEZUELA',
      'VİETNAM',
      'VİRJİN ADL. (ABD)',
      'VİRJİNYA ADL. (İNG.)',
      'YEMEN',
      'YENİ KALEDONYA',
      'YENİ ZELANDA',
      'YUNANİSTAN',
      'ZAMBİYA',
      'ZİMBABVE',
    ];
  }
}
