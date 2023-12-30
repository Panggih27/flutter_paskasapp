import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'id'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? idText = '',
  }) =>
      [enText, idText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // LoginPage
  {
    'go2o8k3v': {
      'en': 'Login',
      'id': '',
    },
    'ewnaq23b': {
      'en': 'Silahkan masukan email dan password anda untuk login.',
      'id': '',
    },
    'n824nvmi': {
      'en': 'Email',
      'id': '',
    },
    '8ehuda8x': {
      'en': 'Password',
      'id': '',
    },
    'zujrgqkg': {
      'en': 'Sign In',
      'id': '',
    },
    'f7vjjrax': {
      'en': 'Or sign in with',
      'id': '',
    },
    'c48z04wi': {
      'en': 'Continue with Google',
      'id': '',
    },
    '390tc0mb': {
      'en': 'Continue with Apple',
      'id': '',
    },
    'v20kijkg': {
      'en': 'Don\'t have an account?  ',
      'id': '',
    },
    'u5mtdv9e': {
      'en': 'Sign Up here',
      'id': '',
    },
    'm6vgtl00': {
      'en': 'SignUp',
      'id': '',
    },
    'i27arylb': {
      'en': 'Silahkan masukan email dan password anda untuk membuat akun.',
      'id': '',
    },
    'z2ip760v': {
      'en': 'Email',
      'id': '',
    },
    '2nvy5zhg': {
      'en': 'Password',
      'id': '',
    },
    'l2hkffkm': {
      'en': 'Confirm Password',
      'id': '',
    },
    'omhhkhbo': {
      'en': 'Create Now',
      'id': '',
    },
    'ar4txvgd': {
      'en': 'Home',
      'id': '',
    },
  },
  // HomePage
  {
    'aerbfcv9': {
      'en': 'PASKAS',
      'id': '',
    },
    '4gjp4srx': {
      'en': 'Assalamuálaikum',
      'id': '',
    },
    's0fietaj': {
      'en': 'Kabupaten Bogor,',
      'id': '',
    },
    'u2cpvmxf': {
      'en': 'Magrib',
      'id': '',
    },
    '1neweqg7': {
      'en': '18.09',
      'id': '',
    },
    '0mpit1n4': {
      'en': 'Pondok',
      'id': '',
    },
    'dhipgyzn': {
      'en': 'Qurán',
      'id': '',
    },
    'kc9uzkcp': {
      'en': 'DOA',
      'id': '',
    },
    'h5gr0nv7': {
      'en': 'Informasi',
      'id': '',
    },
    '005suso2': {
      'en': 'Distribusi Beras',
      'id': '',
    },
    'jwvwgaq9': {
      'en': 'Seri Distribusi',
      'id': '',
    },
    'w03kxxcg': {
      'en': '60',
      'id': '',
    },
    'q0uennvn': {
      'en': 'Jumlah Pondok',
      'id': '',
    },
    'xkx2svss': {
      'en': '890',
      'id': '',
    },
    '17d0k86p': {
      'en': 'Tonase Beras',
      'id': '',
    },
    '6tv2axnc': {
      'en': '75,3',
      'id': '',
    },
    'ib2bvkpj': {
      'en': 'Settings',
      'id': '',
    },
    'imbluhdy': {
      'en': 'Phone Number',
      'id': '',
    },
    'akfrxa0a': {
      'en': 'Language',
      'id': '',
    },
    'z8r4sxps': {
      'en': 'English (eng)',
      'id': '',
    },
    'kysj2nyf': {
      'en': 'Currency',
      'id': '',
    },
    '8uzfccub': {
      'en': 'US Dollar (\$)',
      'id': '',
    },
    '998700n1': {
      'en': 'Profile Settings',
      'id': '',
    },
    'r91909ph': {
      'en': 'Edit Profile',
      'id': '',
    },
    '5c2yu4dz': {
      'en': 'Notification Settings',
      'id': '',
    },
    'clspfhoz': {
      'en': 'Log out of account',
      'id': '',
    },
    'et1optsv': {
      'en': 'Log Out?',
      'id': '',
    },
    's7uglx3c': {
      'en': 'Home',
      'id': '',
    },
  },
  // DataPondok
  {
    'nxxx5b1x': {
      'en': 'Daftar Pondok',
      'id': '',
    },
    '2zbskikw': {
      'en': 'Cari Pondok',
      'id': '',
    },
    '86xca286': {
      'en': 'Cari Pondok disini...',
      'id': '',
    },
    'bi5wsdh7': {
      'en': 'Nama Pondok',
      'id': '',
    },
    'ycxyvsti': {
      'en': 'Nama Kecamatan',
      'id': '',
    },
    '6kaixqs8': {
      'en': 'Laporan Distribusi',
      'id': '',
    },
    '649t4j6l': {
      'en': 'Cari Pondok',
      'id': '',
    },
    'uoj9ws5k': {
      'en': 'Cari Pondok disini...',
      'id': '',
    },
    'ogh5q3p5': {
      'en': 'Nama Pondok',
      'id': '',
    },
    't2ese43l': {
      'en': 'Nama Kecamatan',
      'id': '',
    },
    'jirzx3pr': {
      'en': 'Pondok',
      'id': '',
    },
  },
  // InformationPage
  {
    '8ticrwgx': {
      'en': 'Customer Care',
      'id': '',
    },
    'rnhishzv': {
      'en': 'Mau Infaq',
      'id': '',
    },
    '6l9h2ou7': {
      'en': 'Hubungi CS',
      'id': '',
    },
    'ifpaxagt': {
      'en': 'Hubungi Kami',
      'id': '',
    },
    'bs5b6sjz': {
      'en': '0813-3331-5077',
      'id': '',
    },
    'fml7ml6s': {
      'en': 'Tanya Admin',
      'id': '',
    },
    'mr0o0hsw': {
      'en': 'gibbogor@gmail.com',
      'id': '',
    },
    '713trd0i': {
      'en': 'www.infaqberasbogor.com',
      'id': '',
    },
    'kdcgxvwt': {
      'en': '@gib.bogor',
      'id': '',
    },
    'bcw7lbgu': {
      'en': 'Infaq Beras Bogor',
      'id': '',
    },
    'udiiu92d': {
      'en':
          'Perum Taman Yasmin sektor 06\nJl. Pinang Merah 1 No. 70/72\nKel. Curug Mekar, Bogor Barat\nKota Bogor, Indonesia 16169',
      'id': '',
    },
    '83k5p44f': {
      'en': 'Informasi',
      'id': '',
    },
  },
  // ProfilPondokPage
  {
    'v4ddcw3q': {
      'en': 'Pondok',
      'id': '',
    },
  },
  // DaftarSuratPage
  {
    '83zen788': {
      'en': 'Daftar Surat',
      'id': '',
    },
    '1xl1lxsc': {
      'en': 'AL BAQARAH',
      'id': '',
    },
    'cdcbu54r': {
      'en': '283 Ayat',
      'id': '',
    },
    'djg5m95b': {
      'en': 'Arabic',
      'id': '',
    },
    '22fz3xb0': {
      'en': 'Bookmark',
      'id': '',
    },
    '5k3dvq11': {
      'en': 'AL BAQARAH',
      'id': '',
    },
    't6vgwss8': {
      'en': '283 Ayat',
      'id': '',
    },
    '4qz7wy27': {
      'en': 'Arabic',
      'id': '',
    },
    '0lnz6giw': {
      'en': 'Qurán',
      'id': '',
    },
  },
  // DoaPage
  {
    '29ievqvj': {
      'en': 'Doa',
      'id': '',
    },
  },
  // Miscellaneous
  {
    't7xhyoja': {
      'en': '',
      'id': '',
    },
    'xrmi32zi': {
      'en': '',
      'id': '',
    },
    'xib0krik': {
      'en': '',
      'id': '',
    },
    'o99izpt7': {
      'en': '',
      'id': '',
    },
    '8av229vn': {
      'en': '',
      'id': '',
    },
    '2f7btvs6': {
      'en': '',
      'id': '',
    },
    'fcvm0ugu': {
      'en': '',
      'id': '',
    },
    '50qjm6zt': {
      'en': '',
      'id': '',
    },
    '2bnk8one': {
      'en': '',
      'id': '',
    },
    '9uoce3dp': {
      'en': '',
      'id': '',
    },
    'cwih67xf': {
      'en': '',
      'id': '',
    },
    'dfwgovkd': {
      'en': '',
      'id': '',
    },
    '1cww1yax': {
      'en': '',
      'id': '',
    },
    '4kudjg06': {
      'en': '',
      'id': '',
    },
    'phslko9n': {
      'en': '',
      'id': '',
    },
    'aa0iwn86': {
      'en': '',
      'id': '',
    },
    'b6jb3wv6': {
      'en': '',
      'id': '',
    },
    'rglnlmsa': {
      'en': '',
      'id': '',
    },
    'k76y7620': {
      'en': '',
      'id': '',
    },
    'k853exbk': {
      'en': '',
      'id': '',
    },
    '65tfwdb8': {
      'en': '',
      'id': '',
    },
    'zzb97frq': {
      'en': '',
      'id': '',
    },
    'selrq84c': {
      'en': '',
      'id': '',
    },
    'j6jzwt3i': {
      'en': '',
      'id': '',
    },
  },
].reduce((a, b) => a..addAll(b));
