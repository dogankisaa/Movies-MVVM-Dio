import 'package:movie_app/constants/service_constants.dart/base_constants.dart';
import 'package:movie_app/constants/service_constants.dart/main_view_consts.dart';
import 'package:movie_app/model/popular_model.dart';


import 'package:movie_app/service/get/get_popular.dart';
import 'package:movie_app/view_model/base_view_model.dart';

class MainViewModel extends BaseViewModel {
  late Future<Popular> movieData;
  late List posters = [];
  BaseConstants baseConstants = BaseConstants();
  MainViewConsts mainViewConsts = MainViewConsts();
  @override
  Future<void> init() async {
    
    movieData = GetPopular().getPopular();
  }

 
}
