import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/view_model/detail_view_model.dart';
import 'package:movie_app/widget/base_widgets/custom_scaffold.dart';
import 'package:provider/provider.dart';

class DetailView extends StatelessWidget {
  final data;
  final index;
  const DetailView({super.key, this.data, this.index});

  @override
  Widget build(BuildContext context) {
    DetailViewModel viewModel;

    return ChangeNotifierProvider.value(
      value: viewModel = DetailViewModel(),
      builder: (context, child) {
        return CustomScaffoldWidget(
          leading: IconButton(
            onPressed: () {},
            iconSize: 30,
            color: Colors.white,
            icon: Icon(Icons.keyboard_arrow_left),
          ),
          isHorizontalPadding: false,
          isViewBehindAppBar: true,
          widget: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              viewModel.baseConstants.sliderImagePath +
                                  data.data!.results![index].posterPath))),
                  height: 400,
                  width: double.infinity,
                  child: Text("")),
              Text(
                data.data!.results![index].title,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: const Color.fromRGBO(255, 0, 0, 0.9)),
              ),
              Text(
                viewModel.dateFormat(data.data!.results![index].releaseDate),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: const Color.fromRGBO(219, 219, 219, 1)),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBarIndicator(
                    direction: Axis.horizontal,
                    rating: data.data!.results![index].voteAverage / 2,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star_border_purple500,
                      color: Color.fromRGBO(239, 80, 80, 1),
                    ),
                  ),
                  Text(
                    viewModel
                            .calculatedVoteAverage(
                                data.data!.results![index].voteAverage)
                            .toString() +
                        " / 5",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: Color.fromRGBO(197, 197, 197, 1),fontSize: 25),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
