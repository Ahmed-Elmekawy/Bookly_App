import 'package:bookly/features/home/views/screens/home_screen.dart';
import 'package:bookly/features/search/views/screens/search_screen.dart';
import 'package:bookly/features/splash/views/screens/splash_screen.dart';
import 'package:bookly/features/book_details/views/screens/book_details_screen.dart';
import 'package:bookly/features/payment/views/screens/my_cart_screen.dart';
import 'package:go_router/go_router.dart';
import '../models/book_model.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static const kMyCartView = '/myCartView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return BookDetailsScreen(
            item: data['item'] as Items,
            category: data['category'] as String,
          );
        },
      ),
      GoRoute(
        path: kMyCartView,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return MyCartScreen(
            price: data['price'] as double,
            discount: data['discount'] as double,
            shipping: data['shipping'] as double,
            title: data['title'] as String,
            image: data['image'] as String,
            currencyCode: data['currencyCode'] as String,
          );
        },
      ),
    ],
  );
}
