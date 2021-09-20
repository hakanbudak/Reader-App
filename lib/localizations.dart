import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart' show SynchronousFuture;

class DemoLocalizations {
  DemoLocalizations(this.locale);
  final Locale locale;
  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Netline Cardvisit Reader',
      'clientDefinition': "Client Definition",
      'contactName': "Contact Name",
      'contactTitle': "Contact Title",
      'contactTitle2': "Contact Title 2",
      'address': "Address",
      'town': "Town",
      'city': "City",
      'country': "Country",
      'phone1': "Phone 1",
      'phone2': "Phone 2",
      'fax': "Fax",
      'eMail': "e-Mail",
      'webAddress': "Web Address",
      'transfer': "Transfer",
      'gallery': "Gallery",
      'camera': "Camera",
      'settings': "Settings",
      'crmUrl': "CRM Url",
      'crmUserName': "CRM User Name",
      'crmUserPassword': "CRM User Password",
      'crmPhoneType': "CRM Phone Type Name",
      'crmAddressType': "CRM Address Type Name",
      'pleaseWaitWhileReadingCrmData': "Please Wait While Reading CRM Data",
      'choose': 'Choose',
      'name': 'Name',
      'position': 'Position',
      'firmTitle1': "Firm Title 1",
      'firmTitle2': "Firm Title 2",
      'address1': 'Address 1',
      'address2': 'Address 2',
      'address3': 'Address 3',
      'workPhone': 'Work Phone',
      'mobilePhone': 'Mobile Phone',
      'web': 'Web',
      'countryCannotBePassedEmpty': 'Country Cannot be Passed Empty',
      'cityCannotBePassedEmpty': 'City Cannot be Passed Empty',
      'clientDefinitionCannotBePassedEmpty':
          'Client Definition Cannot be Passed Empty',
      'chooseCountry': 'Choose Country',
      'chooseSector': "Choose Sector",
      'addressCannotBePassedEmpty': 'Address Cannot be Passed Empty',
      'countryIsNotFound': 'Country is not Found',
      'cityIsNotFound': 'City is not Found',
      'sectorIsNotFound': 'Sector is not Found',
      'selectFirm': 'Select Firm',
      'addedToContacts': 'Added to Contacts',
      'work': 'Work',
      'home': 'Home',
      'licence': 'Licence',
      'licenceKey': 'Licence Key',
      'urlMustBeEntered': "CRM URL must be Entered",
      'phoneTypeMustBeEntered': "Phone Type Must be entered. Example: Mobil",
      'cellPhoneTypeMustBeEntered':
          "Cell Phone Type Must be entered. Example: Mobil",
      'workPhoneTypeMustBeEntered':
          "Work Phone Type Must be entered. Example: Work",
      'faxPhoneTypeMustBeEntered':
          "Fax Phone Type Must be entered. Example: Fax",
      'usernameMustBeEntered': "Username Must be entered",
      'passwordMustBeEntered': "Password Must be entered",
      'addressTypeMustBeEntered':
          "Address Type must be Entered. Example: Invoice Address",
      'licenceKeyMustBeEntered': "License Key must be Entered",
      'areYouSure': "Are You Sure",
      'doYouWantToExitApp': "Do You Want to Exit?",
      'no': "No",
      'yes': "Yes",
      'pleaseSelectFirmCategory': "Please Select Firm Category",
      'pleaseSelectSector': "Please Select Sector",
      'cellPhoneTypeName': "Cell Phone CRM Code",
      'workPhoneTypeName': "Work Phone CRM Code",
      'faxPhoneTypeName': "Fax Phone CRM Code",
      'workPhoneExtension': "Internal"
    },
    'tr': {
      'title': 'Netline Kartvizit Okuyucu',
      'clientDefinition': "Cari Unvan",
      'contactName': "İlgili Kişi",
      'contactTitle': "İlgili Kişi Unvan",
      'contactTitle2': "İlgili Kişi Unvan 2",
      'address': "Adres",
      'town': "İlçe",
      'city': "İl",
      'country': "Ülke",
      'phone1': "Telefon 1",
      'phone2': "Telefon 2",
      'fax': "Faks",
      'eMail': "e-Posta",
      'webAddress': "Web Sitesi",
      'transfer': "Aktar",
      'gallery': "Galeri",
      'camera': "Kamera",
      'settings': "Ayarlar",
      'crmUrl': "CRM Url",
      'crmUserName': "CRM Kullanıcı Adı",
      'crmUsassword': "CRM Parola",
      'crmPhoneType': "CRM Telefon Tip Adı",
      'crmAddressType': "CRM Adres Tip Adı",
      'pleaseWaitWhileReadingCrmData':
          "CRM Verileri Okunurken Lütfen Bekleyiniz",
      'choose': 'Seçiniz',
      'name': 'İsim',
      'position': 'Pozisyon',
      'firmTitle1': "Firma Unvan 1",
      'firmTitle2': "Firma Unvan 2",
      'address1': 'Adres 1',
      'address2': 'Adres 2',
      'address3': 'Adres 3',
      'workPhone': 'İş Tel.',
      'mobilePhone': 'Cep Tel.',
      'web': 'Web',
      'countryCannotBePassedEmpty': 'Ülke Boş Geçilemez',
      'cityCannotBePassedEmpty': 'Şehir Boş Geçilemez',
      'clientDefinitionCannotBePassedEmpty': 'Firma Unvanı Boş Geçilemez',
      'chooseCountry': 'Ülke Seçiniz',
      'chooseSector': "Sektör Seçiniz",
      'addressCannotBePassedEmpty': 'Adres Belirtilmelidir',
      'countryIsNotFound': 'Ülke Bulunamadı',
      'cityIsNotFound': 'Şehir Bulunamadı',
      'sectorIsNotFound': 'Sektör Bulunamadı',
      'selectFirm': 'Firma Seçiniz',
      'addedToContacts': 'Rehbere Eklendi',
      'Work': 'İş',
      'Home': 'Ev',
      'licence': 'Lisansla',
      'licenceKey': 'Lisans Anahtarı',
      'urlMustBeEntered': "CRM URL'i Belirtilmelidir",
      'phoneTypeMustBeEntered': "Telefon Tipi Girilmelidir. Örnek: Cep",
      'cellPhoneTypeMustBeEntered': "Cep Telefonu CRM Kodu Girilmelidir.",
      'workPhoneTypeMustBeEntered': "İş Telefonu CRM Kodu Girilmelidir.",
      'faxPhoneTypeMustBeEntered': "Faks Telefonu CRM Kodu Girilmelidir.",
      'usernameMustBeEntered': "Kullanıcı Adı Girilmelidir",
      'passwordMustBeEntered': "Parola Girilmelidir",
      'addressTypeMustBeEntered':
          "Adres Tipi Girilmelidir. Örnek: Fatura Adresi",
      'licenceKeyMustBeEntered': "Lisans Anahtarı Girilmelidir",
      'areYouSure': "Emin misiniz?",
      'doYouWantToExitApp': "Uygulamadan Kapanacak. Onaylıyor musunuz?",
      'no': "Hayır",
      'yes': "Evet",
      'pleaseSelectFirmCategory': "Lütfen Firma Kategorisi Seçiniz",
      'pleaseSelectSector': "Lütfen Sektör Seçiniz",
      'cellPhoneTypeName': "Cep Telefonu CRM Kodu",
      'workPhoneTypeName': "İş Telefonu CRM Kodu",
      'faxPhoneTypeName': "Faks Telefonu CRM Kodu",
      'workPhoneExtension': "Dahili"
    },
  };
  String get pleaseWaitWhileReadingCrmData {
    return _localizedValues[locale.languageCode]
        ['pleaseWaitWhileReadingCrmData'];
  }

  String get crmUrl {
    return _localizedValues[locale.languageCode]['crmUrl'];
  }

  String get crmUserName {
    return _localizedValues[locale.languageCode]['crmUserName'];
  }

  String get crmUserPassword {
    return _localizedValues[locale.languageCode]['crmUserPassword'];
  }

  String get crmPhoneType {
    return _localizedValues[locale.languageCode]['crmPhoneType'];
  }

  String get crmAddressType {
    return _localizedValues[locale.languageCode]['crmAddressType'];
  }

  String get transfer {
    return _localizedValues[locale.languageCode]['transfer'];
  }

  String get gallery {
    return _localizedValues[locale.languageCode]['gallery'];
  }

  String get eMail {
    return _localizedValues[locale.languageCode]['eMail'];
  }

  String get camera {
    return _localizedValues[locale.languageCode]['camera'];
  }

  String get settings {
    return _localizedValues[locale.languageCode]['settings'];
  }

  String get webAddress {
    return _localizedValues[locale.languageCode]['webAddress'];
  }

  String get country {
    return _localizedValues[locale.languageCode]['country'];
  }

  String get phone1 {
    return _localizedValues[locale.languageCode]['phone1'];
  }

  String get phone2 {
    return _localizedValues[locale.languageCode]['phone2'];
  }

  String get fax {
    return _localizedValues[locale.languageCode]['fax'];
  }

  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }

  String get clientDefinition {
    return _localizedValues[locale.languageCode]['clientDefinition'];
  }

  String get contactName {
    return _localizedValues[locale.languageCode]['contactName'];
  }

  String get contactTitle {
    return _localizedValues[locale.languageCode]['contactTitle'];
  }

  String get contactTitle2 {
    return _localizedValues[locale.languageCode]['contactTitle2'];
  }

  String get address {
    return _localizedValues[locale.languageCode]['address'];
  }

  String get town {
    return _localizedValues[locale.languageCode]['town'];
  }

  String get city {
    return _localizedValues[locale.languageCode]['city'];
  }

  String get choose {
    return _localizedValues[locale.languageCode]['choose'];
  }

  String get name {
    return _localizedValues[locale.languageCode]['name'];
  }

  String get position {
    return _localizedValues[locale.languageCode]['position'];
  }

  String get firmTitle1 {
    return _localizedValues[locale.languageCode]['firmTitle1'];
  }

  String get firmTitle2 {
    return _localizedValues[locale.languageCode]['firmTitle2'];
  }

  String get address1 {
    return _localizedValues[locale.languageCode]['address1'];
  }

  String get address2 {
    return _localizedValues[locale.languageCode]['address2'];
  }

  String get address3 {
    return _localizedValues[locale.languageCode]['address3'];
  }

  String get workPhone {
    return _localizedValues[locale.languageCode]['workPhone'];
  }

  String get workPhoneExtension {
    return _localizedValues[locale.languageCode]['workPhoneExtension'];
  }

  String get mobilePhone {
    return _localizedValues[locale.languageCode]['mobilePhone'];
  }

  String get web {
    return _localizedValues[locale.languageCode]['web'];
  }

  String get countryCannotBePassedEmpty {
    return _localizedValues[locale.languageCode]['countryCannotBePassedEmpty'];
  }

  String get cityCannotBePassedEmpty {
    return _localizedValues[locale.languageCode]['cityCannotBePassedEmpty'];
  }

  String get clientDefinitionCannotBePassedEmpty {
    return _localizedValues[locale.languageCode]
        ['clientDefinitionCannotBePassedEmpty'];
  }

  String get addressCannotBePassedEmpty {
    return _localizedValues[locale.languageCode]['addressCannotBePassedEmpty'];
  }

  String get chooseCountry {
    return _localizedValues[locale.languageCode]['chooseCountry'];
  }

  String get chooseSector {
    return _localizedValues[locale.languageCode]['chooseSector'];
  }

  String get countryIsNotFound {
    return _localizedValues[locale.languageCode]['countryIsNotFound'];
  }

  String get cityIsNotFound {
    return _localizedValues[locale.languageCode]['cityIsNotFound'];
  }

  String get sectorIsNotFound {
    return _localizedValues[locale.languageCode]['sectorIsNotFound'];
  }

  String get selectFirm {
    return _localizedValues[locale.languageCode]['selectFirm'];
  }

  String get work {
    return _localizedValues[locale.languageCode]['work'];
  }

  String get home {
    return _localizedValues[locale.languageCode]['home'];
  }

  String get addedToContacts {
    return _localizedValues[locale.languageCode]['addedToContacts'];
  }

  String get licenceKey {
    return _localizedValues[locale.languageCode]['licenceKey'];
  }

  String get licence {
    return _localizedValues[locale.languageCode]['licence'];
  }

  String get urlMustBeEntered {
    return _localizedValues[locale.languageCode]['urlMustBeEntered'];
  }

  String get phoneTypeMustBeEntered {
    return _localizedValues[locale.languageCode]['phoneTypeMustBeEntered'];
  }

  String get cellPhoneTypeMustBeEntered {
    return _localizedValues[locale.languageCode]['cellPhoneTypeMustBeEntered'];
  }

  String get workPhoneTypeMustBeEntered {
    return _localizedValues[locale.languageCode]['workPhoneTypeMustBeEntered'];
  }

  String get faxPhoneTypeMustBeEntered {
    return _localizedValues[locale.languageCode]['faxPhoneTypeMustBeEntered'];
  }

  String get usernameMustBeEntered {
    return _localizedValues[locale.languageCode]['usernameMustBeEntered'];
  }

  String get passwordMustBeEntered {
    return _localizedValues[locale.languageCode]['passwordMustBeEntered'];
  }

  String get addressTypeMustBeEntered {
    return _localizedValues[locale.languageCode]['addressTypeMustBeEntered'];
  }

  String get cellPhoneTypeName {
    return _localizedValues[locale.languageCode]['cellPhoneTypeName'];
  }

  String get workPhoneTypeName {
    return _localizedValues[locale.languageCode]['workPhoneTypeName'];
  }

  String get faxPhoneTypeName {
    return _localizedValues[locale.languageCode]['faxPhoneTypeName'];
  }

  String get licenceKeyMustBeEntered {
    return _localizedValues[locale.languageCode]['licenceKeyMustBeEntered'];
  }

  String get areYouSure {
    return _localizedValues[locale.languageCode]['areYouSure'];
  }

  String get doYouWantToExitApp {
    return _localizedValues[locale.languageCode]['doYouWantToExitApp'];
  }

  String get no {
    return _localizedValues[locale.languageCode]['no'];
  }

  String get yes {
    return _localizedValues[locale.languageCode]['yes'];
  }

  String get pleaseSelectFirmCategory {
    return _localizedValues[locale.languageCode]['pleaseSelectFirmCategory'];
  }

  String get pleaseSelectSector {
    return _localizedValues[locale.languageCode]['pleaseSelectSector'];
  }
}

class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) => ['en', 'tr'].contains(locale.languageCode);

  @override
  Future<DemoLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return new SynchronousFuture<DemoLocalizations>(
        new DemoLocalizations(locale));
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}
