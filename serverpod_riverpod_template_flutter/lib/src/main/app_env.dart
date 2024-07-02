/// Enum for the different environments the app can run in.
enum AppEnvironment {
  /// Development environment.
  dev,

  /// Staging environment.
  staging,

  /// Production environment.
  prod,
}

/// Class to hold information about the environment the app is running in.
abstract class EnvInfo {
  static AppEnvironment _environment = AppEnvironment.dev;

  /// Initializes the environment information.
  static set environment(AppEnvironment environment) {
    EnvInfo._environment = environment;
  }

  /// The name of the app.
  static String get appName => _environment._appTitle;

  /// The name of the current environment.
  static String get envName => _environment._envName;

  /// The connection string to the server.
  static String get connectionString => _environment._connectionString;

  /// The current environment.
  static AppEnvironment get environment => _environment;

  /// True if the app is running in development mode.
  static bool get isProduction => _environment == AppEnvironment.prod;
}

extension _EnvProperties on AppEnvironment {
  static const _appTitles = {
    AppEnvironment.dev: 'Serverpod Riverpod Todo Template Development',
    AppEnvironment.staging: 'Serverpod Riverpod Todo Template Staging',
    AppEnvironment.prod: 'Serverpod Riverpod Todo Template',
  };

  static const _connectionStrings = {
    AppEnvironment.dev: 'http://localhost:8080/',
    AppEnvironment.staging: 'http://localhost:8080/',
    AppEnvironment.prod: 'http://localhost:8080/',
  };

  static const _envs = {
    AppEnvironment.dev: 'dev',
    AppEnvironment.staging: 'staging',
    AppEnvironment.prod: 'prod',
  };

  String get _appTitle => _appTitles[this]!;
  String get _envName => _envs[this]!;
  String get _connectionString => _connectionStrings[this]!;
}
