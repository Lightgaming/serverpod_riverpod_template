import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serverpod_riverpod_template_flutter/src/features/features.dart';

part 'routes.g.dart';

@TypedGoRoute<NoteScreen>(
  path: NoteScreen.routePath,
  name: NoteScreen.routeName,
)
@immutable

/// The screen that displays the notes.
class NoteScreen extends GoRouteData {
  /// The Route path for the NoteScreen.
  static const String routePath = '/notes';

  /// The Route name for the NoteScreen.
  static const String routeName = 'Notes';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const NotesScreen();
}

/// GoRouter configuration
final router = GoRouter(
  routes: $appRoutes,
  initialLocation: NoteScreen.routePath,
);
