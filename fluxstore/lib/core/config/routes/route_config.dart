import 'package:fluxstore/core/config/routes/route_names.dart';
import 'package:fluxstore/core/config/routes/routes.dart';
import 'package:go_router/go_router.dart';

final GoRouter routerConfig = GoRouter(
  initialLocation: AppRoutes.main,
  routes: routes,
);
