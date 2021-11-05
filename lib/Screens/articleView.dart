import 'package:flutter/material.dart';
import 'package:news_app_api/HelperFunction/data.dart';
import 'package:news_app_api/HelperFunction/news.dart';
import 'package:news_app_api/Model/ArticleModel.dart';
import 'package:news_app_api/Model/CategoryModel.dart';
import 'package:news_app_api/Ui_Widget/MyAppBar.dart';
import 'package:news_app_api/main.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  //const ArticleView({Key? key}) : super(key: key);
  final String BlogUrl;
  ArticleView({this.BlogUrl});
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  List<CategoryModel> categoryModelList = new List<CategoryModel>();
  List<ArticleModel> articleList = List<ArticleModel>();
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
    return Scaffold(
      appBar:  MyAppBar(
          FirstText:"Flutter",
          SecoundText:"Web",
          x: 0,
          y: 0
      ),
      body: isLoading ? new Center(child: CircularProgressIndicator(),): Container(
        width: MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height ,
        child: WebView(
          initialUrl: widget.BlogUrl,
        ),
      ),
    );
  }
}
