import 'package:dartz/dartz.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/models/book_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeModel>> fetchNewestBooks();
  Future<Either<Failure, HomeModel>> fetchBestSellerBooks();
}
