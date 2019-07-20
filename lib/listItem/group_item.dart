import 'package:flutter/material.dart';
import 'package:juju_flutter/bean/group.dart';

class GroupItem extends StatefulWidget {

  Group _group;

  GroupItem(Group group) {
    this._group = group;
  }

  @override
  State<StatefulWidget> createState() {
    return GroupItemState();
  }
}

class GroupItemState extends State<GroupItem> {
  @override
  Widget build(BuildContext context) {

    Row title = Row(
      children: <Widget>[
        Expanded(
          child: Text(
              widget._group.name
          ),
        )
      ],
    );

    Row time = Row(
      children: <Widget>[
        Expanded(
          child: Text(
              widget._group.createTime
          ),
        )
      ],
    );

    Row place = Row(
      children: <Widget>[
        Expanded(
          child: Text(
              widget._group.introduction
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