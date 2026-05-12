import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:bookly/features/search/data/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource _searchRemoteDataSource;

  SearchRepositoryImpl(this._searchRemoteDataSource);

  @override
  Future<Either<Failure, HomeModel>> searchBooks(
      {required String category}) async {
    try {
      var books = await _searchRemoteDataSource.searchBooks(category: category);
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}

