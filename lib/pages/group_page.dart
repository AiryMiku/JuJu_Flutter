import 'package:flutter/material.dart';
import 'package:juju_flutter/bean/group.dart';
import 'package:juju_flutter/http/http_util.dart';
import 'package:juju_flutter/http/api.dart';
import 'package:juju_flutter/listItem/group_item.dart';

class GroupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GroupPageState();

}


class GroupPageState extends State<GroupPage> {
  List dataList = List();
  var curPage = 1;
  var pageCount;
  var listSize = 20;

  ScrollController _controller = ScrollController();

  // init component
  GroupPageState() {
    _controller.addListener((){
      var maxScroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;

      if(maxScroll == pixels) {
        ++curPage;
        getGroups();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getGroups();
  }

  @override
  Widget build(BuildContext context) {
    if(dataList == null || dataList.isEmpty) {
      return RefreshIndicator(
        child: Center(
          child: Text("么得数据，赶紧下拉刷新一下",
            style: TextStyle(color: Colors.black),),
        ),
        onRefresh: _onPullRefresh,);

    } else {
      Widget listView = ListView.builder(
        itemBuilder: (context, i) => makeItem(i),
        itemCount: dataList.length + 1,
        controller: _controller,
      );
      return RefreshIndicator(child: listView, onRefresh: _onPullRefresh,);
    }
  }

  Future<Null> _onPullRefresh() async {
    curPage = 1;
    dataList.clear();
    getGroups();
    return null;
  }


  void getGroups() {
    Map params = new Map<String, String>();
    params['page'] = curPage.toString();
    params['size'] = listSize.toString();
    HttpUtil.get(Api.ALL_GROUP, (data){
      if(data != null) {
        dataList.addAll(data['list']);  // jsonString
        pageCount = data['count'];
      }
    },
        params: params,
        headers: null,
        errorCallback: (errorMsg) {

        });
  }

  // ignore: missing_return
  Widget makeItem(int i) {
    if(i != dataList.length - 1) {
      var item = dataList[i];
      return GroupItem(Group.fromJson(item));
    }
  }



}