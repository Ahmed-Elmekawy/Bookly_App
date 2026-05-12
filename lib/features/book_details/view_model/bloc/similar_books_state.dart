import 'package:equatable/equatable.dart';
import 'package:bookly/core/models/book_model.dart';

abstract class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object?> get props => [];
}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksLoading extends SimilarBooksState {}

class SimilarBooksSuccess extends SimilarBooksState {
  final HomeModel homeModel;

  const SimilarBooksSuccess(this.homeModel);

  @override
  List<Object?> get props => [homeModel];
}

class SimilarBooksFailure extends SimilarBooksState {
  final String errMessage;

  const SimilarBooksFailure(this.errMessage);

  @override
  List<Object?> get props => [errMessage];
}
