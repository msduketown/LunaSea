import 'package:flutter/material.dart';
import 'package:lunasea/core.dart';
import '../../lidarr.dart';

class LidarrNavigationBar extends StatefulWidget {
    final PageController pageController;

    LidarrNavigationBar({
        Key key,
        @required this.pageController,
    }): super(key: key);

    @override
    State<StatefulWidget> createState() => _State();
}

class _State extends State<LidarrNavigationBar> {
    static const List<IconData> _navbarIcons = [
        CustomIcons.music,
        CustomIcons.calendar_missing,
        CustomIcons.history,
    ];

    static const List<String> _navbarTitles = [
        'Catalogue',
        'Missing',
        'History',
    ];

    @override
    Widget build(BuildContext context) => Selector<LidarrModel, int>(
        selector: (_, model) => model.navigationIndex,
        builder: (context, index, _) => LSBottomNavigationBar(
            index: index,
            icons: _navbarIcons,
            titles: _navbarTitles,
            onTap: _navOnTap,
        ),
    );

    Future<void> _navOnTap(int index) async {
        await widget.pageController.animateToPage(
            index,
            duration: Duration(milliseconds: Constants.UI_NAVIGATION_SPEED),
            curve: Curves.easeOutSine,
        );
        Provider.of<LidarrModel>(context, listen: false).navigationIndex = index;
    }
}