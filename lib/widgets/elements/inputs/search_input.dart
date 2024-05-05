import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 48,
      child: TextField(
        style: TextStyle(color: Colors.white70),
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            suffixIcon: Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Icon(Icons.search),
            )),
      ),
    );
  }
}
