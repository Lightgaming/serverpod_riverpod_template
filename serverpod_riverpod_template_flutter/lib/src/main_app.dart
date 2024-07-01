import 'package:flutter/material.dart';
import 'package:serverpod_riverpod_template_flutter/src/common_widgets/app_layout/app_material_app.dart';
import 'package:serverpod_riverpod_template_flutter/src/features/notes/presentation/notes_listing_view.dart';

/// The main application widget.
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppMaterialApp(
      home: NotesListingView(),
    );
  }
}
