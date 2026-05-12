import 'package:equatable/equatable.dart';
import 'package:bookly/core/models/book_model.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final HomeModel homeModel;

  const SearchSuccess(this.homeModel);

  @override
  List<Object?> get props => [homeModel];
}

class SearchFailure extends SearchState {
  final String errMessage;

  const SearchFailure(this.errMessage);

  @override
  List<Object?> get props => [errMessage];
}
