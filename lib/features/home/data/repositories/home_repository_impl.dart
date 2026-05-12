import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/features/home/data/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepositoryImpl(this._homeRemoteDataSource);

  @override
  Future<Either<Failure, HomeModel>> fetchBestSellerBooks() async {
    try {
      var books = await _homeRemoteDataSource.fetchBestSellerBooks();
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, HomeModel>> fetchNewestBooks() async {
    try {
      var books = await _homeRemoteDataSource.fetchNewestBooks();
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}


