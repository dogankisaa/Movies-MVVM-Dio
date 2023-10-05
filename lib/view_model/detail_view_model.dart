import 'package:intl/intl.dart';
import 'package:movie_app/constants/detail_view_consts.dart';
import 'package:movie_app/constants/service_constants.dart/base_constants.dart';
import 'package:movie_app/constants/main_view_consts.dart';
import 'package:movie_app/model/popular_model.dart';
import 'package:movie_app/model/trending_model.dart';
import 'package:movie_app/model/upcoming_model.dart';

import 'package:movie_app/service/get/get_popular.dart';
import 'package:movie_app/service/get/get_trending.dart';
import 'package:movie_app/service/get/get_upcoming.dart';
import 'package:movie_app/view_model/base_view_model.dart';

class DetailViewModel extends BaseViewModel {
  BaseConstants baseConstants = BaseConstants();
  DetailViewConsts detailViewConsts = DetailViewConsts();
  DateTime now = DateTime.now();
  bool isMore = false;
  DateTime releaseYearTime = DateTime.now(); @override
  Future<void> init() async {}

  dateFormat(date) {
    var parsedDate = DateTime.parse(date);
    String formattedDate = DateFormat.yMMMM().format(parsedDate);
    return formattedDate;
  }

  releaseYear(date){
     var parsedDate = DateTime.parse(date);
    String releaseYearTime = parsedDate.year.toString();
    return releaseYearTime;
  }

  calculatedVoteAverage(rate) {
    double calcRate = rate / 2;
    return calcRate.toStringAsFixed(1);
  }

  textLength(text) {

    text.length > 50 ? isMore = true : false;
  }

  changeTextLength(){
 
    isMore = !isMore;
    print(isMore);
    notifyListeners();
    return isMore;
  }
}
