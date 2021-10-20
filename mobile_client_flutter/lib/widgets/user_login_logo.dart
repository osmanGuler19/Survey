import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class UserLoginLogo extends StatelessWidget {
  const UserLoginLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
                tag: 'hero',
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  padding: EdgeInsets.only(top: 25),
                  child: SvgPicture.network(
                      'https://upload.wikimedia.org/wikipedia/commons/6/6a/Maastricht_University_logo.svg'),
                ),
              );
  }
}