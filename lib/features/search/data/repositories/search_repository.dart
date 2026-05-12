import 'package:dartz/dartz.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/models/book_model.dart';

abstract class SearchRepository {
  Future<Either<Failure, HomeModel>> searchBooks({required String category});
}
