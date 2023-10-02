
import 'package:dio/dio.dart';
import 'package:movie_app/constants/service_constants.dart/get_constants/get_movies_consts.dart';
import 'package:movie_app/constants/service_constants.dart/get_constants/get_popular_consts.dart';
import 'package:movie_app/constants/service_constants.dart/get_constants/get_trending_consts.dart';
import 'package:movie_app/constants/service_constants.dart/get_constants/get_upcoming_consts.dart';

import 'package:movie_app/model/popular_model.dart';
import 'package:movie_app/model/trending_model.dart';
import 'package:movie_app/model/upcoming_model.dart';

import 'package:movie_app/service/base_service.dart';

class GetUpcoming {
 Future<Upcoming> getUpcoming() async {
    GetUpcomingConstants getMoviesConstants = GetUpcomingConstants();
    HttpService http = HttpService();
    Response response;

    response = await http.getRequest(getMoviesConstants.getUpcomingPath);
    
   
if (response.statusCode == 200) {
  
   return Upcoming.fromJson(response.data);
   
  } else {
    
    throw Exception('Failed to load movis');
  }
    
  }
}