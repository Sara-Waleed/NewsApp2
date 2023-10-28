import 'package:dio/dio.dart';
import 'package:newwspp/models/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future <List<ArticleModel>> getHttp({required String category}) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=203b2bb0245d4178a6576f5c4270c2e2&category=$category');
      Map<String, dynamic> jasonData = response.data;
      List<dynamic> articles = jasonData["articles"];
      List<ArticleModel> item = [];
      for (var article in articles) {
         ArticleModel articleModel=ArticleModel.fromJson(article);
         item.add(articleModel);

          }
      return item;
    } catch (e) {
      return [];
    }
  }

}