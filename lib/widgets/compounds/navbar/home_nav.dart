import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:widget_compose/widgets/elements/inputs/search_input.dart';

class HomeNavbar extends StatelessWidget {
  const HomeNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: SearchInput()),
            IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.info_outline_rounded,
                  color: Colors.white70,
                  size: 40,
                )),
          ],
        ),
      ),
    );
  }
}
