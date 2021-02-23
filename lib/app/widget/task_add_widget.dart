import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskAddWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _TaskAddWidgetState("");
  }
}

class _TaskAddWidgetState extends State<TaskAddWidget> {
  final String _title;

  _TaskAddWidgetState(this._title);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(),
        TextButton(child: Text("追加"), onPressed: () => {

        },)
      ],
    );
  }
}
