import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/model/news_model.dart';

class Science extends GetWidget {
  @override
  NewsController controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Science"),
      ),
      body: FutureBuilder(
        future: controller.getData("science"),
        builder: (context, AsyncSnapshot snapshot) {
          Articles data = snapshot.data;
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: data.articles.length,
              itemBuilder: (context, int index) {
                return Card(
                  elevation: 10,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        child: Image.network(
                          data.articles[index].urlToImage.toString() ?? '',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(
                        data.articles[index].title ?? '',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      Text(data.articles[index].description ?? ''),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
