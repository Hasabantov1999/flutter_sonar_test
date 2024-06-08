import 'package:tripy_ev_stable/config.dart';
import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/services/base_service.dart';
import 'package:tripy_ev_stable/services/local_cache_service.dart';
import 'package:tripy_ev_stable/utils/developer_log_utils.dart';

import '../default_modules/translator/translator.dart';
import '../schemas/storage/localization_schema/localization_schema.dart';

import 'package:hive/hive.dart';

extension LocalizationCacheServiceExtension on LocalizationCacheService {
  LocalizationCacheService get get => Inject.get<LocalizationCacheService>();
}

class LocalizationCacheService implements BaseService {
  Box<LocalizationSchema?>? _box;
  Box<String?>? _rememberMeBox;

  Box<LocalizationSchema?> get getBox => _box!;

  Box<String?>? get getRememberMeBox => _rememberMeBox!;

  LocalizationSchema model() {
    if (_box?.get(Config().get.LanguageCacheBox) == null) {
      init().then((value) {
        return _box!.get(Config().get.LanguageCacheBox)!;
      });
    }
    return _box!.get(Config().get.LanguageCacheBox)!;
  }

  Future<void> setModel(LocalizationSchema appCacheModel) async {
    _box!.put(Config().get.LanguageCacheBox, appCacheModel);
  }

  @override
  Future<void> init() async {
    if (LocalCacheService().get.model().locale == null) {
      LocalCacheService().get.model()
        ..locale = Config().get.InitialLocale
        ..save();
    }
    _box =
        await Hive.openBox<LocalizationSchema?>(Config().get.LanguageCacheKey);

    if (_box?.get(Config().get.LanguageCacheBox) == null) {
      await _box!.put(
        Config().get.LanguageCacheBox,
        LocalizationSchema(
          locale: 'tr',
          translates: {},
        ),
      );
    }
    DeveloperLog.instance.logInfo(
      "Localization Cache Request: ${DateTime.now().toIso8601String()}",
    );
  }
}

class LocalizationServices {
  static LocalizationServices? _instance;

  static LocalizationServices get instance =>
      _instance ??= LocalizationServices._init();
  LocalizationServices._init();

  Future<String> translate(String sentences, {String? language}) async {
    if (language == null &&
        LocalizationCacheService().get.model().locale == "tr") {
      return sentences;
    }

    if (language != null &&
        language == LocalizationCacheService().get.model().locale) {
      return sentences;
    }

    String? cacheSnc = _getCache(sentences);

    if (cacheSnc != null) {
      return cacheSnc;
    }

    Translation translation = await InjectionLimits.translotor.translate(
      sentences,
      from: language ?? "tr",
      to: LocalizationCacheService().get.model().locale ?? "tr",
    );

    await _setCache(sentences, translation.text);

    return translation.text;
  }

  Future<void> _setCache(String sentences, String translate) async {
    bool isContain = false;
    LocalizationCacheService().get.model().translates!.forEach((key, value) {
      if (key == EncryptUtil.cleaner(sentences)) {
        isContain = true;
      }
    });

    if (!isContain) {
      Map<String, String> translates =
          LocalizationCacheService().get.model().translates!;
      translates.addAll(
        {EncryptUtil.cleaner(sentences): translate},
      );
      LocalizationCacheService().get.model()
        ..translates = translates
        ..save();
    }
  }

  String? _getCache(String sentences) {
    String? w = LocalizationCacheService()
        .get
        .model()
        .translates![EncryptUtil.cleaner(sentences)];

    return w;
  }
}

class InjectionLimits {
  static GoogleTranslator translotor = GoogleTranslator();
}

class EncryptUtil {
  static String cleaner(String text) {
    return "&${LocalizationCacheService().get.model().locale}${text.replaceAll(" ", "").toLowerCase()}";
  }

  // Metni şifrelemek için kullanılan fonksiyon
}
