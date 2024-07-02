import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:serverpod_riverpod_template_client/serverpod_riverpod_template_client.dart';

part 'serverpod_client_provider.g.dart';

@Riverpod(keepAlive: true)

/// A provider that creates a Serverpod client.
Client client(ClientRef ref) {
  final client = Client('http://$localhost:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();
  return client;
}
