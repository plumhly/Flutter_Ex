import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix1;


class DialogWiget extends StatefulWidget {
  DialogWiget({Key key}) : super(key: key);

  _DialogWigetState createState() => _DialogWigetState();
}

class _DialogWigetState extends State<DialogWiget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
       child: Center(
         child: Padding(
           padding: EdgeInsets.only(top: 100),
           child: Column(
             children: <Widget>[
               FlatButton(
                 child: Text("点击1"),
                 onPressed: showDialog,
               ),
               FlatButton(
                 child: Text("点击"),
                 onPressed: changeLanguage,
               ),
               FlatButton(
                 child: Text("点击2"),
                 onPressed: showListDialog,
               )
             ],
           ),
         )
       ),
    );
  }

  void showDialog() async{
    bool delete = await showDeleteConfirmDialog1();
    if (delete == null) {
      print("取消删除");
    } else {
      print("确认删除");
    }
  }

  Future<bool> showDeleteConfirmDialog1() {
    return prefix1.showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前的文件吗"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () => Navigator.of(context).pop(true),
            )
          ],
        );
      }
    );
  }

  Future<void> changeLanguage() async {
    int i = await prefix1.showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text("请选择语言"),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 1);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: const Text("简体中文"),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 2);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Text("english"),
              ),
            )
          ],
        );
      }
    );
    if (i != null) {
      print("选择了：${ i == 1 ? "简体中文" : "英语"}");
    }
  }

  Future<void> showListDialog() async {
    await prefix1.showDialog(
      context: context,
      builder: (context) {
        var child = Column(
          children: <Widget>[
            ListTile(
              title: Text("请选择"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("$index"),
                    onTap: () => Navigator.of(context).pop(index),
                  );
                },
              ),
            )
          ],
        );
        return Dialog(child: child,);
      }
    );
  }
}
