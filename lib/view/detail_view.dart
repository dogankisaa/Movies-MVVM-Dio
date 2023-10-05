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
        viewModel.textLength(data.data!.results![index].overview);
        return CustomScaffoldWidget(
          leading: IconButton(
            onPressed: () {},
            iconSize: viewModel.detailViewConsts.backIconSize,
            color: Colors.white,
            icon: Icon(Icons.keyboard_arrow_left),
          ),
          isHorizontalPadding: false,
          isViewBehindAppBar: true,
          widget: Column(
            children: [
              bannerWidget(viewModel, context),
              SizedBox(
                height: 10,
              ),
              Text(
                data.data!.results![index].title,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: viewModel.detailViewConsts.titleColor,
                    ),
                maxLines: 1,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                viewModel.dateFormat(data.data!.results![index].releaseDate),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: viewModel.detailViewConsts.dateColor),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBarIndicator(
                    direction: Axis.horizontal,
                    rating: data.data!.results![index].voteAverage / 2,
                    itemCount: viewModel.detailViewConsts.starCount,
                    itemPadding: EdgeInsets.symmetric(
                        horizontal:
                            viewModel.detailViewConsts.starHorizontalPadding),
                    itemBuilder: (context, _) => Icon(
                      Icons.star_border_purple500,
                      color: viewModel.detailViewConsts.starFillColor,
                    ),
                  ),
                  Text(
                    viewModel
                            .calculatedVoteAverage(
                                data.data!.results![index].voteAverage)
                            .toString() +
                        viewModel.detailViewConsts.maxRateText,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: viewModel.detailViewConsts.maxRateTextColor,
                        fontSize: viewModel.detailViewConsts.maxRateTextSize),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            color: Color.fromRGBO(197, 197, 197, 0.8),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        infoBoxWidget(
                            context,
                            viewModel.releaseYear(
                                data.data!.results![index].releaseDate)),
                        SizedBox(
                          width: 5,
                        ),
                        infoBoxWidget(context, "2h 13m"),
                        SizedBox(
                          width: 5,
                        ),
                        infoBoxWidget(context, "+12"),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Divider(
                            color: Color.fromRGBO(197, 197, 197, 0.8),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Consumer<DetailViewModel>(
                      builder: (context, value, child) {
                        return viewModel.isMore
                            ? Row(
                                children: [
                                  Text(
                                    data.data!.results![index].overview
                                            .substring(0, 50) +
                                        "...",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                            color: Colors.white, height: 2),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      viewModel.changeTextLength();
                                    },
                                    child: Text(
                                      " Read More",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                              color: Color.fromRGBO(
                                                  239, 80, 80, 1),
                                              height: 2),
                                    ),
                                  ),
                                ],
                              )
                            : Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  data.data!.results![index].overview,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(color: Colors.white, height: 2),
                                ),
                            );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Container infoBoxWidget(BuildContext context, String text) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Color.fromRGBO(197, 197, 197, 0.8),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Color.fromRGBO(219, 219, 219, 1)),
        ),
      ),
    );
  }

  Container bannerWidget(DetailViewModel viewModel, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                  viewModel.detailViewConsts.bannerBottomLeftRadius),
              bottomRight: Radius.circular(
                  viewModel.detailViewConsts.bannerBottomRightRadius)),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(viewModel.baseConstants.sliderImagePath +
                  data.data!.results![index].posterPath))),
      height: viewModel.detailViewConsts.bannerHeight(context),
      width: double.infinity,
    );
  }
}
