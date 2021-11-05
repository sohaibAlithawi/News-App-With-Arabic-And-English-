import 'dart:convert';
import 'package:news_app_api/Model/ArticleModel.dart';
import 'package:http/http.dart' as http;

class News{
static String Url = "https://newsapi.org/v2/top-headlines?country=us&"
    "category=general&apiKey=2d6a28e71f3f45d380108bc93aec5c2a";

List<ArticleModel> news = [];
  Future<void> getnews()async{

    var response = await http.get(Url);
    var jsonData =jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData['articles'].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){

          ArticleModel articleModel = ArticleModel(

            Author: element['author'],
            Title: element['title'],
            Description: element['description'],
            Url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['context'],
          );
          news.add(articleModel);
        }

      });
    }

  }

}

class CategoryNews{

  List<ArticleModel> news = [];
  Future<void> getCategoryNews(String myCategory)async{

    String Url = "https://newsapi.org/v2/top-headlines?country=us&"
        "category=$myCategory&apiKey=2d6a28e71f3f45d380108bc93aec5c2a";

    var response = await http.get(Url);
    var jsonData =jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData['articles'].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){

          ArticleModel articleModel = ArticleModel(

            Author: element['author'],
            Title: element['title'],
            Description: element['description'],
            Url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['context'],
          );
          news.add(articleModel);
        }

      });
    }

  }

}


class ArabicNews{

  List<ArticleModel> Arabic_newsList = [];
  Future<void> getArabic_News()async{

    String Url = "https://newsapi.org/v2/top-headlines?country=ae&apiKey=2d6a28e71f3f45d380108bc93aec5c2a";


    var response = await http.get(Url);
    var jsonData =jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData['articles'].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){

          ArticleModel articleModel = ArticleModel(

            Author: element['author'],
            Title: element['title'],
            Description: element['description'],
            Url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['context'],
          );
          Arabic_newsList.add(articleModel);
        }

      });
    }

  }

}