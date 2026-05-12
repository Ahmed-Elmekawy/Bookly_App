import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/features/book_details/data/repositories/book_details_repository.dart';
import 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  final BookDetailsRepository _bookDetailsRepository;

  SimilarBooksCubit(this._bookDetailsRepository) : super(SimilarBooksInitial());

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await _bookDetailsRepository.fetchSimilarBooks(category: category);
    result.fold(
      (failure) => emit(SimilarBooksFailure(failure.message)),
      (books) => emit(SimilarBooksSuccess(books)),
    );
  }
}
