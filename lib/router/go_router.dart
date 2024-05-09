import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_compose/entities/product.dart';
import 'package:widget_compose/screens/home_screen.dart';
import 'package:widget_compose/screens/product_detail_screen.dart';
import 'package:widget_compose/screens/user_screen.dart';
import 'package:widget_compose/widgets/navigation/bottom_tap.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');

final goRouter = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return BottomTap(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            GoRoute(
              path: '/',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomePage(),
              ),
              routes: [
                GoRoute(
                  path: 'detail',
                  builder: (context, state) {
                    final product = state.extra as ProductToDisplay;
                    return ProductDetailScreen(
                      product: product,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBKey,
          routes: [
            // Shopping Cart
            GoRoute(
              path: '/user',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: UserScreen(),
              ),
              // routes: [
              //   GoRoute(
              //     path: 'details',
              //     builder: (context, state) => const DetailsScreen(label: 'B'),
              //   ),
              // ],
            ),
          ],
        ),
      ],
    ),
  ],
);
