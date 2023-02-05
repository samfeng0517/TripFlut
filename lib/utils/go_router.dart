import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/trip_list/view/trip_list_page.dart';

final goRouterProvider = Provider<GoRouter>((ref) => _router);

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const TripListPage(),
    ),
  ],
);
