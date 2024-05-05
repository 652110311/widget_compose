import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Loading extends StatelessWidget {
  
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Center(
                    child: SizedBox
                    (
                    width: 50,
                    height: 50, 
                    child: LoadingIndicator(
                      indicatorType: Indicator.lineSpinFadeLoader,
                      colors: [       Colors.red,
                                      Colors.orange,
                                      Colors.yellow,
                                      Colors.green,
                                      Colors.blue,
                                      Colors.indigo,
                                      Colors.purple,]),),) ;
  }
}