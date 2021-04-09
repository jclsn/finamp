import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../../models/FinampModels.dart';

class LogTile extends StatelessWidget {
  const LogTile({Key key, @required this.logRecord}) : super(key: key);

  final FinampLogRecord logRecord;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _logColor(logRecord.level, context),
      child: ExpansionTile(
        leading: _logIcon(logRecord.level),
        title: RichText(
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "[${logRecord.loggerName}] ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "[${logRecord.time}] ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: logRecord.message,
              ),
            ],
          ),
        ),
        childrenPadding: const EdgeInsets.all(8.0),
        children: [Text(logRecord.message)],
      ),
    );
  }

  Icon _logIcon(FinampLevel level) {
    if (level == FinampLevel.INFO) {
      return Icon(Icons.info);
    } else if (level == FinampLevel.WARNING) {
      return Icon(Icons.warning);
    } else if (level == FinampLevel.SEVERE) {
      return Icon(Icons.error);
    } else {
      return Icon(Icons.info);
    }
  }

  Color _logColor(FinampLevel level, BuildContext context) {
    if (level == FinampLevel.INFO) {
      return Colors.blue;
    } else if (level == FinampLevel.WARNING) {
      return Colors.orange;
    } else if (level == FinampLevel.SEVERE) {
      return Colors.red;
    } else {
      return Theme.of(context).cardColor;
    }
  }
}