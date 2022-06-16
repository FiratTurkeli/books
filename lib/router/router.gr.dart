// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(routeData: routeData, child: Home());
    },
    ReadListRoute.name: (routeData) {
      return MaterialPageX<dynamic>(routeData: routeData, child: ReadList());
    },
    DetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData, child: Details(book: args.book));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/home', fullMatch: true),
        RouteConfig(HomeRoute.name, path: '/home'),
        RouteConfig(ReadListRoute.name, path: '/readList'),
        RouteConfig(DetailsRoute.name, path: '/details')
      ];
}

/// generated route for
/// [Home]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'Home';
}

/// generated route for
/// [ReadList]
class ReadListRoute extends PageRouteInfo<void> {
  const ReadListRoute() : super(ReadListRoute.name, path: '/readList');

  static const String name = 'ReadList';
}

/// generated route for
/// [Details]
class DetailsRoute extends PageRouteInfo<DetailsArgs> {
  DetailsRoute({required Book book})
      : super(DetailsRoute.name, path: '/details', args: DetailsArgs(book: book));

  static const String name = 'Details';
}

class DetailsArgs {
  const DetailsArgs({required this.book});

  final Book book;

  @override
  String toString() {
    return 'DetailsArgs{book: $book}';
  }
}
