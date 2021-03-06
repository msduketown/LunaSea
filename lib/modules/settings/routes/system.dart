import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:lunasea/core.dart';
import '../../settings.dart';

class SettingsSystem extends StatefulWidget {
    static const ROUTE_NAME = '/settings/system';
    
    @override
    State<SettingsSystem> createState() => _State();
}

class _State extends State<SettingsSystem> with AutomaticKeepAliveClientMixin {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    String _version = '1.0.0';
    String _buildNumber = '1';

    @override
    bool get wantKeepAlive => true;

    @override
    Widget build(BuildContext context) {
        super.build(context);
        return Scaffold(
            key: _scaffoldKey,
            body: _body,
        );
    }

    @override
    void initState() {
        super.initState();
        _fetchVersion();
    }

    void _fetchVersion() async {
        PackageInfo info = await PackageInfo.fromPlatform();
        if(mounted) setState(() {
            _version = info.version;
            _buildNumber = info.buildNumber;
        });
    }

    Widget get _body => LSListView(
        children: <Widget>[
            ..._resources,
            ..._system,
        ],
    );

    List<Widget> get _system => [
        LSHeader(text: 'System'),
        SettingsSystemClearConfigurationTile(),
        LSCardTile(
            title: LSTitle(text: 'Version: $_version ($_buildNumber)'),
            subtitle: LSSubtitle(text: 'View Recent Changes'),
            trailing: LSIconButton(icon: Icons.system_update),
            onTap: () async {
                List changes = await SettingsAPI.getChangelog();
                await LSDialogSettings.showChangelog(context, changes);
            },
        ),
    ];

    List<Widget> get _resources => [
        LSHeader(text: 'Resources'),
        LSCardTile(
            title: LSTitle(text: 'Documentation'),
            subtitle: LSSubtitle(text: 'Discover Features in LunaSea'),
            trailing: LSIconButton(icon: CustomIcons.documentation),
            onTap: () async => await Constants.URL_DOCUMENTATION.lsLinks_OpenLink(),
        ),
        LSCardTile(
            title: LSTitle(text: 'GitHub'),
            subtitle: LSSubtitle(text: 'View the Source Code'),
            trailing: LSIconButton(icon: CustomIcons.github),
            onTap: () async => await Constants.URL_GITHUB.lsLinks_OpenLink(),
        ),
        LSCardTile(
            title: LSTitle(text: 'Reddit'),
            subtitle: LSSubtitle(text: 'Get Support and Request Features'),
            trailing: LSIconButton(icon: CustomIcons.reddit),
            onTap: () async => await Constants.URL_REDDIT.lsLinks_OpenLink(),
        ),
        LSCardTile(
            title: LSTitle(text: 'Website'),
            subtitle: LSSubtitle(text: 'Visit LunaSea\'s Website'),
            trailing: LSIconButton(icon: CustomIcons.home),
            onTap: () async => await Constants.URL_WEBSITE.lsLinks_OpenLink(),
        ),
    ];
}
