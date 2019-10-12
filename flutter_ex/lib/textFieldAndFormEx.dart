import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldAndFormEx extends StatefulWidget {
  TextFieldAndFormEx({Key key}) : super(key: key);

  _TextFieldAndFormExState createState() => _TextFieldAndFormExState();
}

class _TextFieldAndFormExState extends State<TextFieldAndFormEx> {

TextEditingController controller;
FocusNode node1 = FocusNode();
FocusNode node2 = FocusNode();
FocusScopeNode scopNode;
@override
void initState() { 
  super.initState();
  controller = TextEditingController();
  controller.text = "会话";
  controller.addListener(() {
    print(controller.text);
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // data: Theme.of(context).copyWith(
        //   hintColor: Colors.grey[200],
        //   inputDecorationTheme: InputDecorationTheme(
        //     labelStyle: TextStyle(
        //       color: Colors.grey
        //     ),
        //     hintStyle: TextStyle(
        //       color: Colors.grey,
        //       fontSize: 14
        //     )
        //   )
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: TextField(
                controller: controller,
                focusNode: node1,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "账号或者邮箱",
                  prefixIcon: Icon(Icons.person),
                  hintStyle: TextStyle(
                    fontSize: 13,
                    color: Colors.grey
                  ),
                  border: InputBorder.none
                ),
                //  onChanged: (value) {
                //    print("$value");
                //  },
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1
                  )
                )
              ),
            ),
            TextField(
              controller: controller,
              focusNode: node2,
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "请登录您的密码",
                prefixIcon: Icon(Icons.lock)
              ),
              obscureText: true,
              onChanged: (text) {
                print("$text");
              },
            ),
            Builder(
              builder: (context) {
                return Column(
                  children: <Widget>[
                    FlatButton(
                      child: Text("移动焦点"),
                      onPressed: () {
                        if (scopNode == null) {
                          scopNode = FocusScope.of(context);
                        }
                        scopNode.requestFocus(node2);
                      },
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}