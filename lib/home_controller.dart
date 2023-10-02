
import 'dart:convert';

import 'package:flutter_hive_practice/home_service.dart';
import 'package:flutter_hive_practice/post_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class HomeController extends GetxController{

  HomeService homeService=HomeService();
  List<PostModel> postList=[];
  bool isLoading=false;
  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }


  void getData() async{

    try{
     isLoading =true;
     update();
     http.Response response=await homeService.getData();


     if (response.statusCode==200){
       List<dynamic> results=jsonDecode(response.body);
       results.forEach((value) {
         postList.add(PostModel.fromJson(value));
       });
       isLoading=false;
       print(postList);
     }
     update();



    }

    catch(exception){
      isLoading=false;
      update();
      print(exception);

    }




  }



}