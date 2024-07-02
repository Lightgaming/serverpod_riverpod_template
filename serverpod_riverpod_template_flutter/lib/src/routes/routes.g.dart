// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $noteScreen,
    ];

RouteBase get $noteScreen => GoRouteData.$route(
      path: '/notes',
      name: 'Notes',
      factory: $NoteScreenExtension._fromState,
    );

extension $NoteScreenExtension on NoteScreen {
  static NoteScreen _fromState(GoRouterState state) => NoteScreen();

  String get location => GoRouteData.$location(
        '/notes',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
