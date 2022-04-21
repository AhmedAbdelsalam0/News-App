
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/news_model.dart';

class NewsController extends GetxController{

  RxInt currentIndex = 0.obs;

  getData(String cat) async {
    Uri url = Uri.parse("https://newsapi.org/v2/top-headlines?country=eg&category=$cat&apiKey=3964d429d1ae4aa29bcf587beedaec5a");
    http.Response response = await http.get(url);

    if(response.statusCode == 200){
        try{
          return Articles.fromJson(json.decode(response.body));
        }
        catch(e){
          Get.snackbar("Error!", e.toString());
        }
      }else{
        print("Error While Getting Data!");
      }
  }

}