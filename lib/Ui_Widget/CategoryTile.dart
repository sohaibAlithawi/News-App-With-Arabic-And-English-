import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_app_api/HelperFunction/news.dart';
import 'package:news_app_api/Model/CategoryModel.dart';
import 'package:news_app_api/HelperFunction/data.dart';
import 'package:news_app_api/Model/CategoryModel.dart';
import 'package:news_app_api/Screens/CategoryScreen.dart';

class CategoryTile extends StatefulWidget {
  final String imageUrl;
  final String categoryName;

  CategoryTile({this.imageUrl, this.categoryName});

  @override
  _CategoryTileState createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  CategoryModel categoryModel = new CategoryModel();
  List<CategoryModel> categoryModelList = new List<CategoryModel>();
  CategoryNews categoryNews = new CategoryNews();

  @override
  void initState() {
    categoryModelList = getCategoryModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryScreen(widget.categoryName),
            ),
          );
        },
        child: new Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: new Image.network(
                  "${widget.imageUrl}",
                  fit: BoxFit.cover,
                  width: 150,
                  height: 100,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: new Container(
                width: 140,
                height: 53,
                child: new Text(
                  "${widget.categoryName}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
