// ignore_for_file: non_constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tripy_ev_stable/injection.dart';

class Config {
  String AppType = dotenv.env["App-Type"] ?? "";
  bool DEBUG = dotenv.env["DEBUG"] == "true" ? true : false;
  bool DebugTool = dotenv.env["DEBUG_TOOL"] == "true" ? true : false;
  String DataType = dotenv.env["DATA-TYPE"] ?? "";
  String StorageCacheKey = dotenv.env["STORAGE-CACHE-KEY"] ?? "";
  String LanguageCacheKey = dotenv.env["LANGUAGE-CACHE-KEY"] ?? "";
  String StorageCacheBox = dotenv.env["STORAGE-CACHE-BOX"] ?? "";
  String LanguageCacheBox = dotenv.env["LANGUAGE-CACHE-BOX"] ?? "";
  String InitialLocale = dotenv.env['LOCALE'] ?? "";
  String SupportedLocales = dotenv.env['SUPPORTED-LOCALES'] ?? "";
  String? Theme = dotenv.env['THEME'] == "system" ? null : dotenv.env['THEME'];
  String SentryDsn = dotenv.env['SENTRY_DSN'] ?? "";
  double FigmaWidth = double.parse(dotenv.env['FIGMA_WIDTH'] ?? "0");
  double FigmaHeight = double.parse(dotenv.env['FIGMA_HEIGHT'] ?? "0");
  String BackOffice = dotenv.env['BACK_OFFICE'] ?? "";
  String DebugBackOffice = dotenv.env['DEBUG_BACK_OFFICE'] ?? "";
  String DirectionApiUrl = dotenv.env['GOOGLE_DIRECTIONS_BASE_URL'] ?? "";
  String GoogleMapApiKey = dotenv.env['GOOGLE_TOKEN'] ?? "";
  String languagePath= dotenv.env['LANGUAGE-PATH'] ?? "";
}

extension ConfigExtension on Config {
  Config get get => Inject<Config>();
}
