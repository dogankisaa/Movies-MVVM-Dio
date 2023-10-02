import 'package:flutter/material.dart';

class CustomScaffoldWidget extends StatelessWidget {
  final widget;
  final action;
  final leading;
  const CustomScaffoldWidget({
    super.key,
    this.widget,
    this.action,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: AppBar(
                
                leadingWidth: 30,
                leading: leading,
                actions: [action],
                
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
            ),
            body: widget,
          ),
        ),
      ),
    );
  }
}
