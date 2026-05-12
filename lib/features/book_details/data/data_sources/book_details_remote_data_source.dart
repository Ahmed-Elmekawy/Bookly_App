import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/models/book_model.dart';

abstract class BookDetailsRemoteDataSource {
  Future<HomeModel> fetchSimilarBooks({required String category});
}

class BookDetailsRemoteDataSourceImpl implements BookDetailsRemoteDataSource {
  final ApiService _apiService;

  BookDetailsRemoteDataSourceImpl(this._apiService);

  @override
  Future<HomeModel> fetchSimilarBooks({required String category}) async {
    var data = await _apiService.get(
      endPoint: 'volumes?Filtering=paid-ebooks&Sorting=relevance&q=$category',
    );
    return HomeModel.fromJson(data);
  }
}
