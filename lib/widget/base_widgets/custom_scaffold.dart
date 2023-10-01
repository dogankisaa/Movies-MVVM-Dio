import 'package:flutter/material.dart';

class CustomScaffoldWidget extends StatelessWidget {
  final widget;
  const CustomScaffoldWidget({
    super.key, this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-1.0, -1),
                end: Alignment(-1.0, 1),
                colors: <Color>[
                  Color.fromRGBO(201, 4, 4, 1),
               
                  Color.fromRGBO(67, 7, 7, 1),
                  Color.fromRGBO(0, 0, 0, 1),
                ],
              ),
            ),
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: widget,),
          ),
        );
  }
}
