import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_api/HelperFunction/data.dart';
import 'package:news_app_api/HelperFunction/news.dart';
import 'package:news_app_api/Model/ArticleModel.dart';
import 'package:news_app_api/Model/CategoryModel.dart';
import 'package:news_app_api/Screens/articleView.dart';

class BodyVerticalListView extends StatefulWidget {
  @override
  _BodyVerticalListViewState createState() => _BodyVerticalListViewState();
}

class _BodyVerticalListViewState extends State<BodyVerticalListView> {
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
    News newsClass = new News();
    await newsClass.getnews();
    articleList = newsClass.news;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
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
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: new Text(
                          "${articleList[index].Description}",
                          textAlign: TextAlign.left,

                        ),
                      ),
                    ),
                    new SizedBox(
                      height: 15,
                    )
                  ],
                );
              }),
    );
  }
}
