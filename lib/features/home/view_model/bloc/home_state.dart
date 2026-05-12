import 'package:equatable/equatable.dart';
import 'package:bookly/core/models/book_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class NewestBooksLoading extends HomeState {}

class NewestBooksSuccess extends HomeState {
  final HomeModel homeModel;

  const NewestBooksSuccess(this.homeModel);

  @override
  List<Object?> get props => [homeModel];
}

class NewestBooksFailure extends HomeState {
  final String errMessage;

  const NewestBooksFailure(this.errMessage);

  @override
  List<Object?> get props => [errMessage];
}

class BestSellerBooksLoading extends HomeState {}

class BestSellerSuccess extends HomeState {
  final HomeModel homeModel;

  const BestSellerSuccess(this.homeModel);

  @override
  List<Object?> get props => [homeModel];
}

class BestSellerFailure extends HomeState {
  final String errMessage;

  const BestSellerFailure(this.errMessage);

  @override
  List<Object?> get props => [errMessage];
}
