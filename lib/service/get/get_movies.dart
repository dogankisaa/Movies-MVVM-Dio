

import 'package:dio/dio.dart';
import 'package:movie_app/constants/service_constants.dart/get_constants/get_movies_consts.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/service/base_service.dart';

class GetMovies {
 Future<Movie> getMovies() async {
    GetMoviesConstants getMoviesConstants = GetMoviesConstants();
    HttpService http = HttpService();
    Response response;

    response = await http.getRequest(getMoviesConstants.getAllMoviesPath);
    
   
if (response.statusCode == 200) {
    
   return Movie.fromJson(response.data);
   
  } else {
    
    throw Exception('Failed to load movis');
  }
    
  }
}


