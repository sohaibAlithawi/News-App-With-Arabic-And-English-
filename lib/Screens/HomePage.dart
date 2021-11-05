
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_api/HelperFunction/news.dart';
import 'package:news_app_api/Model/ArticleModel.dart';
import 'package:news_app_api/Model/CategoryModel.dart';
import 'package:news_app_api/HelperFunction/data.dart';
import 'package:news_app_api/Model/CategoryModel.dart';
import 'package:news_app_api/Ui_Widget/BodyVerticalListView.dart';
import 'package:news_app_api/Ui_Widget/Drawer.dart';
import 'package:news_app_api/Ui_Widget/MyAppBar.dart';
import 'package:news_app_api/Ui_Widget/CategoryTile.dart';

class HomePage extends StatefulWidget {
  //const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CategoryModel categoryModel = new CategoryModel();
  List<CategoryModel> categoryModelList = new List<CategoryModel>();
  List<ArticleModel> articleList = List<ArticleModel>();
  bool isLoading = true;
  var url;

  @override
  void initState() {
    super.initState();
    categoryModelList = getCategoryModel();
    getNews();
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
    return Scaffold(
        appBar: MyAppBar(
            FirstText:"Flutter",
            SecoundText:"News",
            x: 0,
            y: 0
        ),
        drawer: MyDrawer(context),
        body: SingleChildScrollView(
          child: new Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: new Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,

                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryModelList.length,
                      itemBuilder: (context,index){
                      return CategoryTile(
                        imageUrl: '${categoryModelList[index].imageUrl}',
                        categoryName: '${categoryModelList[index].categoryName}',

                      );
                  }),
                ),
              ),
              BodyVerticalListView(),
            ],
          ),
        ));
  }
}
