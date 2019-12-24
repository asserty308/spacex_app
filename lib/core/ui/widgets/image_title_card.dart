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
      color: Colors.transparent,
      elevation: 1.0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: <Widget>[
            Container(height: 250, child: mainWidget),
            Container(
              height: 250,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ),
              ),
            ),
          ]
        ),
      )
    );
  }
}