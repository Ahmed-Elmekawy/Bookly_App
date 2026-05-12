import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/stripe_service.dart';
import 'package:bookly/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/features/home/data/repositories/home_repository.dart';
import 'package:bookly/features/home/data/repositories/home_repository_impl.dart';
import 'package:bookly/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:bookly/features/search/data/repositories/search_repository.dart';
import 'package:bookly/features/search/data/repositories/search_repository_impl.dart';
import 'package:bookly/features/search/view_model/bloc/search_cubit.dart';
import 'package:bookly/features/book_details/data/data_sources/book_details_remote_data_source.dart';
import 'package:bookly/features/book_details/data/repositories/book_details_repository.dart';
import 'package:bookly/features/book_details/data/repositories/book_details_repository_impl.dart';
import 'package:bookly/features/book_details/view_model/bloc/similar_books_cubit.dart';
import 'package:bookly/features/payment/data/data_sources/payment_remote_data_source.dart';
import 'package:bookly/features/payment/data/repositories/payment_repository.dart';
import 'package:bookly/features/payment/data/repositories/payment_repository_impl.dart';
import 'package:bookly/features/payment/view_model/bloc/payment_cubit.dart';
import 'package:bookly/features/home/view_model/bloc/home_cubit.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // Services
  sl.registerSingleton<ApiService>(ApiService(Dio()));
  sl.registerSingleton<StripeService>(StripeService(sl<ApiService>()));

  // Data Sources
  sl.registerSingleton<HomeRemoteDataSource>(
    HomeRemoteDataSourceImpl(sl<ApiService>()),
  );
  sl.registerSingleton<SearchRemoteDataSource>(
    SearchRemoteDataSourceImpl(sl<ApiService>()),
  );
  sl.registerSingleton<BookDetailsRemoteDataSource>(
    BookDetailsRemoteDataSourceImpl(sl<ApiService>()),
  );
  sl.registerSingleton<PaymentRemoteDataSource>(
    PaymentRemoteDataSourceImpl(sl<StripeService>()),
  );

  // Repositories
  sl.registerSingleton<HomeRepository>(
    HomeRepositoryImpl(sl<HomeRemoteDataSource>()),
  );

  sl.registerSingleton<SearchRepository>(
    SearchRepositoryImpl(sl<SearchRemoteDataSource>()),
  );

  sl.registerSingleton<BookDetailsRepository>(
    BookDetailsRepositoryImpl(sl<BookDetailsRemoteDataSource>()),
  );

  sl.registerSingleton<PaymentRepository>(
    PaymentRepositoryImpl(sl<PaymentRemoteDataSource>()),
  );

  // Blocs
  sl.registerFactory(() => HomeCubit(sl<HomeRepository>()));
  sl.registerFactory(() => SearchCubit(sl<SearchRepository>()));
  sl.registerFactory(() => SimilarBooksCubit(sl<BookDetailsRepository>()));
  sl.registerFactory(() => PaymentCubit(sl<PaymentRepository>()));
}
