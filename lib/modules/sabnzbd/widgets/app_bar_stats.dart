import 'package:flutter/material.dart';
import 'package:lunasea/core.dart';
import 'package:tuple/tuple.dart';
import '../../sabnzbd.dart';

class SABnzbdAppBarStats extends StatelessWidget {
    @override
    Widget build(BuildContext context) => Selector<SABnzbdModel, Tuple5<bool, String, String, String, int>>(
        selector: (_, model) => Tuple5(
            model.paused,           //item1
            model.currentSpeed,     //item2
            model.queueTimeLeft,    //item3
            model.queueSizeLeft,    //item4
            model.speedLimit,       //item5
        ),
        builder: (context, data, widget) => GestureDetector(
            onTap: () async => _onTap(context, data.item5),
            child: Center(
                child:  RichText(
                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.white54,
                            letterSpacing: Constants.UI_LETTER_SPACING,
                        ),
                        children: [
                            TextSpan(
                                text: _status(data.item1, data.item2),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: LSColors.accent,
                                ),
                            ),
                            TextSpan(text: '\n'),
                            TextSpan(text: data.item3 == '0:00:00' ? '―' : data.item3),
                            TextSpan(text: '\t\t•\t\t'),
                            TextSpan(text: data.item4 == '0.0 B' ? '―' : data.item4)
                        ],
                    ),
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                    softWrap: false,
                    textAlign: TextAlign.right,
                ),
            ),
        ),
    );

    String _status(bool paused, String speed) => paused
        ? 'Paused'
        : speed == '0.0 B/s'
            ? 'Idle'
            : speed;

    Future<void> _onTap(BuildContext context, int speed) async {
        List values = await LSDialogSABnzbd.showSpeedPrompt(context, speed);
        if(values[0]) switch(values[1]) {
            case -1: {
                values = await LSDialogSABnzbd.showCustomSpeedPrompt(context);
                if(values[0]) SABnzbdAPI.from(Database.currentProfileObject).setSpeedLimit(values[1])
                .then((_) => LSSnackBar(
                    context: context,
                    title: 'Speed Limit Set',
                    message: 'Set to ${values[1]}%',
                    type: SNACKBAR_TYPE.success,
                ))
                .catchError((_) => LSSnackBar(
                    context: context,
                    title: 'Failed to Set Speed Limit',
                    message: Constants.CHECK_LOGS_MESSAGE,
                    type: SNACKBAR_TYPE.failure,
                ));
                break;
            }
            default: SABnzbdAPI.from(Database.currentProfileObject).setSpeedLimit(values[1])
            .then((_) => LSSnackBar(
                context: context,
                title: 'Speed Limit Set',
                message: 'Set to ${values[1]}%',
                type: SNACKBAR_TYPE.success,
            ))
            .catchError((_) => LSSnackBar(
                context: context,
                title: 'Failed to Set Speed Limit',
                message: Constants.CHECK_LOGS_MESSAGE,
                type: SNACKBAR_TYPE.failure,
            ));
        }
    }
}