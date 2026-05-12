import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/features/book_details/data/data_sources/book_details_remote_data_source.dart';
import 'package:bookly/features/book_details/data/repositories/book_details_repository.dart';

class BookDetailsRepositoryImpl implements BookDetailsRepository {
  final BookDetailsRemoteDataSource _bookDetailsRemoteDataSource;

  BookDetailsRepositoryImpl(this._bookDetailsRemoteDataSource);

  @override
  Future<Either<Failure, HomeModel>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var books = await _bookDetailsRemoteDataSource.fetchSimilarBooks(category: category);
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}

