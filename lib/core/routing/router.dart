import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/details_feature/presentation/page/details_view.dart';
import '../../features/home_feature/presentation/pages/home_services.dart';
import 'routes.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: Routes.home,

  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: Routes.home,
      builder:
          (context, state) => HomeServices(),
    ),
    GoRoute(
      path: '${Routes.detailsView}/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return DetailsView( projectId: id!,);
      },
    ),

  ],
);
