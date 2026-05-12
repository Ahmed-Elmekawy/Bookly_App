import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/models/book_model.dart';

abstract class SearchRemoteDataSource {
  Future<HomeModel> searchBooks({required String category});
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final ApiService _apiService;

  SearchRemoteDataSourceImpl(this._apiService);

  @override
  Future<HomeModel> searchBooks({required String category}) async {
    var data = await _apiService.get(
      endPoint: 'volumes?Filtering=paid-ebooks&q=$category&Sorting=relevance',
    );
    return HomeModel.fromJson(data);
  }
}
