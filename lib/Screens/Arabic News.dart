import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_api/HelperFunction/data.dart';
import 'package:news_app_api/HelperFunction/news.dart';
import 'package:news_app_api/Model/ArticleModel.dart';
import 'package:news_app_api/Model/CategoryModel.dart';
import 'package:news_app_api/Screens/articleView.dart';
import 'package:news_app_api/Ui_Widget/MyAppBar.dart';


class Arabic_News extends StatefulWidget {
  @override
  _Arabic_NewsState createState() => _Arabic_NewsState();
}

class _Arabic_NewsState extends State<Arabic_News> {
  CategoryModel categoryModel = new CategoryModel();
  List<ArticleModel> articleList = List<ArticleModel>();
  List<CategoryModel> categoryModelList = new List<CategoryModel>();
  bool isLoading = true;

  @override
  void initState() {
    getNews();
    categoryModelList = getCategoryModel();
    super.initState();
  }

  getNews() async {
    ArabicNews arabic_News = new ArabicNews();
    await arabic_News.getArabic_News();
    articleList = arabic_News.Arabic_newsList;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: MyAppBar(
        FirstText: "Arabic",
        SecoundText: "News",
        x: 0,
        y: 0
      ),
      body: new SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: isLoading
            ? Center(child: new CircularProgressIndicator())
            : ListView.builder(
            itemCount: articleList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  // TODO: Set Image

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          (context),
                          MaterialPageRoute(
                            builder: (context) => ArticleView(
                              BlogUrl: articleList[index].Url,
                            ),
                          ),
                        );
                      },

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: "${articleList[index].urlToImage}",
                          width: double.infinity,
                          height: 190,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: new Text(
                        "${articleList[index].Title}",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),



                  //TODO: Arabic And or US حبيب قلبي تحياتي
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 5),
                    child: new Text(
                      "${articleList[index].Description}",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontWeight: FontWeight.w500),

                    ),
                  ),
                  new SizedBox(
                    height: 15,
                  )
                ],
              );
            }),
      ),
    );
  }
}
