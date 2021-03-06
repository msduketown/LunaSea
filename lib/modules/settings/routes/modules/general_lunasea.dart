import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lunasea/core.dart';
import 'package:lunasea/modules/settings.dart';

class SettingsModulesLunaSea extends StatefulWidget {
    static const ROUTE_NAME = '/settings/modules/lunasea';
    
    @override
    State<SettingsModulesLunaSea> createState() => _State();
}

class _State extends State<SettingsModulesLunaSea> {
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    @override
    Widget build(BuildContext context) => Scaffold(
        key: _scaffoldKey,
        body: _body,
        appBar: _appBar,
    );

    Widget get _appBar => LSAppBar(title: 'LunaSea');

    Widget get _body => LSListView(
        children: <Widget>[
            ..._appearance,
            if(Platform.isIOS) ..._other,
        ],
        padBottom: true,
    );

    List<Widget> get _appearance => [
        LSHeader(text: 'Appearance'),
        SettingsModulesLunaSeaAMOLEDTile(),
    ];

    List<Widget> get _other => [
        LSHeader(text: 'Other'),
        SettingsModulesLunaSeaBrowserTile(),
    ];
}
