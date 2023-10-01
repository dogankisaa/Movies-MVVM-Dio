
import 'package:flutter/material.dart';


import 'package:movie_app/view_model/main_view_model.dart';
import 'package:movie_app/widget/base_widgets/custom_scaffold.dart';
import 'package:movie_app/widget/main_view_widgets/slider_widget.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    MainViewModel viewModel;

    return ChangeNotifierProvider.value(
        value: viewModel = MainViewModel(),
        builder: (context, child) => CustomScaffoldWidget(
              widget: Column(
                children: [
                 
                  SizedBox(
                    height: 140,
                  ),
                  FutureBuilder(
                    future: viewModel.movieData,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SliderWidget(
                          data: snapshot,
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  )
                ],
              ),
            ));
  }
}
