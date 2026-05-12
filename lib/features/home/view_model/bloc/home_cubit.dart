import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/features/home/data/repositories/home_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;

  HomeCubit(this._homeRepository) : super(HomeInitial());

  Future<void> getNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await _homeRepository.fetchNewestBooks();
    result.fold(
      (failure) => emit(NewestBooksFailure(failure.message)),
      (books) => emit(NewestBooksSuccess(books)),
    );
  }

  Future<void> getBestSellerBooks() async {
    emit(BestSellerBooksLoading());
    var result = await _homeRepository.fetchBestSellerBooks();
    result.fold(
      (failure) => emit(BestSellerFailure(failure.message)),
      (books) => emit(BestSellerSuccess(books)),
    );
  }
}
