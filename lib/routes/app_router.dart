import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../ui/home/home_view.dart';
import '../ui/resume/resume_view.dart';
import '../ui/works/bezier/bezier_view.dart';
import '../ui/works/gyeon/detail/detail_view.dart';
import '../ui/works/gyeon/gyeon_view.dart';
import '../ui/works/luckit/luckit_view.dart';
import '../ui/works/manitto/manitto_view.dart';
import '../ui/works/search/search_view.dart';
import 'routes.dart';

final Provider<AppRouter> appRouterProvider =
    Provider<AppRouter>((Ref<AppRouter> ref) => AppRouter());

class AppRouter {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  // 라우트의 이동마다 호출됩니다.
  FutureOr<String?> _redirect(BuildContext context, GoRouterState state) =>
      null;

  late final GoRouter _router = GoRouter(
    initialLocation: Routes.home.path,
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    errorBuilder: (BuildContext context, GoRouterState state) =>
        const HomeView(),
    redirect: _redirect,
    routes: <RouteBase>[
      GoRoute(
        name: Routes.home.name,
        path: Routes.home.path,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            const NoTransitionPage<dynamic>(
          child: HomeView(),
        ),
      ),
      GoRoute(
        name: Routes.resume.name,
        path: Routes.resume.path,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            const NoTransitionPage<dynamic>(
          child: ResumeView(),
        ),
      ),
      GoRoute(
        name: Routes.search.name,
        path: Routes.search.path,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            const NoTransitionPage<dynamic>(
          child: SearchView(),
        ),
      ),
      GoRoute(
        name: Routes.bezier.name,
        path: Routes.bezier.path,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            const NoTransitionPage<dynamic>(
          child: BezierView(),
        ),
      ),
      GoRoute(
        name: Routes.luckit.name,
        path: Routes.luckit.path,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            const NoTransitionPage<dynamic>(
          child: LuckitView(),
        ),
      ),
      GoRoute(
        name: Routes.manitto.name,
        path: Routes.manitto.path,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            const NoTransitionPage<dynamic>(
          child: ManittoView(),
        ),
      ),
      GoRoute(
        name: Routes.gyeon.name,
        path: Routes.gyeon.path,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            const NoTransitionPage<dynamic>(
          child: GyeonView(),
        ),
        routes: <RouteBase>[
          GoRoute(
            name: Routes.gyeonDetail.name,
            path: Routes.gyeonDetail.path,
            pageBuilder: (BuildContext context, GoRouterState state) =>
                NoTransitionPage<dynamic>(
              child: GyeonDetailView(id: state.pathParameters['id'] ?? '0'),
            ),
          ),
        ],
      ),
    ],
  );

  GoRouter get router => _router;
}
