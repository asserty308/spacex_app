import 'package:flutter/material.dart';

class ImageTitleCard extends StatelessWidget {
  const ImageTitleCard({
    Key key,
    @required this.mainWidget,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);

  final Widget mainWidget;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: <Widget>[
            Container(height: 250, child: mainWidget),
            Container(
              height: 75,
              color: Colors.teal,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 24,
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ),
          ]
        ),
      )
    );
  }
}