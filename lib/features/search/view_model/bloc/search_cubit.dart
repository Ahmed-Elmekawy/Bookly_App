import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/features/search/data/repositories/search_repository.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepository _searchRepository;

  SearchCubit(this._searchRepository) : super(SearchInitial());

  Future<void> searchBooks({required String category}) async {
    emit(SearchLoading());
    var result = await _searchRepository.searchBooks(category: category);
    result.fold(
      (failure) => emit(SearchFailure(failure.message)),
      (books) => emit(SearchSuccess(books)),
    );
  }
}
