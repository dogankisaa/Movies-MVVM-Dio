import 'package:intl/intl.dart';
import 'package:movie_app/constants/service_constants.dart/base_constants.dart';
import 'package:movie_app/constants/service_constants.dart/main_view_consts.dart';
import 'package:movie_app/model/popular_model.dart';
import 'package:movie_app/model/trending_model.dart';
import 'package:movie_app/model/upcoming_model.dart';

import 'package:movie_app/service/get/get_popular.dart';
import 'package:movie_app/service/get/get_trending.dart';
import 'package:movie_app/service/get/get_upcoming.dart';
import 'package:movie_app/view_model/base_view_model.dart';

class DetailViewModel extends BaseViewModel {
  BaseConstants baseConstants = BaseConstants();
  DateTime now = DateTime.now();
  @override
  Future<void> init() async {}

  dateFormat(date) {
    var parsedDate = DateTime.parse(date);
    String formattedDate = DateFormat.yMMMM().format(parsedDate);
    return formattedDate;
  } 

  calculatedVoteAverage(rate){
    double calcRate = rate /2;
    return calcRate.toStringAsFixed(1);
  }
}
