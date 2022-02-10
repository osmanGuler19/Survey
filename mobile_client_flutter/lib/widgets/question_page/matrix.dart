import 'package:flutter/material.dart';
import 'package:client_flutter/model/myModel.dart';
import 'package:hovering/hovering.dart';

class MatrixWidget extends StatelessWidget {
  final List<Component> components;
  final List<Scope> scopes;
  const MatrixWidget({Key? key, required this.components, required this.scopes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: layoutTheButtons(context, components, scopes),
        width: 220,
        height: 210);
  }
}

Widget layoutTheButtons(
    BuildContext context, List<Component> components, List<Scope> scopes) {
  List<Widget> mywidget = <Widget>[];
  for (int i = 0; i < components.length; i++) {
    var temp = <Widget>[];

    for (int j = 0; j < scopes.length; j++) {
      temp.add(MatrixItem(
          tooltip: "${components[i].label} && ${scopes[j].label}",
          color: Colors.grey));
    }
    mywidget.add(Row(
      children: temp,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    ));
  }
  return Stack(
    children: [
      SafeArea(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      style: BorderStyle.solid,
                      color: Colors.grey,
                      width: 2.0)),
              child: ListView(
                padding: EdgeInsets.only(top: 15),
                children: mywidget,
              ),
            )
          ],
        ),
      )),
      Positioned(
          top: 0.0,
          right: 20.0,
          child: Container(
            child: new Text(
              "Scopes",
              style: TextStyle(fontSize: 20),
            ),
            color: Colors.white,
          )),
      Positioned(
          bottom: 20.0,
          left: 0.0,
          child: Container(
            child: RotatedBox(
              quarterTurns: 3,
              child: Text(
                'Components',
                style: TextStyle(fontSize: 20),
              ),
            ),
            color: Colors.white,
          )),
    ],
  );
}

class MatrixItem extends StatelessWidget {
  const MatrixItem({Key? key, required this.tooltip, required this.color})
      : super(key: key);

  final String tooltip;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          print('Tooltip ekrana gösterildi');
        },
        hoverColor: Colors.orange,
        child: Tooltip(
          message: tooltip,
          child: Container(
            width: 20,
            height: 20,
            color: color,
          ),
        ),
      ),
    );
  }
}


//List<Widget> 