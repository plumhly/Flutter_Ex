import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FormTestWidget extends StatefulWidget {
  FormTestWidget({Key key}) : super(key: key);

  _FormTestWidgetState createState() => _FormTestWidgetState();
}

class _FormTestWidgetState extends State<FormTestWidget> {

  TextEditingController contr1 = TextEditingController();
  TextEditingController contr2 = TextEditingController();
  GlobalKey _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test form")
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Form(
          key: _key,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "昵称",
                  icon: Icon(Icons.person)
                ),
                validator: (v) {
                  return v.trim().length > 0 ? null : "用户名不能为空";
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 28
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      // child: RaisedButton(
                      //   padding: EdgeInsets.all(15),
                      //   color: Theme.of(context).primaryColor,
                      //   textColor: Colors.white,
                      //   child: Text("登录"),
                      //   onPressed: () {
                      //     if ((_key.currentState as FormState).validate()) {
                            
                      //     }
                      //   },
                      // ),
                      child: Builder(
                        builder: (context) {
                          return RaisedButton(
                            padding: EdgeInsets.all(15),
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            child: Text("登录"),
                            onPressed: () {
                              if (Form.of(context).validate()) {
                                
                              } else {
                                print("error");
                              }
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}