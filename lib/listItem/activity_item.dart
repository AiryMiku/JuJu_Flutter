import 'package:flutter/material.dart';
import 'package:juju_flutter/bean/activity.dart';

class ActivityItem extends StatefulWidget {

  Activity _activity;

  ActivityItem(Activity activity) {
    this._activity = activity;
  }

  @override
  State<StatefulWidget> createState() {
    return ActivityItemState();
  }
}

class ActivityItemState extends State<ActivityItem> {
  @override
  Widget build(BuildContext context) {

    Row title = Row(
      children: <Widget>[
        Expanded(
          child: Text(
            widget._activity.title
          ),
        )
      ],
    );

    Row time = Row(
      children: <Widget>[
        Expanded(
          child: Text(
              widget._activity.startTime +" - "+ widget._activity.endTime
          ),
        )
      ],
    );

    Row place = Row(
      children: <Widget>[
        Expanded(
          child: Text(
              widget._activity.place
          ),
        )
      ],
    );

    Column column = Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: title,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: time,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: place,
        ),
      ],
    );

    return Card(
      elevation: 4.0,
      child: InkWell(
        child: column,
        onTap: (){
          _itemClick();
        },
      ),
    );
  }

  void _itemClick() {

  }
}