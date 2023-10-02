import 'package:flutter/material.dart';
import 'package:flutter_hive_practice/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeController homeController=Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
      ),
      body: GetBuilder<HomeController>(builder: (_){
        return homeController.isLoading?Center(child: CircularProgressIndicator()): ListView.builder(
            itemCount: homeController.postList.length,
            itemBuilder: (context, index){
              return ExpansionTile(title: Text(homeController.postList[index].title!),
                children: [
                  ListTile(
                    leading: Text(homeController.postList[index].id!.toString()),
                    title: Text(homeController.postList[index].body!.toString()),
                  )
                ],

              );

            });
      },

      ),

    );
  }
}
