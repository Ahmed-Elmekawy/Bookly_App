import 'package:dartz/dartz.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/models/book_model.dart';

abstract class BookDetailsRepository {
  Future<Either<Failure, HomeModel>> fetchSimilarBooks({required String category});
}
