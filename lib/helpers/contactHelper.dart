import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:netline_cardvisit_reader/helpers/toasthelper.dart';
import 'package:netline_cardvisit_reader/localizations.dart';
import 'package:netline_cardvisit_reader/models/firm.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactHelper {
  static void saveContact(DemoLocalizations localization, Firm firm) async {
    print("SaveContact");

    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus != PermissionStatus.granted) {
      _handleInvalidPermissions(permissionStatus);
    }

    Contact contact = new Contact();
    contact.displayName = firm.personName;
    contact.givenName = firm.personName;
    contact.middleName = "";
    contact.prefix = "";
    contact.suffix = "";
    contact.familyName = "";
    contact.company = firm.firmTitle;
    contact.jobTitle = firm.personTitle;
    contact.identifier = "";

    PostalAddress address = PostalAddress(
      label: localization.work,
      street: firm.mainAddress,
      city: firm.city,
      country: firm.country,
      postcode: "",
      region: "",
    );

    contact.postalAddresses = [address];

    contact.emails = [
      Item(label: localization.work, value: firm.eMailAddress1)
    ];

    print("Telefon 1: ${firm.phone1}");
    print("Telefon 2: ${firm.phone2}");
    print("Fax      : ${firm.fax}");

    contact.phones = [
      Item(label: localization.work, value: firm.phone1),
      Item(label: localization.fax, value: firm.fax),
      Item(label: localization.home, value: firm.phone2)
    ];
    contact.birthday = new DateTime.now();
    contact.androidAccountType = AndroidAccountType.google;

    try {
      await ContactsService.addContact(contact);
      ToastHelper.showToast(localization.addedToContacts);
    } catch (e) {
      ToastHelper.showToast(e, Toast.LENGTH_LONG, true);
    }
  }

  static Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.request();
    if (permission != PermissionStatus.granted) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus ?? PermissionStatus.denied;
    } else {
      return permission;
    }
  }

  static void _handleInvalidPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      throw new PlatformException(
          code: "PERMISSION_DENIED",
          message: "Access to location data denied",
          details: null);
    }
  }
}
