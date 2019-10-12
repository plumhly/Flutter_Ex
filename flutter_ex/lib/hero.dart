import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroAnimationRoute extends StatelessWidget {
  const HeroAnimationRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          child: Hero(
            tag: "avatar",
            child: ClipOval(
              child: Image.asset("images/image.png", width: 50,),
            ),
          ),
          onTap: () {
            Navigator.push(context, PageRouteBuilder(
              pageBuilder: (context, animation, secondAnimation) {
                return FadeTransition(
                  opacity: animation,
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text("原图"),
                    ),
                    body: HeroAnimationRouteB(),
                  ),
                );
              }
            ));
          },
        ),
      )
    );
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  const HeroAnimationRouteB({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "avatar",
        child: Image.asset("images/image.png"),
      ),
    );
  }
}