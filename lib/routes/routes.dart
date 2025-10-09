import 'route_info.dart';

class Routes {
  static const RouteInfo home = RouteInfo(
    path: '/',
    name: '/',
  );

  static const RouteInfo resume = RouteInfo(
    path: '/resume',
    name: '/resume',
  );

  static const RouteInfo bezier = RouteInfo(
    path: '/bezier',
    name: '/bezier',
  );

  static const RouteInfo search = RouteInfo(
    path: '/search',
    name: '/search',
  );

  static const RouteInfo luckit = RouteInfo(
    path: '/luckit',
    name: '/luckit',
  );

  static const RouteInfo manitto = RouteInfo(
    path: '/manitto',
    name: '/manitto',
  );

  static const RouteInfo gyeon = RouteInfo(
    path: '/gyeon',
    name: '/gyeon',
  );
  static const RouteInfo gyeonDetail = RouteInfo(
    path: '/detail/:id',
    name: 'detail/:id',
  );
}
