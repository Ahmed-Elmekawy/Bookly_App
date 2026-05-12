import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/models/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<HomeModel> fetchBestSellerBooks();
  Future<HomeModel> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImpl(this._apiService);

  @override
  Future<HomeModel> fetchBestSellerBooks() async {
    var data = await _apiService.get(
      endPoint: 'volumes?Filtering=paid-ebooks&q=programming&Sorting=newest&maxResults=40',
    );
    return HomeModel.fromJson(data);
  }

  @override
  Future<HomeModel> fetchNewestBooks() async {
    var data = await _apiService.get(
      endPoint: 'volumes?Filtering=paid-books&Sorting=newest&q=flutter',
    );
    return HomeModel.fromJson(data);
  }
}
