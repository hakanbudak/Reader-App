import 'dart:io';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mlkit/mlkit.dart';
import 'package:netline_cardvisit_reader/helpers/contactHelper.dart';
import 'package:netline_cardvisit_reader/helpers/patternhelper.dart';
import 'package:netline_cardvisit_reader/helpers/resthelper.dart';
import 'package:netline_cardvisit_reader/helpers/staticListHelper.dart';
import 'package:netline_cardvisit_reader/helpers/stringhelper.dart';
import 'package:netline_cardvisit_reader/helpers/toasthelper.dart';
import 'package:netline_cardvisit_reader/models/cities.dart';
import 'package:netline_cardvisit_reader/models/crmloginresult.dart';
import 'package:netline_cardvisit_reader/models/crmpostresultmodel.dart';
import 'package:netline_cardvisit_reader/models/firm.dart';
import 'package:netline_cardvisit_reader/models/phone.dart';
import 'package:turkish/turkish.dart';

import '../globals.dart';
import '../localizations.dart';
import 'settingspage.dart';

class OptionalPage extends StatefulWidget {
  @override
  _OptionalPageState createState() => _OptionalPageState();
}

class _OptionalPageState extends State<OptionalPage> {
  FirebaseVisionTextDetector detector = FirebaseVisionTextDetector.instance;
  File _file;
  DemoLocalizations localization;
  CrmLoginResult _crmLoginResult = new CrmLoginResult(0, "", "", "", false, "");

  // String selectedItem1 = "Choose";
  // String selectedItem2 = "Choose";
  // String selectedItem3 = "Choose";
  // String selectedItem4 = "Choose";
  // String selectedItem5 = "Choose";
  // String selectedItem6 = "Choose";
  // String selectedItem7 = "Choose";
  // String selectedItem8 = "Choose";
  // String selectedItem9 = "Choose";
  // String selectedItem10 = "Choose";
  // String selectedItem11 = "Choose";
  // String selectedItem12 = "Choose";
  // String selectedItem13 = "Choose";
  // String selectedItem14 = "Choose";
  // String selectedItem15 = "Choose";
  // String selectedItem16 = "Choose";
  // String selectedItem17 = "Choose";
  // String selectedItem18 = "Choose";
  // String selectedItem19 = "Choose";
  // String selectedItem20 = "Choose";
  // String selectedItem21 = "Choose";
  // String selectedItem22 = "Choose";
  // String selectedItem23 = "Choose";
  // String selectedItem24 = "Choose";
  // String selectedItem25 = "Choose";
  // String selectedItem26 = "Choose";
  // String selectedItem27 = "Choose";
  // String selectedItem28 = "Choose";
  // String selectedItem29 = "Choose";
  // String selectedItem30 = "Choose";

  String selectedItem1;
  String selectedItem2;
  String selectedItem3;
  String selectedItem4;
  String selectedItem5;
  String selectedItem6;
  String selectedItem7;
  String selectedItem8;
  String selectedItem9;
  String selectedItem10;
  String selectedItem11;
  String selectedItem12;
  String selectedItem13;
  String selectedItem14;
  String selectedItem15;
  String selectedItem16;
  String selectedItem17;
  String selectedItem18;
  String selectedItem19;
  String selectedItem20;
  String selectedItem21;
  String selectedItem22;
  String selectedItem23;
  String selectedItem24;
  String selectedItem25;
  String selectedItem26;
  String selectedItem27;
  String selectedItem28;
  String selectedItem29;
  String selectedItem30;

  String selectedCountry = "";
  String selectedFirm = "";
  String selectedSector = "";

  String readedText1 = "";
  String readedText2 = "";
  String readedText3 = "";
  String readedText4 = "";
  String readedText5 = "";
  String readedText6 = "";
  String readedText7 = "";
  String readedText8 = "";
  String readedText9 = "";
  String readedText10 = "";
  String readedText11 = "";
  String readedText12 = "";
  String readedText13 = "";
  String readedText14 = "";
  String readedText15 = "";
  String readedText16 = "";
  String readedText17 = "";
  String readedText18 = "";
  String readedText19 = "";
  String readedText20 = "";
  String readedText21 = "";
  String readedText22 = "";
  String readedText23 = "";
  String readedText24 = "";
  String readedText25 = "";
  String readedText26 = "";
  String readedText27 = "";
  String readedText28 = "";
  String readedText29 = "";
  String readedText30 = "";

  TextEditingController textEditingController1 = new TextEditingController();
  TextEditingController textEditingController2 = new TextEditingController();
  TextEditingController textEditingController3 = new TextEditingController();
  TextEditingController textEditingController4 = new TextEditingController();
  TextEditingController textEditingController5 = new TextEditingController();
  TextEditingController textEditingController6 = new TextEditingController();
  TextEditingController textEditingController7 = new TextEditingController();
  TextEditingController textEditingController8 = new TextEditingController();
  TextEditingController textEditingController9 = new TextEditingController();
  TextEditingController textEditingController10 = new TextEditingController();
  TextEditingController textEditingController11 = new TextEditingController();
  TextEditingController textEditingController12 = new TextEditingController();
  TextEditingController textEditingController13 = new TextEditingController();
  TextEditingController textEditingController14 = new TextEditingController();
  TextEditingController textEditingController15 = new TextEditingController();
  TextEditingController textEditingController16 = new TextEditingController();
  TextEditingController textEditingController17 = new TextEditingController();
  TextEditingController textEditingController18 = new TextEditingController();
  TextEditingController textEditingController19 = new TextEditingController();
  TextEditingController textEditingController20 = new TextEditingController();
  TextEditingController textEditingController21 = new TextEditingController();
  TextEditingController textEditingController22 = new TextEditingController();
  TextEditingController textEditingController23 = new TextEditingController();
  TextEditingController textEditingController24 = new TextEditingController();
  TextEditingController textEditingController25 = new TextEditingController();
  TextEditingController textEditingController26 = new TextEditingController();
  TextEditingController textEditingController27 = new TextEditingController();
  TextEditingController textEditingController28 = new TextEditingController();
  TextEditingController textEditingController29 = new TextEditingController();
  TextEditingController textEditingController30 = new TextEditingController();

  TextEditingController textEditingControllerFirm = new TextEditingController();
  TextEditingController textEditingControllerCity = new TextEditingController();
  TextEditingController textEditingControllerCountry =
      new TextEditingController();
  TextEditingController textEditingControllerSector =
      new TextEditingController();

  bool visibleLine1 = false;
  bool visibleLine2 = false;
  bool visibleLine3 = false;
  bool visibleLine4 = false;
  bool visibleLine5 = false;
  bool visibleLine6 = false;
  bool visibleLine7 = false;
  bool visibleLine8 = false;
  bool visibleLine9 = false;
  bool visibleLine10 = false;
  bool visibleLine11 = false;
  bool visibleLine12 = false;
  bool visibleLine13 = false;
  bool visibleLine14 = false;
  bool visibleLine15 = false;
  bool visibleLine16 = false;
  bool visibleLine17 = false;
  bool visibleLine18 = false;
  bool visibleLine19 = false;
  bool visibleLine20 = false;
  bool visibleLine21 = false;
  bool visibleLine22 = false;
  bool visibleLine23 = false;
  bool visibleLine24 = false;
  bool visibleLine25 = false;
  bool visibleLine26 = false;
  bool visibleLine27 = false;
  bool visibleLine28 = false;
  bool visibleLine29 = false;
  bool visibleLine30 = false;

  bool visibleDivider1 = false;
  bool visibleDivider2 = false;
  bool visibleDivider3 = false;
  bool visibleDivider4 = false;
  bool visibleDivider5 = false;
  bool visibleDivider6 = false;
  bool visibleDivider7 = false;
  bool visibleDivider8 = false;
  bool visibleDivider9 = false;
  bool visibleDivider10 = false;
  bool visibleDivider11 = false;
  bool visibleDivider12 = false;
  bool visibleDivider13 = false;
  bool visibleDivider14 = false;
  bool visibleDivider15 = false;
  bool visibleDivider16 = false;
  bool visibleDivider17 = false;
  bool visibleDivider18 = false;
  bool visibleDivider19 = false;
  bool visibleDivider20 = false;
  bool visibleDivider21 = false;
  bool visibleDivider22 = false;
  bool visibleDivider23 = false;
  bool visibleDivider24 = false;
  bool visibleDivider25 = false;
  bool visibleDivider26 = false;
  bool visibleDivider27 = false;
  bool visibleDivider28 = false;
  bool visibleDivider29 = false;
  bool visibleDivider30 = false;

  int lastRowNr = 1;

  var patternHelper = new PatternHelper();

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (index == 0) {
        transferData();
      } else if (index == 1) {
        ContactHelper.saveContact(localization, getFirm());
      } else if (index == 2) {
        takeText(ImageSource.gallery, false);
      } else if (index == 3) {
        takeText(ImageSource.camera, false);
      } else if (index == 4) {
        takeText(ImageSource.camera, true);
      } else if (index == 5) {
        goSettingsPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    localization = new DemoLocalizations(Localizations.localeOf(context));

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            localization.title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          elevation: 0,
          leading: Image.asset("assets/images/netline.png"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: getRowDetails(),
          ),
        ),
        bottomNavigationBar: getNavigationBar(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Globals.AppBaseColor,
          splashColor: Globals.AppBaseReverseColor,
          child: Icon(Icons.add),
          onPressed: () => addEmptyRow(),
        ),
      ),
    );
  }

  void addEmptyRow() {
    print(lastRowNr);
    setState(() {
      switch (lastRowNr) {
        case 1:
          visibleDivider1 = true;
          visibleLine1 = true;
          lastRowNr++;
          break;
        case 2:
          visibleDivider2 = true;
          visibleLine2 = true;
          lastRowNr++;
          break;
        case 3:
          visibleDivider3 = true;
          visibleLine3 = true;
          lastRowNr++;
          break;
        case 4:
          visibleDivider4 = true;
          visibleLine4 = true;
          lastRowNr++;
          break;
        case 5:
          visibleDivider5 = true;
          visibleLine5 = true;
          lastRowNr++;
          break;
        case 6:
          visibleDivider6 = true;
          visibleLine6 = true;
          lastRowNr++;
          break;
        case 7:
          visibleDivider7 = true;
          visibleLine7 = true;
          lastRowNr++;
          break;
        case 8:
          visibleDivider8 = true;
          visibleLine8 = true;
          lastRowNr++;
          break;
        case 9:
          visibleDivider9 = true;
          visibleLine9 = true;
          lastRowNr++;
          break;
        case 10:
          visibleDivider10 = true;
          visibleLine10 = true;
          lastRowNr++;
          break;
        case 11:
          visibleDivider11 = true;
          visibleLine11 = true;
          lastRowNr++;
          break;
        case 12:
          visibleDivider12 = true;
          visibleLine12 = true;
          lastRowNr++;
          break;
        case 13:
          visibleDivider13 = true;
          visibleLine13 = true;
          lastRowNr++;
          break;
        case 14:
          visibleDivider14 = true;
          visibleLine14 = true;
          lastRowNr++;
          break;
        case 15:
          visibleDivider15 = true;
          visibleLine15 = true;
          lastRowNr++;
          break;
        case 16:
          visibleDivider16 = true;
          visibleLine16 = true;
          lastRowNr++;
          break;
        case 17:
          visibleDivider17 = true;
          visibleLine17 = true;
          lastRowNr++;
          break;
        case 18:
          visibleDivider18 = true;
          visibleLine18 = true;
          lastRowNr++;
          break;
        case 19:
          visibleDivider19 = true;
          visibleLine19 = true;
          lastRowNr++;
          break;
        case 20:
          visibleDivider20 = true;
          visibleLine20 = true;
          lastRowNr++;
          break;
        case 21:
          visibleDivider21 = true;
          visibleLine21 = true;
          lastRowNr++;
          break;
        case 22:
          visibleDivider22 = true;
          visibleLine22 = true;
          lastRowNr++;
          break;
        case 23:
          visibleDivider23 = true;
          visibleLine23 = true;
          lastRowNr++;
          break;
        case 24:
          visibleDivider24 = true;
          visibleLine24 = true;
          lastRowNr++;
          break;
        case 25:
          visibleDivider25 = true;
          visibleLine25 = true;
          lastRowNr++;
          break;
        case 26:
          visibleDivider26 = true;
          visibleLine26 = true;
          lastRowNr++;
          break;
        case 27:
          visibleDivider27 = true;
          visibleLine27 = true;
          lastRowNr++;
          break;
        case 28:
          visibleDivider28 = true;
          visibleLine28 = true;
          lastRowNr++;
          break;
        case 29:
          visibleDivider29 = true;
          visibleLine29 = true;
          lastRowNr++;
          break;
        case 30:
          visibleDivider30 = true;
          visibleLine30 = true;
          lastRowNr++;
          break;
        default:
      }
    });
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  localization.areYouSure,
                  style: TextStyle(
                    color: Globals.AppBaseReverseColor,
                  ),
                ),
              ],
            ),
            content: new Text(
              localization.doYouWantToExitApp,
              style: TextStyle(
                color: Globals.AppBaseReverseColor,
              ),
            ),
            backgroundColor: Globals.AppBaseColor,
            actions: <Widget>[
              new FlatButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
                color: Globals.AppBaseReverseColor,
                splashColor: Globals.AppBaseColor,
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text(localization.no,
                    style: TextStyle(
                      color: Globals.AppBaseThirdColor,
                    )),
              ),
              new FlatButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
                color: Globals.AppBaseReverseColor,
                splashColor: Globals.AppBaseErrorColor,
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text(localization.yes,
                    style: TextStyle(
                      color: Globals.AppBaseErrorColor,
                    )),
              ),
            ],
          ),
        ) ??
        false;
  }

  void goSettingsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsPage()),
    );
  }

  Widget getNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Text(
            "CRM +",
            style: TextStyle(
                color: Globals.AppBaseReverseColor,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          title: Text(
            "",
            style: TextStyle(
              color: Globals.AppBaseReverseColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.phone,
            color: Globals.AppBaseReverseColor,
          ),
          title: Text(
            "",
            style: TextStyle(
              color: Globals.AppBaseReverseColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.photo,
            color: Globals.AppBaseReverseColor,
          ),
          title: Text(
            "",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Globals.AppBaseReverseColor,
              fontSize: 16,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.camera,
            color: Globals.AppBaseReverseColor,
          ),
          title: Text(
            "",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Globals.AppBaseReverseColor,
              fontSize: 16,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add_a_photo,
            color: Globals.AppBaseReverseColor,
          ),
          title: Text(
            "",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Globals.AppBaseReverseColor,
              fontSize: 16,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            color: Globals.AppBaseReverseColor,
          ),
          title: Text(
            "",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Globals.AppBaseReverseColor,
              fontSize: 16,
            ),
          ),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Globals.AppBaseReverseColor,
      backgroundColor: Globals.AppBaseColor,
      onTap: _onItemTapped,
    );
  }

  removeRow(int rowNr) {
    print("remove $rowNr");
    setState(() {
      switch (rowNr) {
        case 1:
          visibleDivider1 = false;
          visibleLine1 = false;
          textEditingController1.text = "";
          selectedItem1 = localization.choose;
          break;
        case 2:
          visibleDivider2 = false;
          visibleLine2 = false;
          textEditingController2.text = "";
          selectedItem2 = localization.choose;
          break;
        case 3:
          visibleDivider3 = false;
          visibleLine3 = false;
          textEditingController3.text = "";
          selectedItem3 = localization.choose;
          break;
        case 4:
          visibleDivider4 = false;
          visibleLine4 = false;
          break;
        case 5:
          visibleDivider5 = false;
          visibleLine5 = false;
          textEditingController5.text = "";
          selectedItem5 = localization.choose;
          break;
        case 6:
          visibleDivider6 = false;
          visibleLine6 = false;
          textEditingController6.text = "";
          selectedItem6 = localization.choose;
          break;
        case 7:
          visibleDivider7 = false;
          visibleLine7 = false;
          textEditingController7.text = "";
          selectedItem7 = localization.choose;
          break;
        case 8:
          visibleDivider8 = false;
          visibleLine8 = false;
          textEditingController8.text = "";
          selectedItem8 = localization.choose;
          break;
        case 9:
          visibleDivider9 = false;
          visibleLine9 = false;
          textEditingController9.text = "";
          selectedItem9 = localization.choose;
          break;
        case 10:
          visibleDivider10 = false;
          visibleLine10 = false;
          textEditingController10.text = "";
          selectedItem10 = localization.choose;
          break;
        case 11:
          visibleDivider11 = false;
          visibleLine11 = false;
          textEditingController11.text = "";
          selectedItem11 = localization.choose;
          break;
        case 12:
          visibleDivider12 = false;
          visibleLine12 = false;
          textEditingController12.text = "";
          selectedItem12 = localization.choose;
          break;
        case 13:
          visibleDivider13 = false;
          visibleLine13 = false;
          textEditingController13.text = "";
          selectedItem13 = localization.choose;
          break;
        case 14:
          visibleDivider14 = false;
          visibleLine14 = false;
          textEditingController14.text = "";
          selectedItem14 = localization.choose;
          break;
        case 15:
          visibleDivider15 = false;
          visibleLine15 = false;
          textEditingController15.text = "";
          selectedItem15 = localization.choose;
          break;
        case 16:
          visibleDivider16 = false;
          visibleLine16 = false;
          textEditingController16.text = "";
          selectedItem16 = localization.choose;
          break;
        case 17:
          visibleDivider17 = false;
          visibleLine17 = false;
          textEditingController17.text = "";
          selectedItem17 = localization.choose;
          break;
        case 18:
          visibleDivider18 = false;
          visibleLine18 = false;
          textEditingController18.text = "";
          selectedItem18 = localization.choose;
          break;
        case 19:
          visibleDivider19 = false;
          visibleLine19 = false;
          textEditingController19.text = "";
          selectedItem19 = localization.choose;
          break;
        case 20:
          visibleDivider20 = false;
          visibleLine20 = false;
          textEditingController20.text = "";
          selectedItem20 = localization.choose;
          break;
        case 21:
          visibleDivider21 = false;
          visibleLine21 = false;
          textEditingController21.text = "";
          selectedItem21 = localization.choose;
          break;
        case 22:
          visibleDivider22 = false;
          visibleLine22 = false;
          textEditingController22.text = "";
          selectedItem22 = localization.choose;
          break;
        case 23:
          visibleDivider23 = false;
          visibleLine23 = false;
          textEditingController23.text = "";
          selectedItem23 = localization.choose;
          break;
        case 24:
          visibleDivider24 = false;
          visibleLine24 = false;
          textEditingController24.text = "";
          selectedItem24 = localization.choose;
          break;
        case 25:
          visibleDivider25 = false;
          visibleLine25 = false;
          textEditingController25.text = "";
          selectedItem25 = localization.choose;
          break;
        case 26:
          visibleDivider26 = false;
          visibleLine26 = false;
          textEditingController26.text = "";
          selectedItem26 = localization.choose;
          break;
        case 27:
          visibleDivider27 = false;
          visibleLine27 = false;
          textEditingController27.text = "";
          selectedItem27 = localization.choose;
          break;
        case 28:
          visibleDivider28 = false;
          visibleLine28 = false;
          textEditingController28.text = "";
          selectedItem28 = localization.choose;
          break;
        case 29:
          visibleDivider29 = false;
          visibleLine29 = false;
          textEditingController29.text = "";
          selectedItem29 = localization.choose;
          break;
        case 30:
          visibleDivider30 = false;
          visibleLine30 = false;
          textEditingController30.text = "";
          selectedItem30 = localization.choose;
          break;
        default:
      }
    });
  }

  List<Widget> getRowDetails() {
    var textStyle = TextStyle(color: Globals.AppBaseColor, fontSize: 16);

    var widgetList = List<Widget>();

    var column1 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem1,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem1 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(1),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );

    var column2 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController2,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem2,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem2 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(2),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );

    var column3 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController3,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem3,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem3 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(3),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );

    var column4 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController4,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem4,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem4 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(4),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );

    var column5 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController5,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem5,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem5 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(5),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    var column6 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine6,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController6,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem6,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem6 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(6),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    var column7 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine7,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController7,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem7,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem7 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(7),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    var column8 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine8,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController8,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem8,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem8 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    var column9 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine9,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController9,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem9,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem9 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(9),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    var column10 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController10,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem10,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem10 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(10),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    var column11 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine11,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController11,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem11,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem11 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(11),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    var column12 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine12,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController12,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem12,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem12 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    var column13 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine13,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController13,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem13,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem13 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(13),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );

    var column14 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine14,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController14,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem14,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem14 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(14),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );

    var column15 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine15,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController15,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem15,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem15 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(15),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );

    var column16 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine16,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController16,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem16,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem16 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(16),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );

    var column17 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine17,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController17,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem17,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem17 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(17),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );

    var column18 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine18,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController18,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem18,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem18 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(18),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );

    var column19 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine19,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController19,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem19,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem19 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(19),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    var column20 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine20,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController20,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem20,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem20 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    var column21 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine21,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController21,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem21,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem21 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(21),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    var column22 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine22,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController22,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem22,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem22 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(22),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    var column23 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine23,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController23,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem23,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem23 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(23),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    var column24 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine24,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController24,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem24,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem24 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(24),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    var column25 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine25,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController25,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem25,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem25 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(25),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    var column26 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine26,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController26,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem26,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem26 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(26),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    var column27 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine27,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController27,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem27,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem27 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(27),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    var column28 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine28,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController28,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem28,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem28 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(28),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    var column29 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine29,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController29,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem29,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem29 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(29),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    var column30 = Column(
      children: <Widget>[
        Visibility(
          visible: visibleLine30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingController30,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: '',
                      hintStyle: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: DropdownButton<String>(
                    value: selectedItem30,
                    icon:
                        Icon(Icons.arrow_downward, color: Globals.AppBaseColor),
                    style: TextStyle(color: Globals.AppBaseColor),
                    underline:
                        Container(height: 2, color: Globals.AppBaseColor),
                    onChanged: (String newValue) {
                      setState(() {
                        selectedItem30 = newValue;
                      });
                    },
                    items: StaticListHelper.getSelectedList(context),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Icon(
                      Icons.close,
                      color: Globals.AppBaseColor,
                    ),
                    onPressed: () => removeRow(30),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    var cityColumn = Column(
      children: <Widget>[
        Visibility(
          visible: true,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 10,
                  child: TextField(
                    style: textStyle,
                    controller: textEditingControllerCity,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Globals.AppBaseColor,
                      hintText: 'City',
                      hintStyle: textStyle,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );

    var countryDropDown = Column(
      children: <Widget>[
        Visibility(
          visible: true,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 10,
                  child: DropDownField(
                    value: selectedCountry,
                    icon: null,
                    required: false,
                    hintText: localization.chooseCountry,
                    labelText: null,
                    items: StaticListHelper.getCountryList(),
                    strict: false,
                    onValueChanged: (dynamic newValue) {
                      selectedCountry = newValue;
                      print("onValueChanged: $newValue");
                    },
                    controller: textEditingControllerCountry,
                    setter: (dynamic newValue) {
                      selectedCountry = newValue.toString();
                      print("setter: $newValue");
                    },
                    textStyle: textStyle,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );

    var firmListDropDown = Column(
      children: <Widget>[
        Visibility(
          visible: true,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 10,
                  child: DropDownField(
                    value: selectedFirm,
                    icon: null,
                    required: false,
                    hintText: localization.selectFirm,
                    labelText: null,
                    items: StaticListHelper.getFirmList(),
                    strict: false,
                    onValueChanged: (dynamic newValue) {
                      selectedFirm = newValue;
                      print("onValueChanged: $newValue");
                    },
                    controller: textEditingControllerFirm,
                    setter: (dynamic newValue) {
                      selectedFirm = newValue.toString();
                      print("setter: $newValue");
                    },
                    textStyle: textStyle,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );

    var sectorDropDown = Column(
      children: <Widget>[
        Visibility(
          visible: true,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 10,
                  child: DropDownField(
                    value: selectedSector,
                    icon: null,
                    required: false,
                    hintText: localization.chooseSector,
                    labelText: null,
                    items: StaticListHelper.getSectors(),
                    strict: false,
                    onValueChanged: (dynamic newValue) {
                      selectedSector = newValue;
                      print("onValueChanged: $newValue");
                    },
                    controller: textEditingControllerSector,
                    setter: (dynamic newValue) {
                      selectedSector = newValue.toString();
                      print("setter: $newValue");
                    },
                    textStyle: textStyle,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );

    var dividerStartInset = 4.0;
    var dividerEndInset = 4.0;
    var dividerLineHeight = 4.0;
    var dividerHeight = 1.0;

    var divider1 = Visibility(
      visible: visibleDivider1,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider2 = Visibility(
      visible: visibleDivider2,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider3 = Visibility(
      visible: visibleDivider3,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider4 = Visibility(
      visible: visibleDivider4,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider5 = Visibility(
      visible: visibleDivider5,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider6 = Visibility(
      visible: visibleDivider6,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider7 = Visibility(
      visible: visibleDivider7,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider8 = Visibility(
      visible: visibleDivider8,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider9 = Visibility(
      visible: visibleDivider9,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider10 = Visibility(
      visible: visibleDivider10,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider11 = Visibility(
      visible: visibleDivider11,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider12 = Visibility(
      visible: visibleDivider12,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider13 = Visibility(
      visible: visibleDivider13,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider14 = Visibility(
      visible: visibleDivider14,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider15 = Visibility(
      visible: visibleDivider15,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider16 = Visibility(
      visible: visibleDivider16,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider17 = Visibility(
      visible: visibleDivider17,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider18 = Visibility(
      visible: visibleDivider18,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider19 = Visibility(
      visible: visibleDivider19,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider20 = Visibility(
      visible: visibleDivider20,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider21 = Visibility(
      visible: visibleDivider21,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider22 = Visibility(
      visible: visibleDivider22,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider23 = Visibility(
      visible: visibleDivider23,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider24 = Visibility(
      visible: visibleDivider24,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider25 = Visibility(
      visible: visibleDivider25,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider26 = Visibility(
      visible: visibleDivider26,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider27 = Visibility(
      visible: visibleDivider27,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider28 = Visibility(
      visible: visibleDivider28,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider29 = Visibility(
      visible: visibleDivider29,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider30 = Visibility(
      visible: visibleDivider30,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    var divider = Visibility(
      visible: true,
      child: SizedBox(
        height: dividerLineHeight,
        child: new Center(
          child: new Container(
            margin: new EdgeInsetsDirectional.only(
                start: dividerStartInset, end: dividerEndInset),
            height: dividerHeight,
            color: Globals.AppBaseColor,
          ),
        ),
      ),
    );

    widgetList.add(column1);
    widgetList.add(divider1);
    widgetList.add(column2);
    widgetList.add(divider2);
    widgetList.add(column3);
    widgetList.add(divider3);
    widgetList.add(column4);
    widgetList.add(divider4);
    widgetList.add(column5);
    widgetList.add(divider5);
    widgetList.add(column6);
    widgetList.add(divider6);
    widgetList.add(column7);
    widgetList.add(divider7);
    widgetList.add(column8);
    widgetList.add(divider8);
    widgetList.add(column9);
    widgetList.add(divider9);
    widgetList.add(column10);
    widgetList.add(divider10);
    widgetList.add(column11);
    widgetList.add(divider11);
    widgetList.add(column12);
    widgetList.add(divider12);
    widgetList.add(column13);
    widgetList.add(divider13);
    widgetList.add(column14);
    widgetList.add(divider14);
    widgetList.add(column15);
    widgetList.add(divider15);
    widgetList.add(column16);
    widgetList.add(divider16);
    widgetList.add(column17);
    widgetList.add(divider17);
    widgetList.add(column18);
    widgetList.add(divider18);
    widgetList.add(column19);
    widgetList.add(divider19);
    widgetList.add(column20);
    widgetList.add(divider20);
    widgetList.add(column21);
    widgetList.add(divider21);
    widgetList.add(column22);
    widgetList.add(divider22);
    widgetList.add(column23);
    widgetList.add(divider23);
    widgetList.add(column24);
    widgetList.add(divider24);
    widgetList.add(column25);
    widgetList.add(divider25);
    widgetList.add(column26);
    widgetList.add(divider26);
    widgetList.add(column27);
    widgetList.add(divider27);
    widgetList.add(column28);
    widgetList.add(divider28);
    widgetList.add(column29);
    widgetList.add(divider29);
    widgetList.add(column30);
    widgetList.add(divider30);
    widgetList.add(cityColumn);
    widgetList.add(divider);
    widgetList.add(countryDropDown);
    widgetList.add(firmListDropDown);
    widgetList.add(sectorDropDown);

    return widgetList;
  }

  void clearFields() {
    lastRowNr = 1;

    selectedItem1 = localization.choose;
    selectedItem2 = localization.choose;
    selectedItem3 = localization.choose;
    selectedItem4 = localization.choose;
    selectedItem5 = localization.choose;
    selectedItem6 = localization.choose;
    selectedItem7 = localization.choose;
    selectedItem8 = localization.choose;
    selectedItem9 = localization.choose;
    selectedItem10 = localization.choose;
    selectedItem11 = localization.choose;
    selectedItem12 = localization.choose;
    selectedItem13 = localization.choose;
    selectedItem14 = localization.choose;
    selectedItem15 = localization.choose;
    selectedItem16 = localization.choose;
    selectedItem17 = localization.choose;
    selectedItem18 = localization.choose;
    selectedItem19 = localization.choose;
    selectedItem20 = localization.choose;
    selectedItem21 = localization.choose;
    selectedItem22 = localization.choose;
    selectedItem23 = localization.choose;
    selectedItem24 = localization.choose;
    selectedItem25 = localization.choose;
    selectedItem26 = localization.choose;
    selectedItem27 = localization.choose;
    selectedItem28 = localization.choose;
    selectedItem29 = localization.choose;
    selectedItem30 = localization.choose;

    readedText1 = "";
    readedText2 = "";
    readedText3 = "";
    readedText4 = "";
    readedText5 = "";
    readedText6 = "";
    readedText7 = "";
    readedText8 = "";
    readedText9 = "";
    readedText10 = "";
    readedText11 = "";
    readedText12 = "";
    readedText13 = "";
    readedText14 = "";
    readedText15 = "";
    readedText16 = "";
    readedText17 = "";
    readedText18 = "";
    readedText19 = "";
    readedText20 = "";
    readedText21 = "";
    readedText22 = "";
    readedText23 = "";
    readedText24 = "";
    readedText25 = "";
    readedText26 = "";
    readedText27 = "";
    readedText28 = "";
    readedText29 = "";
    readedText30 = "";

    visibleLine1 = false;
    visibleLine2 = false;
    visibleLine3 = false;
    visibleLine4 = false;
    visibleLine5 = false;
    visibleLine6 = false;
    visibleLine7 = false;
    visibleLine8 = false;
    visibleLine9 = false;
    visibleLine10 = false;
    visibleLine11 = false;
    visibleLine12 = false;
    visibleLine13 = false;
    visibleLine14 = false;
    visibleLine15 = false;
    visibleLine16 = false;
    visibleLine17 = false;
    visibleLine18 = false;
    visibleLine19 = false;
    visibleLine20 = false;
    visibleLine21 = false;
    visibleLine22 = false;
    visibleLine23 = false;
    visibleLine24 = false;
    visibleLine25 = false;
    visibleLine26 = false;
    visibleLine27 = false;
    visibleLine28 = false;
    visibleLine29 = false;
    visibleLine30 = false;

    visibleDivider1 = false;
    visibleDivider2 = false;
    visibleDivider3 = false;
    visibleDivider4 = false;
    visibleDivider5 = false;
    visibleDivider6 = false;
    visibleDivider7 = false;
    visibleDivider8 = false;
    visibleDivider9 = false;
    visibleDivider10 = false;
    visibleDivider11 = false;
    visibleDivider12 = false;
    visibleDivider13 = false;
    visibleDivider14 = false;
    visibleDivider15 = false;
    visibleDivider16 = false;
    visibleDivider17 = false;
    visibleDivider18 = false;
    visibleDivider19 = false;
    visibleDivider20 = false;
    visibleDivider21 = false;
    visibleDivider22 = false;
    visibleDivider23 = false;
    visibleDivider24 = false;
    visibleDivider25 = false;
    visibleDivider26 = false;
    visibleDivider27 = false;
    visibleDivider28 = false;
    visibleDivider29 = false;
    visibleDivider30 = false;

    // selectedCountry = "";

    // textEditingControllerCity.text = "";
    // textEditingControllerCountry.text = "";
  }

  takeText(ImageSource imageSource, bool isDoubleSide) async {
    setState(() {
      clearFields();
    });

    try {
      var file =
          await ImagePicker.pickImage(source: imageSource, imageQuality: 100);

      if (file != null) {
        setState(() {
          _file = file;
        });
        try {
          var currentLabels = await detector.detectFromPath(_file?.path);

          if (isDoubleSide) {
            file = await ImagePicker.pickImage(
                source: imageSource, imageQuality: 100);

            if (file != null) {
              setState(() {
                _file = file;
              });
            }

            try {
              var currentLabels2 = await detector.detectFromPath(_file?.path);

              for (VisionTextBlock visionText in currentLabels2) {
                currentLabels.add(visionText);
              }
            } catch (e) {
              ToastHelper.showToast(
                  "İkinci görüntü işlenirken sorun oluştu.\n" + e.toString(),
                  Toast.LENGTH_SHORT,
                  true);
            }
          }

          setState(() {
            clearFields();

            var lineNo = 1;

            bool isPhone1Set = false;
            bool isPhone2Set = false;
            bool isAddress1Set = false;
            bool isAddress2Set = false;
            bool isFaxPhoneSet = false;

            for (VisionTextBlock visionText in currentLabels) {
              for (VisionTextLine line in visionText.lines) {
                var mailString = patternHelper.getEMailAddress(line.text);
                var webUrlString = patternHelper.getWebUrl(line.text);
                var phone1 = patternHelper.getPhoneNumber(line.text);
                var phone2 = patternHelper
                    .getPhoneNumber(line.text.replaceAll(phone1, ""));
                var faxPhone = patternHelper.getFaxNumber(line.text);

                var address = patternHelper.getStreet(line.text);
                if (address.isEmpty) {
                  address = patternHelper.getAddress(line.text);
                }
                if (address.isEmpty) {
                  address = patternHelper.getBuildingNumber(line.text);
                }
                if (address.isEmpty) {
                  address = patternHelper.getApartmentNumber(line.text);
                }

                var address2 = patternHelper
                    .getStreet(line.text.replaceAll(line.text, address));

                if (address2.isEmpty) {
                  address2 = patternHelper
                      .getAddress(line.text.replaceAll(line.text, address));
                }
                if (address2.isEmpty) {
                  address2 = patternHelper.getBuildingNumber(
                      line.text.replaceAll(line.text, address));
                }
                if (address2.isEmpty) {
                  address2 = patternHelper.getApartmentNumber(
                      line.text.replaceAll(line.text, address));
                }

                var address3 = patternHelper
                    .getStreet(line.text.replaceAll(line.text, address));

                if (address3.isEmpty) {
                  address3 = patternHelper
                      .getAddress(line.text.replaceAll(line.text, address));
                }
                if (address3.isEmpty) {
                  address3 = patternHelper.getBuildingNumber(
                      line.text.replaceAll(line.text, address));
                }
                if (address3.isEmpty) {
                  address3 = patternHelper.getApartmentNumber(
                      line.text.replaceAll(line.text, address));
                }

                phone1 = turkish
                    .toUpperCase(phone1)
                    .replaceAll("G", "")
                    .replaceAll("S", "")
                    .replaceAll("M", "")
                    .replaceAll("T", "")
                    .replaceAll("E", "")
                    .replaceAll("L", "")
                    .replaceAll("F", "")
                    .replaceAll("A", "")
                    .replaceAll("X", "")
                    .replaceAll("M", "")
                    .replaceAll("O", "")
                    .replaceAll("B", "")
                    .replaceAll("i", "")
                    .replaceAll("L", "")
                    .replaceAll("-", "")
                    .replaceAll("+", "")
                    .replaceAll(".", "")
                    .replaceAll(":", "");

                phone2 = turkish
                    .toUpperCase(phone2)
                    .replaceAll("G", "")
                    .replaceAll("S", "")
                    .replaceAll("M", "")
                    .replaceAll("T", "")
                    .replaceAll("E", "")
                    .replaceAll("L", "")
                    .replaceAll("F", "")
                    .replaceAll("A", "")
                    .replaceAll("X", "")
                    .replaceAll("M", "")
                    .replaceAll("O", "")
                    .replaceAll("B", "")
                    .replaceAll("i", "")
                    .replaceAll("L", "")
                    .replaceAll("-", "")
                    .replaceAll(".", "")
                    .replaceAll("+", "")
                    .replaceAll(":", "");

                faxPhone = turkish
                    .toUpperCase(faxPhone)
                    .replaceAll("G", "")
                    .replaceAll("S", "")
                    .replaceAll("M", "")
                    .replaceAll("T", "")
                    .replaceAll("E", "")
                    .replaceAll("L", "")
                    .replaceAll("F", "")
                    .replaceAll("A", "")
                    .replaceAll("X", "")
                    .replaceAll("M", "")
                    .replaceAll("O", "")
                    .replaceAll("B", "")
                    .replaceAll("i", "")
                    .replaceAll("-", "")
                    .replaceAll(".", "")
                    .replaceAll("L", "")
                    .replaceAll("+", "")
                    .replaceAll(":", "");

                print("");
                print("---------------------------------------------");
                print("");
                print("#$lineNo");
                print(line.text);
                print("mailString: $mailString");
                print("webUrlString: $webUrlString");
                print("phone1: $phone1");
                print("phone2: $phone2");
                print("faxPhone: $faxPhone");
                print("address: $address");
                print("address2: $address2");
                print("address3: $address3");
                print("");
                print("---------------------------------------------");
                print("");

                lastRowNr = lineNo;

                switch (lineNo) {
                  case 1:
                    visibleDivider1 = true;
                    visibleLine1 = true;
                    textEditingController1.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem1 = localization.eMail;
                      textEditingController1.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem1 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController1.text = phone1;

                      if (!isPhone1Set) {
                        selectedItem1 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem1 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem1 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem1 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem1 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem1 = localization.fax;
                      textEditingController1.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 2:
                    visibleDivider2 = true;
                    visibleLine2 = true;
                    textEditingController2.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem2 = localization.eMail;
                      textEditingController2.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem2 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController2.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem2 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem2 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem2 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem2 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem2 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem2 = localization.fax;
                      textEditingController2.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 3:
                    visibleDivider3 = true;
                    visibleLine3 = true;
                    textEditingController3.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem3 = localization.eMail;
                      textEditingController3.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem3 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController3.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem3 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem3 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem3 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem3 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem3 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem3 = localization.fax;
                      textEditingController3.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 4:
                    visibleDivider4 = true;
                    visibleLine4 = true;
                    textEditingController4.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem4 = localization.eMail;
                      textEditingController4.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem4 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController4.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem4 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem4 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem4 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem4 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem4 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem4 = localization.fax;
                      textEditingController4.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 5:
                    visibleDivider5 = true;
                    visibleLine5 = true;
                    textEditingController5.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem5 = localization.eMail;
                      textEditingController5.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem5 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController5.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem5 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem5 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem5 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem5 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem5 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem5 = localization.fax;
                      textEditingController5.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 6:
                    visibleDivider6 = true;
                    visibleLine6 = true;
                    textEditingController6.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem6 = localization.eMail;
                      textEditingController6.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem6 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController6.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem6 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem6 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem6 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem6 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem6 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem6 = localization.fax;
                      textEditingController6.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 7:
                    visibleDivider7 = true;
                    visibleLine7 = true;
                    textEditingController7.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem7 = localization.eMail;
                      textEditingController7.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem7 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController7.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem7 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem7 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem7 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem7 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem7 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem7 = localization.fax;
                      textEditingController7.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 8:
                    visibleDivider8 = true;
                    visibleLine8 = true;
                    textEditingController8.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem8 = localization.eMail;
                      textEditingController8.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem8 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController8.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem8 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem8 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem8 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem8 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem8 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem8 = localization.fax;
                      textEditingController8.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 9:
                    visibleDivider9 = true;
                    visibleLine9 = true;
                    textEditingController9.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem9 = localization.eMail;
                      textEditingController9.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem9 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController9.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem9 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem9 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem9 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem9 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem9 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem9 = localization.fax;
                      textEditingController9.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 10:
                    visibleDivider10 = true;
                    visibleLine10 = true;
                    textEditingController10.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem10 = localization.eMail;
                      textEditingController10.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem10 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController10.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem10 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem10 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem10 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem10 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem10 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem10 = localization.fax;
                      textEditingController10.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 11:
                    visibleDivider11 = true;
                    visibleLine11 = true;
                    textEditingController11.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem11 = localization.eMail;
                      textEditingController11.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem11 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController11.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem11 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem11 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem11 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem11 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem11 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem11 = localization.fax;
                      textEditingController11.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 12:
                    visibleDivider12 = true;
                    visibleLine12 = true;
                    textEditingController12.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem12 = localization.eMail;
                      textEditingController12.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem12 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController12.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem12 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem12 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem12 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem12 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem12 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem12 = localization.fax;
                      textEditingController12.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 13:
                    visibleDivider13 = true;
                    visibleLine13 = true;
                    textEditingController13.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem13 = localization.eMail;
                      textEditingController13.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem13 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController13.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem13 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem13 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem13 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem13 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem13 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem13 = localization.fax;
                      textEditingController13.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 14:
                    visibleDivider14 = true;
                    visibleLine14 = true;
                    textEditingController14.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem14 = localization.eMail;
                      textEditingController14.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem14 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController14.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem14 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem14 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem14 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem14 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem14 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem14 = localization.fax;
                      textEditingController14.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 15:
                    visibleDivider15 = true;
                    visibleLine15 = true;
                    textEditingController15.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem15 = localization.eMail;
                      textEditingController15.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem15 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController15.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem15 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem15 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem15 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem15 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem15 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem15 = localization.fax;
                      textEditingController15.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 16:
                    visibleDivider16 = true;
                    visibleLine16 = true;
                    textEditingController16.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem16 = localization.eMail;
                      textEditingController16.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem16 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController16.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem16 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem16 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem16 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem16 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem16 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem16 = localization.fax;
                      textEditingController16.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 17:
                    visibleDivider17 = true;
                    visibleLine17 = true;
                    textEditingController17.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem17 = localization.eMail;
                      textEditingController17.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem17 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController17.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem17 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem17 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem17 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem17 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem17 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem17 = localization.fax;
                      textEditingController17.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 18:
                    visibleDivider18 = true;
                    visibleLine18 = true;
                    textEditingController18.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem18 = localization.eMail;
                      textEditingController18.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem18 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController18.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem18 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem18 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem18 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem18 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem18 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem18 = localization.fax;
                      textEditingController18.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 19:
                    visibleDivider19 = true;
                    visibleLine19 = true;
                    textEditingController19.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem19 = localization.eMail;
                      textEditingController19.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem19 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController19.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem19 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem19 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem19 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem19 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem19 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem19 = localization.fax;
                      textEditingController19.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 20:
                    visibleDivider20 = true;
                    visibleLine20 = true;
                    textEditingController20.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem20 = localization.eMail;
                      textEditingController20.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem20 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController20.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem20 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem20 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem20 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem20 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem20 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem20 = localization.fax;
                      textEditingController20.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 21:
                    visibleDivider21 = true;
                    visibleLine21 = true;
                    textEditingController21.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem21 = localization.eMail;
                      textEditingController21.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem21 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController21.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem21 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem21 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem21 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem21 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem21 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem21 = localization.fax;
                      textEditingController21.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 22:
                    visibleDivider22 = true;
                    visibleLine22 = true;
                    textEditingController22.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem22 = localization.eMail;
                      textEditingController22.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem22 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController22.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem22 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem22 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem22 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem22 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem22 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem22 = localization.fax;
                      textEditingController22.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 23:
                    visibleDivider23 = true;
                    visibleLine23 = true;
                    textEditingController23.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem23 = localization.eMail;
                      textEditingController23.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem23 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController23.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem23 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem23 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem23 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem23 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem23 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem23 = localization.fax;
                      textEditingController23.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 24:
                    visibleDivider24 = true;
                    visibleLine24 = true;
                    textEditingController24.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem24 = localization.eMail;
                      textEditingController24.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem24 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController24.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem24 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem24 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem24 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem24 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem24 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem24 = localization.fax;
                      textEditingController24.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 25:
                    visibleDivider25 = true;
                    visibleLine25 = true;
                    textEditingController25.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem25 = localization.eMail;
                      textEditingController25.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem25 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController25.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem25 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem25 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem25 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem25 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem25 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem25 = localization.fax;
                      textEditingController25.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 26:
                    visibleDivider26 = true;
                    visibleLine26 = true;
                    textEditingController26.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem26 = localization.eMail;
                      textEditingController26.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem26 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController26.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem26 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem26 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem26 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem26 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem26 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem26 = localization.fax;
                      textEditingController26.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 27:
                    visibleDivider27 = true;
                    visibleLine27 = true;
                    textEditingController27.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem27 = localization.eMail;
                      textEditingController27.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem27 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController27.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem27 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem27 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem27 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem27 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem27 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem27 = localization.fax;
                      textEditingController27.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 28:
                    visibleDivider28 = true;
                    visibleLine28 = true;
                    textEditingController28.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem28 = localization.eMail;
                      textEditingController28.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem28 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController28.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem28 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem28 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem28 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem28 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem28 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem28 = localization.fax;
                      textEditingController28.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 29:
                    visibleDivider29 = true;
                    visibleLine29 = true;
                    textEditingController29.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem29 = localization.eMail;
                      textEditingController29.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem29 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController29.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem29 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem29 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem29 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem29 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem29 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem29 = localization.fax;
                      textEditingController29.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  case 30:
                    visibleDivider30 = true;
                    visibleLine30 = true;
                    textEditingController30.text = line.text;
                    if (mailString.isNotEmpty) {
                      selectedItem30 = localization.eMail;
                      textEditingController30.text = mailString;
                    } else if (webUrlString.isNotEmpty) {
                      selectedItem30 = localization.web;
                    } else if (phone1.isNotEmpty) {
                      textEditingController30.text = phone1;
                      if (!isPhone1Set) {
                        selectedItem30 = localization.mobilePhone;
                        isPhone1Set = true;
                      } else if (isPhone1Set && !isPhone2Set) {
                        selectedItem30 = localization.workPhone;
                        isPhone2Set = true;
                      } else {
                        selectedItem30 = localization.fax;
                      }
                    } else if (!isAddress1Set && address.isNotEmpty) {
                      selectedItem30 = localization.address1;
                      isAddress1Set = true;
                    } else if (isAddress1Set &&
                        !isAddress2Set &&
                        address2.isNotEmpty) {
                      selectedItem30 = localization.address2;
                      isAddress2Set = true;
                    } else if (!isFaxPhoneSet && faxPhone.isNotEmpty) {
                      selectedItem30 = localization.fax;
                      textEditingController30.text = faxPhone;
                      isFaxPhoneSet = true;
                    }
                    break;
                  default:
                }

                lineNo++;

                if (isPhone1Set && phone2.isNotEmpty) {
                  switch (lineNo) {
                    case 1:
                      visibleDivider1 = true;
                      visibleLine1 = true;
                      textEditingController1.text = phone2;
                      lineNo++;
                      break;
                    case 2:
                      visibleDivider2 = true;
                      visibleLine2 = true;
                      textEditingController2.text = phone2;
                      lineNo++;
                      break;
                    case 3:
                      visibleDivider3 = true;
                      visibleLine3 = true;
                      textEditingController3.text = phone2;
                      lineNo++;
                      break;
                    case 4:
                      visibleDivider4 = true;
                      visibleLine4 = true;
                      textEditingController4.text = phone2;
                      lineNo++;
                      break;
                    case 5:
                      visibleDivider5 = true;
                      visibleLine5 = true;
                      textEditingController5.text = phone2;
                      lineNo++;
                      break;
                    case 6:
                      visibleDivider6 = true;
                      visibleLine6 = true;
                      textEditingController6.text = phone2;
                      lineNo++;
                      break;
                    case 7:
                      visibleDivider7 = true;
                      visibleLine7 = true;
                      textEditingController7.text = phone2;
                      lineNo++;
                      break;
                    case 8:
                      visibleDivider8 = true;
                      visibleLine8 = true;
                      textEditingController8.text = phone2;
                      lineNo++;
                      break;
                    case 9:
                      visibleDivider9 = true;
                      visibleLine9 = true;
                      textEditingController9.text = phone2;
                      lineNo++;
                      break;
                    case 10:
                      visibleDivider10 = true;
                      visibleLine10 = true;
                      textEditingController10.text = phone2;
                      lineNo++;
                      break;
                    case 11:
                      visibleDivider11 = true;
                      visibleLine11 = true;
                      textEditingController11.text = phone2;
                      lineNo++;
                      break;
                    case 12:
                      visibleDivider12 = true;
                      visibleLine12 = true;
                      textEditingController12.text = phone2;
                      lineNo++;
                      break;
                    case 13:
                      visibleDivider13 = true;
                      visibleLine13 = true;
                      textEditingController13.text = phone2;
                      lineNo++;
                      break;
                    case 14:
                      visibleDivider14 = true;
                      visibleLine14 = true;
                      textEditingController14.text = phone2;
                      lineNo++;
                      break;
                    case 15:
                      visibleDivider15 = true;
                      visibleLine15 = true;
                      textEditingController15.text = phone2;
                      lineNo++;
                      break;
                    case 16:
                      visibleDivider16 = true;
                      visibleLine16 = true;
                      textEditingController16.text = phone2;
                      lineNo++;
                      break;
                    case 17:
                      visibleDivider17 = true;
                      visibleLine17 = true;
                      textEditingController17.text = phone2;
                      lineNo++;
                      break;
                    case 18:
                      visibleDivider18 = true;
                      visibleLine18 = true;
                      textEditingController18.text = phone2;
                      lineNo++;
                      break;
                    case 19:
                      visibleDivider19 = true;
                      visibleLine19 = true;
                      textEditingController19.text = phone2;
                      lineNo++;
                      break;
                    case 20:
                      visibleDivider20 = true;
                      visibleLine20 = true;
                      textEditingController20.text = phone2;
                      lineNo++;
                      break;
                    case 21:
                      visibleDivider21 = true;
                      visibleLine21 = true;
                      textEditingController21.text = phone2;
                      lineNo++;
                      break;
                    case 22:
                      visibleDivider22 = true;
                      visibleLine22 = true;
                      textEditingController22.text = phone2;
                      lineNo++;
                      break;
                    case 23:
                      visibleDivider23 = true;
                      visibleLine23 = true;
                      textEditingController23.text = phone2;
                      lineNo++;
                      break;
                    case 24:
                      visibleDivider24 = true;
                      visibleLine24 = true;
                      textEditingController24.text = phone2;
                      lineNo++;
                      break;
                    case 25:
                      visibleDivider25 = true;
                      visibleLine25 = true;
                      textEditingController25.text = phone2;
                      lineNo++;
                      break;
                    case 26:
                      visibleDivider26 = true;
                      visibleLine26 = true;
                      textEditingController26.text = phone2;
                      lineNo++;
                      break;
                    case 27:
                      visibleDivider27 = true;
                      visibleLine27 = true;
                      textEditingController27.text = phone2;
                      lineNo++;
                      break;
                    case 28:
                      visibleDivider28 = true;
                      visibleLine28 = true;
                      textEditingController28.text = phone2;
                      lineNo++;
                      break;
                    case 29:
                      visibleDivider29 = true;
                      visibleLine29 = true;
                      textEditingController29.text = phone2;
                      lineNo++;
                      break;
                    case 30:
                      visibleDivider30 = true;
                      visibleLine30 = true;
                      textEditingController30.text = phone2;
                      lineNo++;
                      break;
                  }
                }
              }
            }
          });
        } catch (e) {
          ToastHelper.showToast(e.toString());
          print("Hata1: " + e.toString());
        }
      }
    } catch (e) {
      ToastHelper.showToast(e.toString());
      print("Hata2: " + e.toString());
    }
  }

  transferData() async {
    var country = turkish.toUpperCase(getCountry());
    var city = turkish.toUpperCase(getCity());

    if (country.isEmpty) {
      ToastHelper.showToast(
        localization.countryCannotBePassedEmpty,
        Toast.LENGTH_LONG,
        true,
      );
      return;
    }
    if (city.isEmpty) {
      ToastHelper.showToast(
        localization.cityCannotBePassedEmpty,
        Toast.LENGTH_LONG,
        true,
      );
      return;
    }
    if (getFirmTitle().isEmpty) {
      ToastHelper.showToast(
        localization.clientDefinitionCannotBePassedEmpty,
        Toast.LENGTH_LONG,
        true,
      );
      return;
    }
    if (getAddress().isEmpty) {
      ToastHelper.showToast(
        localization.addressCannotBePassedEmpty,
        Toast.LENGTH_LONG,
        true,
      );
      return;
    }
    if (selectedFirm.isEmpty) {
      ToastHelper.showToast(
        localization.pleaseSelectFirmCategory,
        Toast.LENGTH_LONG,
        true,
      );
      return;
    }
    if (selectedSector.isEmpty) {
      ToastHelper.showToast(
        localization.pleaseSelectSector,
        Toast.LENGTH_LONG,
        true,
      );
      return;
    }

    ToastHelper.showToast("Aktarım Başladı");

    if (_crmLoginResult.sessionId.isEmpty) {
      ToastHelper.showToast("Bağlantı Yapılıyor.");

      _crmLoginResult =
          await RestHelper.loginToRest().then((onValue) => onValue);

      if (_crmLoginResult.result == 0) {
        return;
      }
    }

    var firm = getFirm();

    var countryOid = await RestHelper.getCountryOid(country).then((onValue) {
      return onValue;
    });

    if (countryOid.isEmpty) {
      ToastHelper.showToast(
        localization.countryIsNotFound,
        Toast.LENGTH_LONG,
        true,
      );
      return;
    }

    firm.countryOid = countryOid;

    var cities = await RestHelper.getCities(country).then((onValue) => onValue);

    var crmCityList = cities.items.where((i) => i.cityName == city);

    var crmCity = new CityItems("", "", "", 0);

    if (crmCityList.any((i) => i.cityName == city)) {
      crmCity = cities.items.firstWhere((i) => i.cityName == city);
    }

    if (crmCity.oid.isEmpty) {
      ToastHelper.showToast(
        localization.cityIsNotFound,
        Toast.LENGTH_LONG,
        true,
      );
      return;
    }

    var sectorOid = await RestHelper.getSectorOid(selectedSector)
        .then((onValue) => onValue);

    if (sectorOid.isEmpty) {
      ToastHelper.showToast(
        localization.sectorIsNotFound,
        Toast.LENGTH_LONG,
        true,
      );
      return;
    }

    firm.sectorName = selectedSector;
    firm.sectorOid = sectorOid;
    firm.cityOid = crmCity.oid;

    var firmCategory01Oid = await RestHelper.getFirmCategory01Oid(selectedFirm)
        .then((onValue) => onValue);

    firm.firmCategory01Oid = firmCategory01Oid;

    var firmOid = "";

    if (firm.eMailAddress1.isNotEmpty || firm.webAddress1.isNotEmpty) {
      var firmDomain = patternHelper.getMailDomain(firm.eMailAddress1);

      if (firmDomain.isNotEmpty) {
        var domainResult = await RestHelper.getFirmByMailDomain(firmDomain)
            .then((onValue) => onValue);

        if (domainResult.items.length > 0) {
          firmOid = await RestHelper.getFirmByMailDomain(firmDomain)
              .then((onValue) => onValue.items.first.oid);
        }

        if (firmOid.isEmpty) {
          firmDomain = patternHelper.getWebDomain(firm.eMailAddress1);

          if (firmDomain.isNotEmpty) {
            var webDomainResult =
                await RestHelper.getFirmByWebDomain(firmDomain)
                    .then((onValue) => onValue);

            if (webDomainResult.items.length > 0) {
              firmOid = await RestHelper.getFirmByWebDomain(firmDomain)
                  .then((onValue) => onValue.items.first.oid);
            }
          }
        }
      } else {
        firmDomain = patternHelper.getWebDomain(firm.eMailAddress1);

        if (firmDomain.isNotEmpty) {
          firmOid = await RestHelper.getFirmByWebDomain(firmDomain)
              .then((onValue) => onValue.items.first.oid);
        }
      }
    }

    var crmPostResultModel = new CrmPostResultModel(0, "");

    if (firmOid.isEmpty) {
      var crmPostResultModel =
          await RestHelper.postClient(firm).then((onValue) => onValue);
      firm.oid = crmPostResultModel.items.first.oid;

      if (crmPostResultModel.result == 0) {
        return;
      }
    } else {
      firm.oid = firmOid;
    }

    if (firm.phone1.isNotEmpty) {
      if (firmOid.isNotEmpty) {
        var crmPostResultModel =
            await RestHelper.getPhoneByRelatedFirm(firm.phone1, firmOid)
                .then((onValue) => onValue);

        if (crmPostResultModel.items.length == 0) {
          print("Phone1 daha önce aktarılmamış. Oluşturulacak.");

          var phone = new Phone();
          phone.number = firm.phone1;
          phone.areaCode = "";
          phone.extension = "";
          phone.contactOid = "";
          phone.firmOid = firm.oid;
          phone.countryOid = firm.countryOid;

          crmPostResultModel =
              await RestHelper.postCellPhone(phone).then((onValue) {
            return onValue;
          });
        } else {
          print("Phone1 daha önce aktarılmış.");
        }
      } else {
        var phone = new Phone();
        phone.number = firm.phone1;
        phone.areaCode = "";
        phone.extension = "";
        phone.contactOid = "";
        phone.firmOid = firm.oid;
        phone.countryOid = firm.countryOid;

        crmPostResultModel =
            await RestHelper.postCellPhone(phone).then((onValue) {
          return onValue;
        });
      }
    }

    if (firm.phone2.isNotEmpty) {
      var extension = getWorkPhoneExtension();

      if (firmOid.isNotEmpty) {
        var crmPostResultModel =
            await RestHelper.getPhoneByRelatedFirm(firm.phone2, firmOid)
                .then((onValue) => onValue);

        if (crmPostResultModel.items.length == 0) {
          print("Phone2 daha önce aktarılmamış. Oluşturulacak.");
          var phone = new Phone();
          phone.number = firm.phone2;
          phone.areaCode = "";
          phone.extension = extension;
          phone.contactOid = "";
          phone.firmOid = firm.oid;
          phone.countryOid = firm.countryOid;

          crmPostResultModel =
              await RestHelper.postWorkPhone(phone).then((onValue) => onValue);
        } else {
          print("Phone2 daha önce aktarılmış.");
        }
      } else {
        var phone = new Phone();
        phone.number = firm.phone2;
        phone.areaCode = "";
        phone.extension = extension;
        phone.contactOid = "";
        phone.firmOid = firm.oid;
        phone.countryOid = firm.countryOid;

        crmPostResultModel =
            await RestHelper.postWorkPhone(phone).then((onValue) => onValue);
      }
    }

    if (firm.fax.isNotEmpty) {
      if (firmOid.isNotEmpty) {
        var crmPostResultModel =
            await RestHelper.getPhoneByRelatedFirm(firm.fax, firmOid)
                .then((onValue) => onValue);

        if (crmPostResultModel.items.length == 0) {
          print("Fax daha önce aktarılmamış. Oluşturulacak.");
          var phone = new Phone();
          phone.number = firm.fax;
          phone.areaCode = "";
          phone.extension = "";
          phone.contactOid = "";
          phone.firmOid = firm.oid;
          phone.countryOid = firm.countryOid;

          crmPostResultModel =
              await RestHelper.postFaxPhone(phone).then((onValue) => onValue);
        } else {
          print("Fax daha önce aktarılmış.");
        }
      } else {
        var phone = new Phone();
        phone.number = firm.fax;
        phone.areaCode = "";
        phone.extension = "";
        phone.contactOid = "";
        phone.firmOid = firm.oid;
        phone.countryOid = firm.countryOid;

        crmPostResultModel =
            await RestHelper.postFaxPhone(phone).then((onValue) => onValue);
      }
    }

    crmPostResultModel =
        await RestHelper.postAddress(firm).then((onValue) => onValue);

    if (firm.personName.isNotEmpty) {
      crmPostResultModel =
          await RestHelper.postPerson(firm).then((onValue) => onValue);

      if (crmPostResultModel.result == 1) {
        var phone = new Phone();
        phone.number = firm.phone1;
        phone.areaCode = "";
        phone.extension = "";
        phone.contactOid = "";
        phone.firmOid = "";
        phone.contactOid = crmPostResultModel.items.first.oid;
        phone.countryOid = firm.countryOid;

        crmPostResultModel =
            await RestHelper.postCellPhone(phone).then((onValue) => onValue);
      }
    }

    ToastHelper.showToast("Aktarım İşlemleri Tamamlandı.");
  }

  Firm getFirm() {
    var firm = new Firm();
    firm.firmTitle = getFirmTitle();
    firm.mainAddress = getAddress();
    firm.city = textEditingControllerCity.text;
    firm.town = "";
    firm.country = textEditingControllerCountry.text;

    firm.phone1 = StringHelper.getPhoneText(getMobilePhone());
    firm.phone2 = StringHelper.getPhoneText(getWorkPhone());
    firm.fax = StringHelper.getPhoneText(getFaxPhone());

    firm.eMailAddress1 = StringHelper.getMailText(getEMail());
    firm.eMailAddress2 = "";
    firm.eMailAddress3 = "";
    firm.webAddress1 = StringHelper.getWebUrlText(getWeb());
    firm.webAddress2 = "";
    firm.cityOfMainAddress = "";
    firm.countryOfMainAddress = "";
    firm.isPersonCompany = false;
    firm.inUse = true;
    firm.personTitle = getPersonTitle();
    firm.personName = getPersonName();

    return firm;
  }

  String getCity() {
    if (selectedItem1 == localization.city) {
      return textEditingController1.text;
    } else if (selectedItem2 == localization.city) {
      return textEditingController2.text;
    } else if (selectedItem3 == localization.city) {
      return textEditingController3.text;
    } else if (selectedItem4 == localization.city) {
      return textEditingController4.text;
    } else if (selectedItem5 == localization.city) {
      return textEditingController5.text;
    } else if (selectedItem6 == localization.city) {
      return textEditingController6.text;
    } else if (selectedItem7 == localization.city) {
      return textEditingController7.text;
    } else if (selectedItem8 == localization.city) {
      return textEditingController8.text;
    } else if (selectedItem9 == localization.city) {
      return textEditingController9.text;
    } else if (selectedItem10 == localization.city) {
      return textEditingController10.text;
    } else if (selectedItem11 == localization.city) {
      return textEditingController11.text;
    } else if (selectedItem12 == localization.city) {
      return textEditingController12.text;
    } else if (selectedItem13 == localization.city) {
      return textEditingController13.text;
    } else if (selectedItem14 == localization.city) {
      return textEditingController14.text;
    } else if (selectedItem15 == localization.city) {
      return textEditingController15.text;
    } else if (selectedItem16 == localization.city) {
      return textEditingController16.text;
    } else if (selectedItem17 == localization.city) {
      return textEditingController17.text;
    } else if (selectedItem18 == localization.city) {
      return textEditingController18.text;
    } else if (selectedItem19 == localization.city) {
      return textEditingController19.text;
    } else if (selectedItem20 == localization.city) {
      return textEditingController20.text;
    } else if (textEditingControllerCity.text.isNotEmpty) {
      return textEditingControllerCity.text;
    }
    return "";
  }

  String getCountry() {
    if (selectedItem1 == localization.country) {
      return textEditingController1.text;
    } else if (selectedItem2 == localization.country) {
      return textEditingController2.text;
    } else if (selectedItem3 == localization.country) {
      return textEditingController3.text;
    } else if (selectedItem4 == localization.country) {
      return textEditingController4.text;
    } else if (selectedItem5 == localization.country) {
      return textEditingController5.text;
    } else if (selectedItem6 == localization.country) {
      return textEditingController6.text;
    } else if (selectedItem7 == localization.country) {
      return textEditingController7.text;
    } else if (selectedItem8 == localization.country) {
      return textEditingController8.text;
    } else if (selectedItem9 == localization.country) {
      return textEditingController9.text;
    } else if (selectedItem10 == localization.country) {
      return textEditingController10.text;
    } else if (selectedItem11 == localization.country) {
      return textEditingController11.text;
    } else if (selectedItem12 == localization.country) {
      return textEditingController12.text;
    } else if (selectedItem13 == localization.country) {
      return textEditingController13.text;
    } else if (selectedItem14 == localization.country) {
      return textEditingController14.text;
    } else if (selectedItem15 == localization.country) {
      return textEditingController15.text;
    } else if (selectedItem16 == localization.country) {
      return textEditingController16.text;
    } else if (selectedItem17 == localization.country) {
      return textEditingController17.text;
    } else if (selectedItem18 == localization.country) {
      return textEditingController18.text;
    } else if (selectedItem19 == localization.country) {
      return textEditingController19.text;
    } else if (selectedItem20 == localization.country) {
      return textEditingController20.text;
    } else if (textEditingControllerCountry.text.isNotEmpty) {
      return textEditingControllerCountry.text;
    }
    return "";
  }

  String getFirmTitle() {
    var firmTitle1 = "";

    if (selectedItem1 == localization.firmTitle1) {
      firmTitle1 = textEditingController1.text;
    } else if (selectedItem2 == localization.firmTitle1) {
      firmTitle1 = textEditingController2.text;
    } else if (selectedItem3 == localization.firmTitle1) {
      firmTitle1 = textEditingController3.text;
    } else if (selectedItem4 == localization.firmTitle1) {
      firmTitle1 = textEditingController4.text;
    } else if (selectedItem5 == localization.firmTitle1) {
      firmTitle1 = textEditingController5.text;
    } else if (selectedItem6 == localization.firmTitle1) {
      firmTitle1 = textEditingController6.text;
    } else if (selectedItem7 == localization.firmTitle1) {
      firmTitle1 = textEditingController7.text;
    } else if (selectedItem8 == localization.firmTitle1) {
      firmTitle1 = textEditingController8.text;
    } else if (selectedItem9 == localization.firmTitle1) {
      firmTitle1 = textEditingController9.text;
    } else if (selectedItem10 == localization.firmTitle1) {
      firmTitle1 = textEditingController10.text;
    } else if (selectedItem11 == localization.firmTitle1) {
      firmTitle1 = textEditingController11.text;
    } else if (selectedItem12 == localization.firmTitle1) {
      firmTitle1 = textEditingController12.text;
    } else if (selectedItem13 == localization.firmTitle1) {
      firmTitle1 = textEditingController13.text;
    } else if (selectedItem14 == localization.firmTitle1) {
      firmTitle1 = textEditingController14.text;
    } else if (selectedItem15 == localization.firmTitle1) {
      firmTitle1 = textEditingController15.text;
    } else if (selectedItem16 == localization.firmTitle1) {
      firmTitle1 = textEditingController16.text;
    } else if (selectedItem17 == localization.firmTitle1) {
      firmTitle1 = textEditingController17.text;
    } else if (selectedItem18 == localization.firmTitle1) {
      firmTitle1 = textEditingController18.text;
    } else if (selectedItem19 == localization.firmTitle1) {
      firmTitle1 = textEditingController19.text;
    } else if (selectedItem20 == localization.firmTitle1) {
      firmTitle1 = textEditingController20.text;
    }
    var firmTitle2 = "";

    if (selectedItem1 == localization.firmTitle2) {
      firmTitle2 = textEditingController1.text;
    } else if (selectedItem2 == localization.firmTitle2) {
      firmTitle2 = textEditingController2.text;
    } else if (selectedItem3 == localization.firmTitle2) {
      firmTitle2 = textEditingController3.text;
    } else if (selectedItem4 == localization.firmTitle2) {
      firmTitle2 = textEditingController4.text;
    } else if (selectedItem5 == localization.firmTitle2) {
      firmTitle2 = textEditingController5.text;
    } else if (selectedItem6 == localization.firmTitle2) {
      firmTitle2 = textEditingController6.text;
    } else if (selectedItem7 == localization.firmTitle2) {
      firmTitle2 = textEditingController7.text;
    } else if (selectedItem8 == localization.firmTitle2) {
      firmTitle2 = textEditingController8.text;
    } else if (selectedItem9 == localization.firmTitle2) {
      firmTitle2 = textEditingController9.text;
    } else if (selectedItem10 == localization.firmTitle2) {
      firmTitle2 = textEditingController10.text;
    } else if (selectedItem11 == localization.firmTitle2) {
      firmTitle2 = textEditingController11.text;
    } else if (selectedItem12 == localization.firmTitle2) {
      firmTitle2 = textEditingController12.text;
    } else if (selectedItem13 == localization.firmTitle2) {
      firmTitle2 = textEditingController13.text;
    } else if (selectedItem14 == localization.firmTitle2) {
      firmTitle2 = textEditingController14.text;
    } else if (selectedItem15 == localization.firmTitle2) {
      firmTitle2 = textEditingController15.text;
    } else if (selectedItem16 == localization.firmTitle2) {
      firmTitle2 = textEditingController16.text;
    } else if (selectedItem17 == localization.firmTitle2) {
      firmTitle2 = textEditingController17.text;
    } else if (selectedItem18 == localization.firmTitle2) {
      firmTitle2 = textEditingController18.text;
    } else if (selectedItem19 == localization.firmTitle2) {
      firmTitle2 = textEditingController19.text;
    } else if (selectedItem20 == localization.firmTitle2) {
      firmTitle2 = textEditingController20.text;
    }

    if (firmTitle1.isNotEmpty && firmTitle2.isNotEmpty) {
      return firmTitle1 + " " + firmTitle2;
    } else if (firmTitle1.isNotEmpty && firmTitle2.isEmpty) {
      return firmTitle1;
    } else if (firmTitle1.isEmpty && firmTitle2.isNotEmpty) {
      return firmTitle2;
    } else {
      return "";
    }
  }

  String getAddress() {
    var address1 = "";

    if (selectedItem1 == localization.address1) {
      address1 = textEditingController1.text;
    } else if (selectedItem2 == localization.address1) {
      address1 = textEditingController2.text;
    } else if (selectedItem3 == localization.address1) {
      address1 = textEditingController3.text;
    } else if (selectedItem4 == localization.address1) {
      address1 = textEditingController4.text;
    } else if (selectedItem5 == localization.address1) {
      address1 = textEditingController5.text;
    } else if (selectedItem6 == localization.address1) {
      address1 = textEditingController6.text;
    } else if (selectedItem7 == localization.address1) {
      address1 = textEditingController7.text;
    } else if (selectedItem8 == localization.address1) {
      address1 = textEditingController8.text;
    } else if (selectedItem9 == localization.address1) {
      address1 = textEditingController9.text;
    } else if (selectedItem10 == localization.address1) {
      address1 = textEditingController10.text;
    } else if (selectedItem11 == localization.address1) {
      address1 = textEditingController11.text;
    } else if (selectedItem12 == localization.address1) {
      address1 = textEditingController12.text;
    } else if (selectedItem13 == localization.address1) {
      address1 = textEditingController13.text;
    } else if (selectedItem14 == localization.address1) {
      address1 = textEditingController14.text;
    } else if (selectedItem15 == localization.address1) {
      address1 = textEditingController15.text;
    } else if (selectedItem16 == localization.address1) {
      address1 = textEditingController16.text;
    } else if (selectedItem17 == localization.address1) {
      address1 = textEditingController17.text;
    } else if (selectedItem18 == localization.address1) {
      address1 = textEditingController18.text;
    } else if (selectedItem19 == localization.address1) {
      address1 = textEditingController19.text;
    } else if (selectedItem20 == localization.address1) {
      address1 = textEditingController20.text;
    }
    var address2 = "";

    if (selectedItem1 == localization.address2) {
      address2 = textEditingController1.text;
    } else if (selectedItem2 == localization.address2) {
      address2 = textEditingController2.text;
    } else if (selectedItem3 == localization.address2) {
      address2 = textEditingController3.text;
    } else if (selectedItem4 == localization.address2) {
      address2 = textEditingController4.text;
    } else if (selectedItem5 == localization.address2) {
      address2 = textEditingController5.text;
    } else if (selectedItem6 == localization.address2) {
      address2 = textEditingController6.text;
    } else if (selectedItem7 == localization.address2) {
      address2 = textEditingController7.text;
    } else if (selectedItem8 == localization.address2) {
      address2 = textEditingController8.text;
    } else if (selectedItem9 == localization.address2) {
      address2 = textEditingController9.text;
    } else if (selectedItem10 == localization.address2) {
      address2 = textEditingController10.text;
    } else if (selectedItem11 == localization.address2) {
      address2 = textEditingController11.text;
    } else if (selectedItem12 == localization.address2) {
      address2 = textEditingController12.text;
    } else if (selectedItem13 == localization.address2) {
      address2 = textEditingController13.text;
    } else if (selectedItem14 == localization.address2) {
      address2 = textEditingController14.text;
    } else if (selectedItem15 == localization.address2) {
      address2 = textEditingController15.text;
    } else if (selectedItem16 == localization.address2) {
      address2 = textEditingController16.text;
    } else if (selectedItem17 == localization.address2) {
      address2 = textEditingController17.text;
    } else if (selectedItem18 == localization.address2) {
      address2 = textEditingController18.text;
    } else if (selectedItem19 == localization.address2) {
      address2 = textEditingController19.text;
    } else if (selectedItem20 == localization.address2) {
      address2 = textEditingController20.text;
    }

    var address3 = "";

    if (selectedItem1 == localization.address3) {
      address3 = textEditingController1.text;
    } else if (selectedItem2 == localization.address3) {
      address3 = textEditingController2.text;
    } else if (selectedItem3 == localization.address3) {
      address3 = textEditingController3.text;
    } else if (selectedItem4 == localization.address3) {
      address3 = textEditingController4.text;
    } else if (selectedItem5 == localization.address3) {
      address3 = textEditingController5.text;
    } else if (selectedItem6 == localization.address3) {
      address3 = textEditingController6.text;
    } else if (selectedItem7 == localization.address3) {
      address3 = textEditingController7.text;
    } else if (selectedItem8 == localization.address3) {
      address3 = textEditingController8.text;
    } else if (selectedItem9 == localization.address3) {
      address3 = textEditingController9.text;
    } else if (selectedItem10 == localization.address3) {
      address3 = textEditingController10.text;
    } else if (selectedItem11 == localization.address3) {
      address3 = textEditingController11.text;
    } else if (selectedItem12 == localization.address3) {
      address3 = textEditingController12.text;
    } else if (selectedItem13 == localization.address3) {
      address3 = textEditingController13.text;
    } else if (selectedItem14 == localization.address3) {
      address3 = textEditingController14.text;
    } else if (selectedItem15 == localization.address3) {
      address3 = textEditingController15.text;
    } else if (selectedItem16 == localization.address3) {
      address3 = textEditingController16.text;
    } else if (selectedItem17 == localization.address3) {
      address3 = textEditingController17.text;
    } else if (selectedItem18 == localization.address3) {
      address3 = textEditingController18.text;
    } else if (selectedItem19 == localization.address3) {
      address3 = textEditingController19.text;
    } else if (selectedItem20 == localization.address3) {
      address3 = textEditingController20.text;
    }

    if (address1.isNotEmpty && address2.isNotEmpty && address3.isNotEmpty) {
      return "$address1  $address2 $address3";
    } else if (address1.isNotEmpty && address2.isNotEmpty) {
      return "$address1  $address2";
    } else if (address1.isNotEmpty && address2.isEmpty) {
      return address1;
    } else if (address1.isEmpty && address2.isNotEmpty) {
      return address2;
    } else {
      return "";
    }
  }

  String getMobilePhone() {
    if (selectedItem1 == localization.mobilePhone) {
      return textEditingController1.text;
    } else if (selectedItem2 == localization.mobilePhone) {
      return textEditingController2.text;
    } else if (selectedItem3 == localization.mobilePhone) {
      return textEditingController3.text;
    } else if (selectedItem4 == localization.mobilePhone) {
      return textEditingController4.text;
    } else if (selectedItem5 == localization.mobilePhone) {
      return textEditingController5.text;
    } else if (selectedItem6 == localization.mobilePhone) {
      return textEditingController6.text;
    } else if (selectedItem7 == localization.mobilePhone) {
      return textEditingController7.text;
    } else if (selectedItem8 == localization.mobilePhone) {
      return textEditingController8.text;
    } else if (selectedItem9 == localization.mobilePhone) {
      return textEditingController9.text;
    } else if (selectedItem10 == localization.mobilePhone) {
      return textEditingController10.text;
    } else if (selectedItem11 == localization.mobilePhone) {
      return textEditingController11.text;
    } else if (selectedItem12 == localization.mobilePhone) {
      return textEditingController12.text;
    } else if (selectedItem13 == localization.mobilePhone) {
      return textEditingController13.text;
    } else if (selectedItem14 == localization.mobilePhone) {
      return textEditingController14.text;
    } else if (selectedItem15 == localization.mobilePhone) {
      return textEditingController15.text;
    } else if (selectedItem16 == localization.mobilePhone) {
      return textEditingController16.text;
    } else if (selectedItem17 == localization.mobilePhone) {
      return textEditingController17.text;
    } else if (selectedItem18 == localization.mobilePhone) {
      return textEditingController18.text;
    } else if (selectedItem19 == localization.mobilePhone) {
      return textEditingController19.text;
    } else if (selectedItem20 == localization.mobilePhone) {
      return textEditingController20.text;
    }

    return "";
  }

  String getWorkPhone() {
    if (selectedItem1 == localization.workPhone) {
      return textEditingController1.text;
    } else if (selectedItem2 == localization.workPhone) {
      return textEditingController2.text;
    } else if (selectedItem3 == localization.workPhone) {
      return textEditingController3.text;
    } else if (selectedItem4 == localization.workPhone) {
      return textEditingController4.text;
    } else if (selectedItem5 == localization.workPhone) {
      return textEditingController5.text;
    } else if (selectedItem6 == localization.workPhone) {
      return textEditingController6.text;
    } else if (selectedItem7 == localization.workPhone) {
      return textEditingController7.text;
    } else if (selectedItem8 == localization.workPhone) {
      return textEditingController8.text;
    } else if (selectedItem9 == localization.workPhone) {
      return textEditingController9.text;
    } else if (selectedItem10 == localization.workPhone) {
      return textEditingController10.text;
    } else if (selectedItem11 == localization.workPhone) {
      return textEditingController11.text;
    } else if (selectedItem12 == localization.workPhone) {
      return textEditingController12.text;
    } else if (selectedItem13 == localization.workPhone) {
      return textEditingController13.text;
    } else if (selectedItem14 == localization.workPhone) {
      return textEditingController14.text;
    } else if (selectedItem15 == localization.workPhone) {
      return textEditingController15.text;
    } else if (selectedItem16 == localization.workPhone) {
      return textEditingController16.text;
    } else if (selectedItem17 == localization.workPhone) {
      return textEditingController17.text;
    } else if (selectedItem18 == localization.workPhone) {
      return textEditingController18.text;
    } else if (selectedItem19 == localization.workPhone) {
      return textEditingController19.text;
    } else if (selectedItem20 == localization.workPhone) {
      return textEditingController20.text;
    }

    return "";
  }

  String getWorkPhoneExtension() {
    if (selectedItem1 == localization.workPhoneExtension) {
      return textEditingController1.text;
    } else if (selectedItem2 == localization.workPhoneExtension) {
      return textEditingController2.text;
    } else if (selectedItem3 == localization.workPhoneExtension) {
      return textEditingController3.text;
    } else if (selectedItem4 == localization.workPhoneExtension) {
      return textEditingController4.text;
    } else if (selectedItem5 == localization.workPhoneExtension) {
      return textEditingController5.text;
    } else if (selectedItem6 == localization.workPhoneExtension) {
      return textEditingController6.text;
    } else if (selectedItem7 == localization.workPhoneExtension) {
      return textEditingController7.text;
    } else if (selectedItem8 == localization.workPhoneExtension) {
      return textEditingController8.text;
    } else if (selectedItem9 == localization.workPhoneExtension) {
      return textEditingController9.text;
    } else if (selectedItem10 == localization.workPhoneExtension) {
      return textEditingController10.text;
    } else if (selectedItem11 == localization.workPhoneExtension) {
      return textEditingController11.text;
    } else if (selectedItem12 == localization.workPhoneExtension) {
      return textEditingController12.text;
    } else if (selectedItem13 == localization.workPhoneExtension) {
      return textEditingController13.text;
    } else if (selectedItem14 == localization.workPhoneExtension) {
      return textEditingController14.text;
    } else if (selectedItem15 == localization.workPhoneExtension) {
      return textEditingController15.text;
    } else if (selectedItem16 == localization.workPhoneExtension) {
      return textEditingController16.text;
    } else if (selectedItem17 == localization.workPhoneExtension) {
      return textEditingController17.text;
    } else if (selectedItem18 == localization.workPhoneExtension) {
      return textEditingController18.text;
    } else if (selectedItem19 == localization.workPhoneExtension) {
      return textEditingController19.text;
    } else if (selectedItem20 == localization.workPhoneExtension) {
      return textEditingController20.text;
    }

    return "";
  }

  String getFaxPhone() {
    if (selectedItem1 == localization.fax) {
      return textEditingController1.text;
    } else if (selectedItem2 == localization.fax) {
      return textEditingController2.text;
    } else if (selectedItem3 == localization.fax) {
      return textEditingController3.text;
    } else if (selectedItem4 == localization.fax) {
      return textEditingController4.text;
    } else if (selectedItem5 == localization.fax) {
      return textEditingController5.text;
    } else if (selectedItem6 == localization.fax) {
      return textEditingController6.text;
    } else if (selectedItem7 == localization.fax) {
      return textEditingController7.text;
    } else if (selectedItem8 == localization.fax) {
      return textEditingController8.text;
    } else if (selectedItem9 == localization.fax) {
      return textEditingController9.text;
    } else if (selectedItem10 == localization.fax) {
      return textEditingController10.text;
    } else if (selectedItem11 == localization.fax) {
      return textEditingController11.text;
    } else if (selectedItem12 == localization.fax) {
      return textEditingController12.text;
    } else if (selectedItem13 == localization.fax) {
      return textEditingController13.text;
    } else if (selectedItem14 == localization.fax) {
      return textEditingController14.text;
    } else if (selectedItem15 == localization.fax) {
      return textEditingController15.text;
    } else if (selectedItem16 == localization.fax) {
      return textEditingController16.text;
    } else if (selectedItem17 == localization.fax) {
      return textEditingController17.text;
    } else if (selectedItem18 == localization.fax) {
      return textEditingController18.text;
    } else if (selectedItem19 == localization.fax) {
      return textEditingController19.text;
    } else if (selectedItem20 == localization.fax) {
      return textEditingController20.text;
    }

    return "";
  }

  String getEMail() {
    if (selectedItem1 == localization.eMail) {
      return textEditingController1.text;
    } else if (selectedItem2 == localization.eMail) {
      return textEditingController2.text;
    } else if (selectedItem3 == localization.eMail) {
      return textEditingController3.text;
    } else if (selectedItem4 == localization.eMail) {
      return textEditingController4.text;
    } else if (selectedItem5 == localization.eMail) {
      return textEditingController5.text;
    } else if (selectedItem6 == localization.eMail) {
      return textEditingController6.text;
    } else if (selectedItem7 == localization.eMail) {
      return textEditingController7.text;
    } else if (selectedItem8 == localization.eMail) {
      return textEditingController8.text;
    } else if (selectedItem9 == localization.eMail) {
      return textEditingController9.text;
    } else if (selectedItem10 == localization.eMail) {
      return textEditingController10.text;
    } else if (selectedItem11 == localization.eMail) {
      return textEditingController11.text;
    } else if (selectedItem12 == localization.eMail) {
      return textEditingController12.text;
    } else if (selectedItem13 == localization.eMail) {
      return textEditingController13.text;
    } else if (selectedItem14 == localization.eMail) {
      return textEditingController14.text;
    } else if (selectedItem15 == localization.eMail) {
      return textEditingController15.text;
    } else if (selectedItem16 == localization.eMail) {
      return textEditingController16.text;
    } else if (selectedItem17 == localization.eMail) {
      return textEditingController17.text;
    } else if (selectedItem18 == localization.eMail) {
      return textEditingController18.text;
    } else if (selectedItem19 == localization.eMail) {
      return textEditingController19.text;
    } else if (selectedItem20 == localization.eMail) {
      return textEditingController20.text;
    }

    return "";
  }

  String getWeb() {
    if (selectedItem1 == localization.web) {
      return textEditingController1.text;
    } else if (selectedItem2 == localization.web) {
      return textEditingController2.text;
    } else if (selectedItem3 == localization.web) {
      return textEditingController3.text;
    } else if (selectedItem4 == localization.web) {
      return textEditingController4.text;
    } else if (selectedItem5 == localization.web) {
      return textEditingController5.text;
    } else if (selectedItem6 == localization.web) {
      return textEditingController6.text;
    } else if (selectedItem7 == localization.web) {
      return textEditingController7.text;
    } else if (selectedItem8 == localization.web) {
      return textEditingController8.text;
    } else if (selectedItem9 == localization.web) {
      return textEditingController9.text;
    } else if (selectedItem10 == localization.web) {
      return textEditingController10.text;
    } else if (selectedItem11 == localization.web) {
      return textEditingController11.text;
    } else if (selectedItem12 == localization.web) {
      return textEditingController12.text;
    } else if (selectedItem13 == localization.web) {
      return textEditingController13.text;
    } else if (selectedItem14 == localization.web) {
      return textEditingController14.text;
    } else if (selectedItem15 == localization.web) {
      return textEditingController15.text;
    } else if (selectedItem16 == localization.web) {
      return textEditingController16.text;
    } else if (selectedItem17 == localization.web) {
      return textEditingController17.text;
    } else if (selectedItem18 == localization.web) {
      return textEditingController18.text;
    } else if (selectedItem19 == localization.web) {
      return textEditingController19.text;
    } else if (selectedItem20 == localization.web) {
      return textEditingController20.text;
    }

    return "";
  }

  String getPersonTitle() {
    if (selectedItem1 == localization.position) {
      return textEditingController1.text;
    } else if (selectedItem2 == localization.position) {
      return textEditingController2.text;
    } else if (selectedItem3 == localization.position) {
      return textEditingController3.text;
    } else if (selectedItem4 == localization.position) {
      return textEditingController4.text;
    } else if (selectedItem5 == localization.position) {
      return textEditingController5.text;
    } else if (selectedItem6 == localization.position) {
      return textEditingController6.text;
    } else if (selectedItem7 == localization.position) {
      return textEditingController7.text;
    } else if (selectedItem8 == localization.position) {
      return textEditingController8.text;
    } else if (selectedItem9 == localization.position) {
      return textEditingController9.text;
    } else if (selectedItem10 == localization.position) {
      return textEditingController10.text;
    } else if (selectedItem11 == localization.position) {
      return textEditingController11.text;
    } else if (selectedItem12 == localization.position) {
      return textEditingController12.text;
    } else if (selectedItem13 == localization.position) {
      return textEditingController13.text;
    } else if (selectedItem14 == localization.position) {
      return textEditingController14.text;
    } else if (selectedItem15 == localization.position) {
      return textEditingController15.text;
    } else if (selectedItem16 == localization.position) {
      return textEditingController16.text;
    } else if (selectedItem17 == localization.position) {
      return textEditingController17.text;
    } else if (selectedItem18 == localization.position) {
      return textEditingController18.text;
    } else if (selectedItem19 == localization.position) {
      return textEditingController19.text;
    } else if (selectedItem20 == localization.position) {
      return textEditingController20.text;
    }

    return "";
  }

  String getPersonName() {
    if (selectedItem1 == localization.name) {
      return textEditingController1.text;
    } else if (selectedItem2 == localization.name) {
      return textEditingController2.text;
    } else if (selectedItem3 == localization.name) {
      return textEditingController3.text;
    } else if (selectedItem4 == localization.name) {
      return textEditingController4.text;
    } else if (selectedItem5 == localization.name) {
      return textEditingController5.text;
    } else if (selectedItem6 == localization.name) {
      return textEditingController6.text;
    } else if (selectedItem7 == localization.name) {
      return textEditingController7.text;
    } else if (selectedItem8 == localization.name) {
      return textEditingController8.text;
    } else if (selectedItem9 == localization.name) {
      return textEditingController9.text;
    } else if (selectedItem10 == localization.name) {
      return textEditingController10.text;
    } else if (selectedItem11 == localization.name) {
      return textEditingController11.text;
    } else if (selectedItem12 == localization.name) {
      return textEditingController12.text;
    } else if (selectedItem13 == localization.name) {
      return textEditingController13.text;
    } else if (selectedItem14 == localization.name) {
      return textEditingController14.text;
    } else if (selectedItem15 == localization.name) {
      return textEditingController15.text;
    } else if (selectedItem16 == localization.name) {
      return textEditingController16.text;
    } else if (selectedItem17 == localization.name) {
      return textEditingController17.text;
    } else if (selectedItem18 == localization.name) {
      return textEditingController18.text;
    } else if (selectedItem19 == localization.name) {
      return textEditingController19.text;
    } else if (selectedItem20 == localization.name) {
      return textEditingController20.text;
    }

    return "";
  }
}
