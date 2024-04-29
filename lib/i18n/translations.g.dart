/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 288 (144 per locale)
///
/// Built on 2024-04-29 at 16:46 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
import 'package:social_doge/infrastructure/database/data.dart';
import 'package:social_doge/provider/db/db.dart';
import 'package:social_doge/util/latin.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.ja;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.ja) // set locale
/// - Locale locale = AppLocale.ja.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.ja) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	ja(languageCode: 'ja', build: Translations.build),
	en(languageCode: 'en', build: _TranslationsEn.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get language => '日本語';
	late final _TranslationsAccessibilityJa accessibility = _TranslationsAccessibilityJa._(_root);
	late final _TranslationsHelpJa help = _TranslationsHelpJa._(_root);
	late final _TranslationsHomeJa home = _TranslationsHomeJa._(_root);
	late final _TranslationsLoginJa login = _TranslationsLoginJa._(_root);
	late final _TranslationsResultJa result = _TranslationsResultJa._(_root);
	late final _TranslationsSettingJa setting = _TranslationsSettingJa._(_root);
	late final _TranslationsSetupJa setup = _TranslationsSetupJa._(_root);
	late final _TranslationsSynchronizeJa synchronize = _TranslationsSynchronizeJa._(_root);
	late final _TranslationsRouterJa router = _TranslationsRouterJa._(_root);
	late final _TranslationsErrorJa error = _TranslationsErrorJa._(_root);
	late final _TranslationsChartJa chart = _TranslationsChartJa._(_root);
	late final _TranslationsDrawerJa drawer = _TranslationsDrawerJa._(_root);
}

// Path: accessibility
class _TranslationsAccessibilityJa {
	_TranslationsAccessibilityJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'アクセシビリティ';
	String get language => '言語';
	String get theme => 'テーマ';
	String themeMode({required ThemeMode context}) {
		switch (context) {
			case ThemeMode.system:
				return 'システム';
			case ThemeMode.light:
				return 'ライトテーマ';
			case ThemeMode.dark:
				return 'ダークテーマ';
		}
	}
}

// Path: help
class _TranslationsHelpJa {
	_TranslationsHelpJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'ヘルプ';
	late final _TranslationsHelpContributionJa contribution = _TranslationsHelpContributionJa._(_root);
	late final _TranslationsHelpReportJa report = _TranslationsHelpReportJa._(_root);
	late final _TranslationsHelpDeveloperJa developer = _TranslationsHelpDeveloperJa._(_root);
	late final _TranslationsHelpVersionJa version = _TranslationsHelpVersionJa._(_root);
	late final _TranslationsHelpLicenseJa license = _TranslationsHelpLicenseJa._(_root);
}

// Path: home
class _TranslationsHomeJa {
	_TranslationsHomeJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'ホーム';
	String get totalPeriod => '全期間';
	String get oneMonth => '1ヶ月';
	String get threeMonths => '3ヶ月';
	String get oneYear => '1年';
	late final _TranslationsHomeSynchronizeJa synchronize = _TranslationsHomeSynchronizeJa._(_root);
}

// Path: login
class _TranslationsLoginJa {
	_TranslationsLoginJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'ログイン';
	List<String> get note => [
		'ログインするアカウントと管理するアカウントは分けることが出来ます。',
		'不正な操作を疑われる可能性が高いため、サブアカウントでログインすることを推奨します。',
	];
}

// Path: result
class _TranslationsResultJa {
	_TranslationsResultJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '情報';
	late final _TranslationsResultEmptyJa empty = _TranslationsResultEmptyJa._(_root);
	late final _TranslationsResultDetailJa detail = _TranslationsResultDetailJa._(_root);
	late final _TranslationsResultRemoveJa remove = _TranslationsResultRemoveJa._(_root);
	late final _TranslationsResultUserJa user = _TranslationsResultUserJa._(_root);
	late final _TranslationsResultFollowJa follow = _TranslationsResultFollowJa._(_root);
	late final _TranslationsResultFollowerJa follower = _TranslationsResultFollowerJa._(_root);
	late final _TranslationsResultMutualJa mutual = _TranslationsResultMutualJa._(_root);
	late final _TranslationsResultOneSideJa oneSide = _TranslationsResultOneSideJa._(_root);
	late final _TranslationsResultOneSideReverseJa oneSideReverse = _TranslationsResultOneSideReverseJa._(_root);
	late final _TranslationsResultNewFollowJa newFollow = _TranslationsResultNewFollowJa._(_root);
	late final _TranslationsResultNewFollowerJa newFollower = _TranslationsResultNewFollowerJa._(_root);
	late final _TranslationsResultRemoveFollowJa removeFollow = _TranslationsResultRemoveFollowJa._(_root);
	late final _TranslationsResultRemoveFollowerJa removeFollower = _TranslationsResultRemoveFollowerJa._(_root);
	String get detailConfig => '詳細設定';
}

// Path: setting
class _TranslationsSettingJa {
	_TranslationsSettingJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '設定';
	late final _TranslationsSettingAccessibilityJa accessibility = _TranslationsSettingAccessibilityJa._(_root);
	late final _TranslationsSettingAccountJa account = _TranslationsSettingAccountJa._(_root);
	late final _TranslationsSettingLogoutJa logout = _TranslationsSettingLogoutJa._(_root);
	late final _TranslationsSettingHelpJa help = _TranslationsSettingHelpJa._(_root);
}

// Path: setup
class _TranslationsSetupJa {
	_TranslationsSetupJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'アカウント';
	String get accountId => 'アカウントID';
	String get save => '保存';
}

// Path: synchronize
class _TranslationsSynchronizeJa {
	_TranslationsSynchronizeJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '同期';
	List<String> get notificationTitle => [
		'同期中',
		'同期中.',
		'同期中..',
		'同期中...',
	];
	late final _TranslationsSynchronizeNotificationJa notification = _TranslationsSynchronizeNotificationJa._(_root);
	late final _TranslationsSynchronizeChannelJa channel = _TranslationsSynchronizeChannelJa._(_root);
	late final _TranslationsSynchronizeApiLimitJa apiLimit = _TranslationsSynchronizeApiLimitJa._(_root);
	String get success => '同期が正常に完了しました';
	late final _TranslationsSynchronizeAlertJa alert = _TranslationsSynchronizeAlertJa._(_root);
	late final _TranslationsSynchronizeWarningJa warning = _TranslationsSynchronizeWarningJa._(_root);
	String get close => '閉じる';
	String get cancel => 'キャンセル';
	late final _TranslationsSynchronizeFinishJa finish = _TranslationsSynchronizeFinishJa._(_root);
}

// Path: router
class _TranslationsRouterJa {
	_TranslationsRouterJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get notice => 'アプリのアップデートがあります';
	String get check => '確認';
}

// Path: error
class _TranslationsErrorJa {
	_TranslationsErrorJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String dioExceptionType({required DioExceptionType context}) {
		switch (context) {
			case DioExceptionType.connectionTimeout:
				return 'サーバーとの接続がタイムアウトしました';
			case DioExceptionType.sendTimeout:
				return 'リクエストがタイムアウトしました';
			case DioExceptionType.receiveTimeout:
				return 'レスポンスがタイムアウトしました';
			case DioExceptionType.badCertificate:
				return '証明書が無効です';
			case DioExceptionType.badResponse:
				return '不正なレスポンスが返されました';
			case DioExceptionType.cancel:
				return 'リクエストがキャンセルされました';
			case DioExceptionType.connectionError:
				return 'インターネット接続がありません';
			case DioExceptionType.unknown:
				return '不明なエラーが発生しました';
		}
	}
	String get unknown => '不明なエラーが発生しました';
	String get report => 'エラーを報告する';
}

// Path: chart
class _TranslationsChartJa {
	_TranslationsChartJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get noData => 'データがありません';
	String get date1 => 'yy/MM/dd H:mm';
	String get date2 => 'MM/dd';
}

// Path: drawer
class _TranslationsDrawerJa {
	_TranslationsDrawerJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get close => '閉じる';
	String get setting => '設定';
}

// Path: help.contribution
class _TranslationsHelpContributionJa {
	_TranslationsHelpContributionJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '貢献';
	String get description => 'Githubでの開発に貢献する';
}

// Path: help.report
class _TranslationsHelpReportJa {
	_TranslationsHelpReportJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '報告';
	String get description => '開発者にバグの報告や新機能のリクエストする';
}

// Path: help.developer
class _TranslationsHelpDeveloperJa {
	_TranslationsHelpDeveloperJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '開発者';
	String get description => '開発者の情報を表示する';
}

// Path: help.version
class _TranslationsHelpVersionJa {
	_TranslationsHelpVersionJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'バージョン';
	String description({required Object version}) => '現在のバージョン: ${version}';
}

// Path: help.license
class _TranslationsHelpLicenseJa {
	_TranslationsHelpLicenseJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'ライセンス';
	String get description => 'ライセンス情報を表示する';
}

// Path: home.synchronize
class _TranslationsHomeSynchronizeJa {
	_TranslationsHomeSynchronizeJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '同期';
	String get description => '最新の情報をTwitterから取得します';
	late final _TranslationsHomeSynchronizeRemoveJa remove = _TranslationsHomeSynchronizeRemoveJa._(_root);
	late final _TranslationsHomeSynchronizePermissionJa permission = _TranslationsHomeSynchronizePermissionJa._(_root);
}

// Path: result.empty
class _TranslationsResultEmptyJa {
	_TranslationsResultEmptyJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '同期データがありません';
	String get description => 'ホームの同期ボタンを押して同期してください';
}

// Path: result.detail
class _TranslationsResultDetailJa {
	_TranslationsResultDetailJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '比較';
	String get data => 'データ';
	String get time => '時間';
	String get comparison => '比較';
	String get date => 'yy/MM/dd H:mm';
	String latinChar({required LatinChar context}) {
		switch (context) {
			case LatinChar.A:
				return '𝐴';
			case LatinChar.B:
				return '𝐵';
		}
	}
	String get operator => '演算子';
	String operatorTypeText({required OperatorType context}) {
		switch (context) {
			case OperatorType.intersection:
				return '積';
			case OperatorType.union:
				return '和';
			case OperatorType.difference:
				return '差';
			case OperatorType.symmetricDifference:
				return '対称差';
		}
	}
	String operatorTypeMath({required OperatorType context}) {
		switch (context) {
			case OperatorType.intersection:
				return '∩';
			case OperatorType.union:
				return '∪';
			case OperatorType.difference:
				return '−';
			case OperatorType.symmetricDifference:
				return '△';
		}
	}
	String get search => '検索';
}

// Path: result.remove
class _TranslationsResultRemoveJa {
	_TranslationsResultRemoveJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '同期データ削除';
	String synchronizeMode({required SynchronizeMode context}) {
		switch (context) {
			case SynchronizeMode.follower:
				return 'フォロワー';
			case SynchronizeMode.following:
				return 'フォロー中';
		}
	}
	String get all => '全て';
	late final _TranslationsResultRemoveListJa list = _TranslationsResultRemoveListJa._(_root);
}

// Path: result.user
class _TranslationsResultUserJa {
	_TranslationsResultUserJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '差分';
	late final _TranslationsResultUserMenuJa menu = _TranslationsResultUserMenuJa._(_root);
	String searchType({required SearchType context}) {
		switch (context) {
			case SearchType.normal:
				return '通常';
			case SearchType.regex:
				return '正規表現';
		}
	}
	String sortBy({required SortBy context}) {
		switch (context) {
			case SortBy.id:
				return 'ID';
			case SortBy.name:
				return '名前';
			case SortBy.screenName:
				return 'スクリーンネーム';
			case SortBy.followerCount:
				return 'フォロワー数';
			case SortBy.followingCount:
				return 'フォロー中数';
			case SortBy.createdAt:
				return '登録日';
			case SortBy.ffRate:
				return 'FF比率';
		}
	}
	String sortType({required SortType context}) {
		switch (context) {
			case SortType.asc:
				return '昇順';
			case SortType.desc:
				return '降順';
		}
	}
	String get viewWeb => 'Webで表示';
}

// Path: result.follow
class _TranslationsResultFollowJa {
	_TranslationsResultFollowJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'フォロー';
	String get description => 'フォローしているユーザー';
}

// Path: result.follower
class _TranslationsResultFollowerJa {
	_TranslationsResultFollowerJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'フォロワー';
	String get description => 'フォローされているユーザー';
}

// Path: result.mutual
class _TranslationsResultMutualJa {
	_TranslationsResultMutualJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '相互フォロー';
	String get description => 'フォローしていてフォローされているユーザー';
}

// Path: result.oneSide
class _TranslationsResultOneSideJa {
	_TranslationsResultOneSideJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '片思い';
	String get description => 'フォローしていてフォローされていないユーザー';
}

// Path: result.oneSideReverse
class _TranslationsResultOneSideReverseJa {
	_TranslationsResultOneSideReverseJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '片思われ';
	String get description => 'フォローしていなくてフォローされているユーザー';
}

// Path: result.newFollow
class _TranslationsResultNewFollowJa {
	_TranslationsResultNewFollowJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '新規フォロー';
	String get description => '最近フォローしたユーザー';
}

// Path: result.newFollower
class _TranslationsResultNewFollowerJa {
	_TranslationsResultNewFollowerJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '新規フォロワー';
	String get description => '最近フォローされたユーザー';
}

// Path: result.removeFollow
class _TranslationsResultRemoveFollowJa {
	_TranslationsResultRemoveFollowJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'フォロー解除';
	String get description => '最近フォロー解除したユーザー';
}

// Path: result.removeFollower
class _TranslationsResultRemoveFollowerJa {
	_TranslationsResultRemoveFollowerJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'フォロワー解除';
	String get description => '最近フォロー解除されたユーザー';
}

// Path: setting.accessibility
class _TranslationsSettingAccessibilityJa {
	_TranslationsSettingAccessibilityJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'アクセシビリティ';
}

// Path: setting.account
class _TranslationsSettingAccountJa {
	_TranslationsSettingAccountJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'アカウント';
}

// Path: setting.logout
class _TranslationsSettingLogoutJa {
	_TranslationsSettingLogoutJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'ログアウト';
	String get confirm => 'ログアウトしますか？';
	String get ok => '決定';
}

// Path: setting.help
class _TranslationsSettingHelpJa {
	_TranslationsSettingHelpJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'ヘルプ';
}

// Path: synchronize.notification
class _TranslationsSynchronizeNotificationJa {
	_TranslationsSynchronizeNotificationJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get text => '同期の開始中です';
	String text1({required Object count, required Object total}) => 'フォロー: ${count}/${total}';
	String text2({required Object count, required Object total}) => 'フォロワー: ${count}/${total}';
}

// Path: synchronize.channel
class _TranslationsSynchronizeChannelJa {
	_TranslationsSynchronizeChannelJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Twitter同期チャンネル';
	String get description => 'Twitterの情報を取得するためのチャンネル';
}

// Path: synchronize.apiLimit
class _TranslationsSynchronizeApiLimitJa {
	_TranslationsSynchronizeApiLimitJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'API制限';
	String description({required Object sec}) => 'APIリミットに到達しました ${sec} 秒後に再試行します';
}

// Path: synchronize.alert
class _TranslationsSynchronizeAlertJa {
	_TranslationsSynchronizeAlertJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '同期中です';
	String get description => 'アプリを切り替えるとバックグラウンドで同期を続行します';
}

// Path: synchronize.warning
class _TranslationsSynchronizeWarningJa {
	_TranslationsSynchronizeWarningJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '同期中です';
	String get description => 'アプリを切り替えたり画面を消灯しないでください';
}

// Path: synchronize.finish
class _TranslationsSynchronizeFinishJa {
	_TranslationsSynchronizeFinishJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '同期完了';
	String get description => '同期が完了しました';
}

// Path: home.synchronize.remove
class _TranslationsHomeSynchronizeRemoveJa {
	_TranslationsHomeSynchronizeRemoveJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '同期の解除';
	String get description => '同期を解除します';
}

// Path: home.synchronize.permission
class _TranslationsHomeSynchronizePermissionJa {
	_TranslationsHomeSynchronizePermissionJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '権限の許可';
	String get description => '権限を許可します';
	String get success => '権限が付与されています';
	String get failure => '権限が付与されていません';
}

// Path: result.remove.list
class _TranslationsResultRemoveListJa {
	_TranslationsResultRemoveListJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get date => 'yy/MM/dd H:mm';
	String description({required Object time, required Object count}) => '${time} に同期 / ${count} 件';
}

// Path: result.user.menu
class _TranslationsResultUserMenuJa {
	_TranslationsResultUserMenuJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get searchInput => '検索';
	String get searchType => '検索種類';
	String get sortBy => '並び替え基準';
	String get sortType => '並び替え種類';
}

// Path: <root>
class _TranslationsEn implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _TranslationsEn _root = this; // ignore: unused_field

	// Translations
	@override String get language => 'English';
	@override late final _TranslationsAccessibilityEn accessibility = _TranslationsAccessibilityEn._(_root);
	@override late final _TranslationsHelpEn help = _TranslationsHelpEn._(_root);
	@override late final _TranslationsHomeEn home = _TranslationsHomeEn._(_root);
	@override late final _TranslationsLoginEn login = _TranslationsLoginEn._(_root);
	@override late final _TranslationsResultEn result = _TranslationsResultEn._(_root);
	@override late final _TranslationsSettingEn setting = _TranslationsSettingEn._(_root);
	@override late final _TranslationsSetupEn setup = _TranslationsSetupEn._(_root);
	@override late final _TranslationsSynchronizeEn synchronize = _TranslationsSynchronizeEn._(_root);
	@override late final _TranslationsRouterEn router = _TranslationsRouterEn._(_root);
	@override late final _TranslationsErrorEn error = _TranslationsErrorEn._(_root);
	@override late final _TranslationsChartEn chart = _TranslationsChartEn._(_root);
	@override late final _TranslationsDrawerEn drawer = _TranslationsDrawerEn._(_root);
}

// Path: accessibility
class _TranslationsAccessibilityEn implements _TranslationsAccessibilityJa {
	_TranslationsAccessibilityEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Accessibility';
	@override String get language => 'Language';
	@override String get theme => 'Theme';
	@override String themeMode({required ThemeMode context}) {
		switch (context) {
			case ThemeMode.system:
				return 'System';
			case ThemeMode.light:
				return 'Light Theme';
			case ThemeMode.dark:
				return 'Dark Theme';
		}
	}
}

// Path: help
class _TranslationsHelpEn implements _TranslationsHelpJa {
	_TranslationsHelpEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Help';
	@override late final _TranslationsHelpContributionEn contribution = _TranslationsHelpContributionEn._(_root);
	@override late final _TranslationsHelpReportEn report = _TranslationsHelpReportEn._(_root);
	@override late final _TranslationsHelpDeveloperEn developer = _TranslationsHelpDeveloperEn._(_root);
	@override late final _TranslationsHelpVersionEn version = _TranslationsHelpVersionEn._(_root);
	@override late final _TranslationsHelpLicenseEn license = _TranslationsHelpLicenseEn._(_root);
}

// Path: home
class _TranslationsHomeEn implements _TranslationsHomeJa {
	_TranslationsHomeEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Home';
	@override String get totalPeriod => 'Total Period';
	@override String get oneMonth => '1 Month';
	@override String get threeMonths => '3 Months';
	@override String get oneYear => '1 Year';
	@override late final _TranslationsHomeSynchronizeEn synchronize = _TranslationsHomeSynchronizeEn._(_root);
}

// Path: login
class _TranslationsLoginEn implements _TranslationsLoginJa {
	_TranslationsLoginEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Login';
	@override List<String> get note => [
		'You can separate the account used for logging in and managing.',
		'It is recommended to log in with a sub-account to avoid suspicion of unauthorized operations.',
	];
}

// Path: result
class _TranslationsResultEn implements _TranslationsResultJa {
	_TranslationsResultEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Information';
	@override late final _TranslationsResultEmptyEn empty = _TranslationsResultEmptyEn._(_root);
	@override late final _TranslationsResultDetailEn detail = _TranslationsResultDetailEn._(_root);
	@override late final _TranslationsResultRemoveEn remove = _TranslationsResultRemoveEn._(_root);
	@override late final _TranslationsResultUserEn user = _TranslationsResultUserEn._(_root);
	@override late final _TranslationsResultFollowEn follow = _TranslationsResultFollowEn._(_root);
	@override late final _TranslationsResultFollowerEn follower = _TranslationsResultFollowerEn._(_root);
	@override late final _TranslationsResultMutualEn mutual = _TranslationsResultMutualEn._(_root);
	@override late final _TranslationsResultOneSideEn oneSide = _TranslationsResultOneSideEn._(_root);
	@override late final _TranslationsResultOneSideReverseEn oneSideReverse = _TranslationsResultOneSideReverseEn._(_root);
	@override late final _TranslationsResultNewFollowEn newFollow = _TranslationsResultNewFollowEn._(_root);
	@override late final _TranslationsResultNewFollowerEn newFollower = _TranslationsResultNewFollowerEn._(_root);
	@override late final _TranslationsResultRemoveFollowEn removeFollow = _TranslationsResultRemoveFollowEn._(_root);
	@override late final _TranslationsResultRemoveFollowerEn removeFollower = _TranslationsResultRemoveFollowerEn._(_root);
	@override String get detailConfig => 'Detail Configuration';
}

// Path: setting
class _TranslationsSettingEn implements _TranslationsSettingJa {
	_TranslationsSettingEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Settings';
	@override late final _TranslationsSettingAccessibilityEn accessibility = _TranslationsSettingAccessibilityEn._(_root);
	@override late final _TranslationsSettingAccountEn account = _TranslationsSettingAccountEn._(_root);
	@override late final _TranslationsSettingLogoutEn logout = _TranslationsSettingLogoutEn._(_root);
	@override late final _TranslationsSettingHelpEn help = _TranslationsSettingHelpEn._(_root);
}

// Path: setup
class _TranslationsSetupEn implements _TranslationsSetupJa {
	_TranslationsSetupEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Account';
	@override String get accountId => 'Account ID';
	@override String get save => 'Save';
}

// Path: synchronize
class _TranslationsSynchronizeEn implements _TranslationsSynchronizeJa {
	_TranslationsSynchronizeEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Synchronize';
	@override List<String> get notificationTitle => [
		'Synchronizing',
		'Synchronizing.',
		'Synchronizing..',
		'Synchronizing...',
	];
	@override late final _TranslationsSynchronizeNotificationEn notification = _TranslationsSynchronizeNotificationEn._(_root);
	@override late final _TranslationsSynchronizeChannelEn channel = _TranslationsSynchronizeChannelEn._(_root);
	@override late final _TranslationsSynchronizeApiLimitEn apiLimit = _TranslationsSynchronizeApiLimitEn._(_root);
	@override String get success => 'Synchronization completed successfully';
	@override late final _TranslationsSynchronizeAlertEn alert = _TranslationsSynchronizeAlertEn._(_root);
	@override late final _TranslationsSynchronizeWarningEn warning = _TranslationsSynchronizeWarningEn._(_root);
	@override String get close => 'Close';
	@override String get cancel => 'Cancel';
	@override late final _TranslationsSynchronizeFinishEn finish = _TranslationsSynchronizeFinishEn._(_root);
}

// Path: router
class _TranslationsRouterEn implements _TranslationsRouterJa {
	_TranslationsRouterEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get notice => 'There is an app update available';
	@override String get check => 'Check';
}

// Path: error
class _TranslationsErrorEn implements _TranslationsErrorJa {
	_TranslationsErrorEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String dioExceptionType({required DioExceptionType context}) {
		switch (context) {
			case DioExceptionType.connectionTimeout:
				return 'Connection to the server timed out';
			case DioExceptionType.sendTimeout:
				return 'Request timed out';
			case DioExceptionType.receiveTimeout:
				return 'Response timed out';
			case DioExceptionType.badCertificate:
				return 'Invalid certificate';
			case DioExceptionType.badResponse:
				return 'Invalid response received';
			case DioExceptionType.cancel:
				return 'Request canceled';
			case DioExceptionType.connectionError:
				return 'No internet connection';
			case DioExceptionType.unknown:
				return 'Unknown error occurred';
		}
	}
	@override String get unknown => 'Unknown error occurred';
	@override String get report => 'Report Error';
}

// Path: chart
class _TranslationsChartEn implements _TranslationsChartJa {
	_TranslationsChartEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get noData => 'No data available';
	@override String get date1 => 'yy/MM/dd H:mm';
	@override String get date2 => 'MM/dd';
}

// Path: drawer
class _TranslationsDrawerEn implements _TranslationsDrawerJa {
	_TranslationsDrawerEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get close => 'Close';
	@override String get setting => 'Settings';
}

// Path: help.contribution
class _TranslationsHelpContributionEn implements _TranslationsHelpContributionJa {
	_TranslationsHelpContributionEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Contribution';
	@override String get description => 'Contribute to development on Github';
}

// Path: help.report
class _TranslationsHelpReportEn implements _TranslationsHelpReportJa {
	_TranslationsHelpReportEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Report';
	@override String get description => 'Report bugs or request new features to developers';
}

// Path: help.developer
class _TranslationsHelpDeveloperEn implements _TranslationsHelpDeveloperJa {
	_TranslationsHelpDeveloperEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Developer';
	@override String get description => 'View developer information';
}

// Path: help.version
class _TranslationsHelpVersionEn implements _TranslationsHelpVersionJa {
	_TranslationsHelpVersionEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Version';
	@override String description({required Object version}) => 'Current version: ${version}';
}

// Path: help.license
class _TranslationsHelpLicenseEn implements _TranslationsHelpLicenseJa {
	_TranslationsHelpLicenseEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'License';
	@override String get description => 'Display license information';
}

// Path: home.synchronize
class _TranslationsHomeSynchronizeEn implements _TranslationsHomeSynchronizeJa {
	_TranslationsHomeSynchronizeEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sync';
	@override String get description => 'Fetch the latest information from Twitter';
	@override late final _TranslationsHomeSynchronizeRemoveEn remove = _TranslationsHomeSynchronizeRemoveEn._(_root);
	@override late final _TranslationsHomeSynchronizePermissionEn permission = _TranslationsHomeSynchronizePermissionEn._(_root);
}

// Path: result.empty
class _TranslationsResultEmptyEn implements _TranslationsResultEmptyJa {
	_TranslationsResultEmptyEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'No Sync Data';
	@override String get description => 'Press the sync button on the home screen to sync';
}

// Path: result.detail
class _TranslationsResultDetailEn implements _TranslationsResultDetailJa {
	_TranslationsResultDetailEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Comparison';
	@override String get data => 'Data';
	@override String get time => 'Time';
	@override String get comparison => 'Comparison';
	@override String get date => 'yy/MM/dd H:mm';
	@override String latinChar({required LatinChar context}) {
		switch (context) {
			case LatinChar.A:
				return '𝐴';
			case LatinChar.B:
				return '𝐵';
		}
	}
	@override String get operator => 'Operator';
	@override String operatorTypeText({required OperatorType context}) {
		switch (context) {
			case OperatorType.intersection:
				return 'Union';
			case OperatorType.union:
				return 'Intersection';
			case OperatorType.difference:
				return 'Difference';
			case OperatorType.symmetricDifference:
				return 'Symmetric Difference';
		}
	}
	@override String operatorTypeMath({required OperatorType context}) {
		switch (context) {
			case OperatorType.intersection:
				return '∩';
			case OperatorType.union:
				return '∪';
			case OperatorType.difference:
				return '−';
			case OperatorType.symmetricDifference:
				return '△';
		}
	}
	@override String get search => 'Search';
}

// Path: result.remove
class _TranslationsResultRemoveEn implements _TranslationsResultRemoveJa {
	_TranslationsResultRemoveEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Remove Sync Data';
	@override String synchronizeMode({required SynchronizeMode context}) {
		switch (context) {
			case SynchronizeMode.follower:
				return 'Follower';
			case SynchronizeMode.following:
				return 'Following';
		}
	}
	@override String get all => 'All';
	@override late final _TranslationsResultRemoveListEn list = _TranslationsResultRemoveListEn._(_root);
}

// Path: result.user
class _TranslationsResultUserEn implements _TranslationsResultUserJa {
	_TranslationsResultUserEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Differential';
	@override late final _TranslationsResultUserMenuEn menu = _TranslationsResultUserMenuEn._(_root);
	@override String searchType({required SearchType context}) {
		switch (context) {
			case SearchType.normal:
				return 'Normal';
			case SearchType.regex:
				return 'Regex';
		}
	}
	@override String sortBy({required SortBy context}) {
		switch (context) {
			case SortBy.id:
				return 'ID';
			case SortBy.name:
				return 'Name';
			case SortBy.screenName:
				return 'Screen Name';
			case SortBy.followerCount:
				return 'Followers';
			case SortBy.followingCount:
				return 'Following';
			case SortBy.createdAt:
				return 'Registration Date';
			case SortBy.ffRate:
				return 'FF Ratio';
		}
	}
	@override String sortType({required SortType context}) {
		switch (context) {
			case SortType.asc:
				return 'Ascending';
			case SortType.desc:
				return 'Descending';
		}
	}
	@override String get viewWeb => 'View on Web';
}

// Path: result.follow
class _TranslationsResultFollowEn implements _TranslationsResultFollowJa {
	_TranslationsResultFollowEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Follow';
	@override String get description => 'Users you are following';
}

// Path: result.follower
class _TranslationsResultFollowerEn implements _TranslationsResultFollowerJa {
	_TranslationsResultFollowerEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Follower';
	@override String get description => 'Users who are following you';
}

// Path: result.mutual
class _TranslationsResultMutualEn implements _TranslationsResultMutualJa {
	_TranslationsResultMutualEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mutual';
	@override String get description => 'Users you are following and who are following you';
}

// Path: result.oneSide
class _TranslationsResultOneSideEn implements _TranslationsResultOneSideJa {
	_TranslationsResultOneSideEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'One-sided';
	@override String get description => 'Users you are following but who are not following you';
}

// Path: result.oneSideReverse
class _TranslationsResultOneSideReverseEn implements _TranslationsResultOneSideReverseJa {
	_TranslationsResultOneSideReverseEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'One-sided Reverse';
	@override String get description => 'Users who are following you but whom you are not following';
}

// Path: result.newFollow
class _TranslationsResultNewFollowEn implements _TranslationsResultNewFollowJa {
	_TranslationsResultNewFollowEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'New Follow';
	@override String get description => 'Users recently followed';
}

// Path: result.newFollower
class _TranslationsResultNewFollowerEn implements _TranslationsResultNewFollowerJa {
	_TranslationsResultNewFollowerEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'New Follower';
	@override String get description => 'Users recently followed you';
}

// Path: result.removeFollow
class _TranslationsResultRemoveFollowEn implements _TranslationsResultRemoveFollowJa {
	_TranslationsResultRemoveFollowEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Remove Follow';
	@override String get description => 'Users recently unfollowed';
}

// Path: result.removeFollower
class _TranslationsResultRemoveFollowerEn implements _TranslationsResultRemoveFollowerJa {
	_TranslationsResultRemoveFollowerEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Remove Follower';
	@override String get description => 'Users recently unfollowed you';
}

// Path: setting.accessibility
class _TranslationsSettingAccessibilityEn implements _TranslationsSettingAccessibilityJa {
	_TranslationsSettingAccessibilityEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Accessibility';
}

// Path: setting.account
class _TranslationsSettingAccountEn implements _TranslationsSettingAccountJa {
	_TranslationsSettingAccountEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Account';
}

// Path: setting.logout
class _TranslationsSettingLogoutEn implements _TranslationsSettingLogoutJa {
	_TranslationsSettingLogoutEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Logout';
	@override String get confirm => 'Are you sure you want to log out?';
	@override String get ok => 'OK';
}

// Path: setting.help
class _TranslationsSettingHelpEn implements _TranslationsSettingHelpJa {
	_TranslationsSettingHelpEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Help';
}

// Path: synchronize.notification
class _TranslationsSynchronizeNotificationEn implements _TranslationsSynchronizeNotificationJa {
	_TranslationsSynchronizeNotificationEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get text => 'Sync is in progress';
	@override String text1({required Object count, required Object total}) => 'Following: ${count}/${total}';
	@override String text2({required Object count, required Object total}) => 'Followers: ${count}/${total}';
}

// Path: synchronize.channel
class _TranslationsSynchronizeChannelEn implements _TranslationsSynchronizeChannelJa {
	_TranslationsSynchronizeChannelEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get name => 'Twitter Sync Channel';
	@override String get description => 'Channel for fetching Twitter information';
}

// Path: synchronize.apiLimit
class _TranslationsSynchronizeApiLimitEn implements _TranslationsSynchronizeApiLimitJa {
	_TranslationsSynchronizeApiLimitEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'API Limit';
	@override String description({required Object sec}) => 'API limit reached. Retrying in ${sec} seconds';
}

// Path: synchronize.alert
class _TranslationsSynchronizeAlertEn implements _TranslationsSynchronizeAlertJa {
	_TranslationsSynchronizeAlertEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Synchronization in progress.';
	@override String get description => 'The app will continue syncing in the background when you switch.';
}

// Path: synchronize.warning
class _TranslationsSynchronizeWarningEn implements _TranslationsSynchronizeWarningJa {
	_TranslationsSynchronizeWarningEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Synchronization in progress.';
	@override String get description => 'Do not switch apps or turn off the screen.';
}

// Path: synchronize.finish
class _TranslationsSynchronizeFinishEn implements _TranslationsSynchronizeFinishJa {
	_TranslationsSynchronizeFinishEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sync Complete';
	@override String get description => 'Sync has been completed';
}

// Path: home.synchronize.remove
class _TranslationsHomeSynchronizeRemoveEn implements _TranslationsHomeSynchronizeRemoveJa {
	_TranslationsHomeSynchronizeRemoveEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Remove Sync';
	@override String get description => 'Remove synchronization';
}

// Path: home.synchronize.permission
class _TranslationsHomeSynchronizePermissionEn implements _TranslationsHomeSynchronizePermissionJa {
	_TranslationsHomeSynchronizePermissionEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sync Permission';
	@override String get description => 'Allow synchronization';
	@override String get success => 'Permission granted';
	@override String get failure => 'Permission not granted';
}

// Path: result.remove.list
class _TranslationsResultRemoveListEn implements _TranslationsResultRemoveListJa {
	_TranslationsResultRemoveListEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get date => 'yy/MM/dd H:mm';
	@override String description({required Object time, required Object count}) => 'Synced at ${time} / ${count} items';
}

// Path: result.user.menu
class _TranslationsResultUserMenuEn implements _TranslationsResultUserMenuJa {
	_TranslationsResultUserMenuEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get searchInput => 'Search';
	@override String get searchType => 'Search Type';
	@override String get sortBy => 'Sort By';
	@override String get sortType => 'Sort Type';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'language': return '日本語';
			case 'accessibility.title': return 'アクセシビリティ';
			case 'accessibility.language': return '言語';
			case 'accessibility.theme': return 'テーマ';
			case 'accessibility.themeMode': return ({required ThemeMode context}) {
				switch (context) {
					case ThemeMode.system:
						return 'システム';
					case ThemeMode.light:
						return 'ライトテーマ';
					case ThemeMode.dark:
						return 'ダークテーマ';
				}
			};
			case 'help.title': return 'ヘルプ';
			case 'help.contribution.title': return '貢献';
			case 'help.contribution.description': return 'Githubでの開発に貢献する';
			case 'help.report.title': return '報告';
			case 'help.report.description': return '開発者にバグの報告や新機能のリクエストする';
			case 'help.developer.title': return '開発者';
			case 'help.developer.description': return '開発者の情報を表示する';
			case 'help.version.title': return 'バージョン';
			case 'help.version.description': return ({required Object version}) => '現在のバージョン: ${version}';
			case 'help.license.title': return 'ライセンス';
			case 'help.license.description': return 'ライセンス情報を表示する';
			case 'home.title': return 'ホーム';
			case 'home.totalPeriod': return '全期間';
			case 'home.oneMonth': return '1ヶ月';
			case 'home.threeMonths': return '3ヶ月';
			case 'home.oneYear': return '1年';
			case 'home.synchronize.title': return '同期';
			case 'home.synchronize.description': return '最新の情報をTwitterから取得します';
			case 'home.synchronize.remove.title': return '同期の解除';
			case 'home.synchronize.remove.description': return '同期を解除します';
			case 'home.synchronize.permission.title': return '権限の許可';
			case 'home.synchronize.permission.description': return '権限を許可します';
			case 'home.synchronize.permission.success': return '権限が付与されています';
			case 'home.synchronize.permission.failure': return '権限が付与されていません';
			case 'login.title': return 'ログイン';
			case 'login.note.0': return 'ログインするアカウントと管理するアカウントは分けることが出来ます。';
			case 'login.note.1': return '不正な操作を疑われる可能性が高いため、サブアカウントでログインすることを推奨します。';
			case 'result.title': return '情報';
			case 'result.empty.title': return '同期データがありません';
			case 'result.empty.description': return 'ホームの同期ボタンを押して同期してください';
			case 'result.detail.title': return '比較';
			case 'result.detail.data': return 'データ';
			case 'result.detail.time': return '時間';
			case 'result.detail.comparison': return '比較';
			case 'result.detail.date': return 'yy/MM/dd H:mm';
			case 'result.detail.latinChar': return ({required LatinChar context}) {
				switch (context) {
					case LatinChar.A:
						return '𝐴';
					case LatinChar.B:
						return '𝐵';
				}
			};
			case 'result.detail.operator': return '演算子';
			case 'result.detail.operatorTypeText': return ({required OperatorType context}) {
				switch (context) {
					case OperatorType.intersection:
						return '積';
					case OperatorType.union:
						return '和';
					case OperatorType.difference:
						return '差';
					case OperatorType.symmetricDifference:
						return '対称差';
				}
			};
			case 'result.detail.operatorTypeMath': return ({required OperatorType context}) {
				switch (context) {
					case OperatorType.intersection:
						return '∩';
					case OperatorType.union:
						return '∪';
					case OperatorType.difference:
						return '−';
					case OperatorType.symmetricDifference:
						return '△';
				}
			};
			case 'result.detail.search': return '検索';
			case 'result.remove.title': return '同期データ削除';
			case 'result.remove.synchronizeMode': return ({required SynchronizeMode context}) {
				switch (context) {
					case SynchronizeMode.follower:
						return 'フォロワー';
					case SynchronizeMode.following:
						return 'フォロー中';
				}
			};
			case 'result.remove.all': return '全て';
			case 'result.remove.list.date': return 'yy/MM/dd H:mm';
			case 'result.remove.list.description': return ({required Object time, required Object count}) => '${time} に同期 / ${count} 件';
			case 'result.user.title': return '差分';
			case 'result.user.menu.searchInput': return '検索';
			case 'result.user.menu.searchType': return '検索種類';
			case 'result.user.menu.sortBy': return '並び替え基準';
			case 'result.user.menu.sortType': return '並び替え種類';
			case 'result.user.searchType': return ({required SearchType context}) {
				switch (context) {
					case SearchType.normal:
						return '通常';
					case SearchType.regex:
						return '正規表現';
				}
			};
			case 'result.user.sortBy': return ({required SortBy context}) {
				switch (context) {
					case SortBy.id:
						return 'ID';
					case SortBy.name:
						return '名前';
					case SortBy.screenName:
						return 'スクリーンネーム';
					case SortBy.followerCount:
						return 'フォロワー数';
					case SortBy.followingCount:
						return 'フォロー中数';
					case SortBy.createdAt:
						return '登録日';
					case SortBy.ffRate:
						return 'FF比率';
				}
			};
			case 'result.user.sortType': return ({required SortType context}) {
				switch (context) {
					case SortType.asc:
						return '昇順';
					case SortType.desc:
						return '降順';
				}
			};
			case 'result.user.viewWeb': return 'Webで表示';
			case 'result.follow.title': return 'フォロー';
			case 'result.follow.description': return 'フォローしているユーザー';
			case 'result.follower.title': return 'フォロワー';
			case 'result.follower.description': return 'フォローされているユーザー';
			case 'result.mutual.title': return '相互フォロー';
			case 'result.mutual.description': return 'フォローしていてフォローされているユーザー';
			case 'result.oneSide.title': return '片思い';
			case 'result.oneSide.description': return 'フォローしていてフォローされていないユーザー';
			case 'result.oneSideReverse.title': return '片思われ';
			case 'result.oneSideReverse.description': return 'フォローしていなくてフォローされているユーザー';
			case 'result.newFollow.title': return '新規フォロー';
			case 'result.newFollow.description': return '最近フォローしたユーザー';
			case 'result.newFollower.title': return '新規フォロワー';
			case 'result.newFollower.description': return '最近フォローされたユーザー';
			case 'result.removeFollow.title': return 'フォロー解除';
			case 'result.removeFollow.description': return '最近フォロー解除したユーザー';
			case 'result.removeFollower.title': return 'フォロワー解除';
			case 'result.removeFollower.description': return '最近フォロー解除されたユーザー';
			case 'result.detailConfig': return '詳細設定';
			case 'setting.title': return '設定';
			case 'setting.accessibility.title': return 'アクセシビリティ';
			case 'setting.account.title': return 'アカウント';
			case 'setting.logout.title': return 'ログアウト';
			case 'setting.logout.confirm': return 'ログアウトしますか？';
			case 'setting.logout.ok': return '決定';
			case 'setting.help.title': return 'ヘルプ';
			case 'setup.title': return 'アカウント';
			case 'setup.accountId': return 'アカウントID';
			case 'setup.save': return '保存';
			case 'synchronize.title': return '同期';
			case 'synchronize.notificationTitle.0': return '同期中';
			case 'synchronize.notificationTitle.1': return '同期中.';
			case 'synchronize.notificationTitle.2': return '同期中..';
			case 'synchronize.notificationTitle.3': return '同期中...';
			case 'synchronize.notification.text': return '同期の開始中です';
			case 'synchronize.notification.text1': return ({required Object count, required Object total}) => 'フォロー: ${count}/${total}';
			case 'synchronize.notification.text2': return ({required Object count, required Object total}) => 'フォロワー: ${count}/${total}';
			case 'synchronize.channel.name': return 'Twitter同期チャンネル';
			case 'synchronize.channel.description': return 'Twitterの情報を取得するためのチャンネル';
			case 'synchronize.apiLimit.title': return 'API制限';
			case 'synchronize.apiLimit.description': return ({required Object sec}) => 'APIリミットに到達しました ${sec} 秒後に再試行します';
			case 'synchronize.success': return '同期が正常に完了しました';
			case 'synchronize.alert.title': return '同期中です';
			case 'synchronize.alert.description': return 'アプリを切り替えるとバックグラウンドで同期を続行します';
			case 'synchronize.warning.title': return '同期中です';
			case 'synchronize.warning.description': return 'アプリを切り替えたり画面を消灯しないでください';
			case 'synchronize.close': return '閉じる';
			case 'synchronize.cancel': return 'キャンセル';
			case 'synchronize.finish.title': return '同期完了';
			case 'synchronize.finish.description': return '同期が完了しました';
			case 'router.notice': return 'アプリのアップデートがあります';
			case 'router.check': return '確認';
			case 'error.dioExceptionType': return ({required DioExceptionType context}) {
				switch (context) {
					case DioExceptionType.connectionTimeout:
						return 'サーバーとの接続がタイムアウトしました';
					case DioExceptionType.sendTimeout:
						return 'リクエストがタイムアウトしました';
					case DioExceptionType.receiveTimeout:
						return 'レスポンスがタイムアウトしました';
					case DioExceptionType.badCertificate:
						return '証明書が無効です';
					case DioExceptionType.badResponse:
						return '不正なレスポンスが返されました';
					case DioExceptionType.cancel:
						return 'リクエストがキャンセルされました';
					case DioExceptionType.connectionError:
						return 'インターネット接続がありません';
					case DioExceptionType.unknown:
						return '不明なエラーが発生しました';
				}
			};
			case 'error.unknown': return '不明なエラーが発生しました';
			case 'error.report': return 'エラーを報告する';
			case 'chart.noData': return 'データがありません';
			case 'chart.date1': return 'yy/MM/dd H:mm';
			case 'chart.date2': return 'MM/dd';
			case 'drawer.close': return '閉じる';
			case 'drawer.setting': return '設定';
			default: return null;
		}
	}
}

extension on _TranslationsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'language': return 'English';
			case 'accessibility.title': return 'Accessibility';
			case 'accessibility.language': return 'Language';
			case 'accessibility.theme': return 'Theme';
			case 'accessibility.themeMode': return ({required ThemeMode context}) {
				switch (context) {
					case ThemeMode.system:
						return 'System';
					case ThemeMode.light:
						return 'Light Theme';
					case ThemeMode.dark:
						return 'Dark Theme';
				}
			};
			case 'help.title': return 'Help';
			case 'help.contribution.title': return 'Contribution';
			case 'help.contribution.description': return 'Contribute to development on Github';
			case 'help.report.title': return 'Report';
			case 'help.report.description': return 'Report bugs or request new features to developers';
			case 'help.developer.title': return 'Developer';
			case 'help.developer.description': return 'View developer information';
			case 'help.version.title': return 'Version';
			case 'help.version.description': return ({required Object version}) => 'Current version: ${version}';
			case 'help.license.title': return 'License';
			case 'help.license.description': return 'Display license information';
			case 'home.title': return 'Home';
			case 'home.totalPeriod': return 'Total Period';
			case 'home.oneMonth': return '1 Month';
			case 'home.threeMonths': return '3 Months';
			case 'home.oneYear': return '1 Year';
			case 'home.synchronize.title': return 'Sync';
			case 'home.synchronize.description': return 'Fetch the latest information from Twitter';
			case 'home.synchronize.remove.title': return 'Remove Sync';
			case 'home.synchronize.remove.description': return 'Remove synchronization';
			case 'home.synchronize.permission.title': return 'Sync Permission';
			case 'home.synchronize.permission.description': return 'Allow synchronization';
			case 'home.synchronize.permission.success': return 'Permission granted';
			case 'home.synchronize.permission.failure': return 'Permission not granted';
			case 'login.title': return 'Login';
			case 'login.note.0': return 'You can separate the account used for logging in and managing.';
			case 'login.note.1': return 'It is recommended to log in with a sub-account to avoid suspicion of unauthorized operations.';
			case 'result.title': return 'Information';
			case 'result.empty.title': return 'No Sync Data';
			case 'result.empty.description': return 'Press the sync button on the home screen to sync';
			case 'result.detail.title': return 'Comparison';
			case 'result.detail.data': return 'Data';
			case 'result.detail.time': return 'Time';
			case 'result.detail.comparison': return 'Comparison';
			case 'result.detail.date': return 'yy/MM/dd H:mm';
			case 'result.detail.latinChar': return ({required LatinChar context}) {
				switch (context) {
					case LatinChar.A:
						return '𝐴';
					case LatinChar.B:
						return '𝐵';
				}
			};
			case 'result.detail.operator': return 'Operator';
			case 'result.detail.operatorTypeText': return ({required OperatorType context}) {
				switch (context) {
					case OperatorType.intersection:
						return 'Union';
					case OperatorType.union:
						return 'Intersection';
					case OperatorType.difference:
						return 'Difference';
					case OperatorType.symmetricDifference:
						return 'Symmetric Difference';
				}
			};
			case 'result.detail.operatorTypeMath': return ({required OperatorType context}) {
				switch (context) {
					case OperatorType.intersection:
						return '∩';
					case OperatorType.union:
						return '∪';
					case OperatorType.difference:
						return '−';
					case OperatorType.symmetricDifference:
						return '△';
				}
			};
			case 'result.detail.search': return 'Search';
			case 'result.remove.title': return 'Remove Sync Data';
			case 'result.remove.synchronizeMode': return ({required SynchronizeMode context}) {
				switch (context) {
					case SynchronizeMode.follower:
						return 'Follower';
					case SynchronizeMode.following:
						return 'Following';
				}
			};
			case 'result.remove.all': return 'All';
			case 'result.remove.list.date': return 'yy/MM/dd H:mm';
			case 'result.remove.list.description': return ({required Object time, required Object count}) => 'Synced at ${time} / ${count} items';
			case 'result.user.title': return 'Differential';
			case 'result.user.menu.searchInput': return 'Search';
			case 'result.user.menu.searchType': return 'Search Type';
			case 'result.user.menu.sortBy': return 'Sort By';
			case 'result.user.menu.sortType': return 'Sort Type';
			case 'result.user.searchType': return ({required SearchType context}) {
				switch (context) {
					case SearchType.normal:
						return 'Normal';
					case SearchType.regex:
						return 'Regex';
				}
			};
			case 'result.user.sortBy': return ({required SortBy context}) {
				switch (context) {
					case SortBy.id:
						return 'ID';
					case SortBy.name:
						return 'Name';
					case SortBy.screenName:
						return 'Screen Name';
					case SortBy.followerCount:
						return 'Followers';
					case SortBy.followingCount:
						return 'Following';
					case SortBy.createdAt:
						return 'Registration Date';
					case SortBy.ffRate:
						return 'FF Ratio';
				}
			};
			case 'result.user.sortType': return ({required SortType context}) {
				switch (context) {
					case SortType.asc:
						return 'Ascending';
					case SortType.desc:
						return 'Descending';
				}
			};
			case 'result.user.viewWeb': return 'View on Web';
			case 'result.follow.title': return 'Follow';
			case 'result.follow.description': return 'Users you are following';
			case 'result.follower.title': return 'Follower';
			case 'result.follower.description': return 'Users who are following you';
			case 'result.mutual.title': return 'Mutual';
			case 'result.mutual.description': return 'Users you are following and who are following you';
			case 'result.oneSide.title': return 'One-sided';
			case 'result.oneSide.description': return 'Users you are following but who are not following you';
			case 'result.oneSideReverse.title': return 'One-sided Reverse';
			case 'result.oneSideReverse.description': return 'Users who are following you but whom you are not following';
			case 'result.newFollow.title': return 'New Follow';
			case 'result.newFollow.description': return 'Users recently followed';
			case 'result.newFollower.title': return 'New Follower';
			case 'result.newFollower.description': return 'Users recently followed you';
			case 'result.removeFollow.title': return 'Remove Follow';
			case 'result.removeFollow.description': return 'Users recently unfollowed';
			case 'result.removeFollower.title': return 'Remove Follower';
			case 'result.removeFollower.description': return 'Users recently unfollowed you';
			case 'result.detailConfig': return 'Detail Configuration';
			case 'setting.title': return 'Settings';
			case 'setting.accessibility.title': return 'Accessibility';
			case 'setting.account.title': return 'Account';
			case 'setting.logout.title': return 'Logout';
			case 'setting.logout.confirm': return 'Are you sure you want to log out?';
			case 'setting.logout.ok': return 'OK';
			case 'setting.help.title': return 'Help';
			case 'setup.title': return 'Account';
			case 'setup.accountId': return 'Account ID';
			case 'setup.save': return 'Save';
			case 'synchronize.title': return 'Synchronize';
			case 'synchronize.notificationTitle.0': return 'Synchronizing';
			case 'synchronize.notificationTitle.1': return 'Synchronizing.';
			case 'synchronize.notificationTitle.2': return 'Synchronizing..';
			case 'synchronize.notificationTitle.3': return 'Synchronizing...';
			case 'synchronize.notification.text': return 'Sync is in progress';
			case 'synchronize.notification.text1': return ({required Object count, required Object total}) => 'Following: ${count}/${total}';
			case 'synchronize.notification.text2': return ({required Object count, required Object total}) => 'Followers: ${count}/${total}';
			case 'synchronize.channel.name': return 'Twitter Sync Channel';
			case 'synchronize.channel.description': return 'Channel for fetching Twitter information';
			case 'synchronize.apiLimit.title': return 'API Limit';
			case 'synchronize.apiLimit.description': return ({required Object sec}) => 'API limit reached. Retrying in ${sec} seconds';
			case 'synchronize.success': return 'Synchronization completed successfully';
			case 'synchronize.alert.title': return 'Synchronization in progress.';
			case 'synchronize.alert.description': return 'The app will continue syncing in the background when you switch.';
			case 'synchronize.warning.title': return 'Synchronization in progress.';
			case 'synchronize.warning.description': return 'Do not switch apps or turn off the screen.';
			case 'synchronize.close': return 'Close';
			case 'synchronize.cancel': return 'Cancel';
			case 'synchronize.finish.title': return 'Sync Complete';
			case 'synchronize.finish.description': return 'Sync has been completed';
			case 'router.notice': return 'There is an app update available';
			case 'router.check': return 'Check';
			case 'error.dioExceptionType': return ({required DioExceptionType context}) {
				switch (context) {
					case DioExceptionType.connectionTimeout:
						return 'Connection to the server timed out';
					case DioExceptionType.sendTimeout:
						return 'Request timed out';
					case DioExceptionType.receiveTimeout:
						return 'Response timed out';
					case DioExceptionType.badCertificate:
						return 'Invalid certificate';
					case DioExceptionType.badResponse:
						return 'Invalid response received';
					case DioExceptionType.cancel:
						return 'Request canceled';
					case DioExceptionType.connectionError:
						return 'No internet connection';
					case DioExceptionType.unknown:
						return 'Unknown error occurred';
				}
			};
			case 'error.unknown': return 'Unknown error occurred';
			case 'error.report': return 'Report Error';
			case 'chart.noData': return 'No data available';
			case 'chart.date1': return 'yy/MM/dd H:mm';
			case 'chart.date2': return 'MM/dd';
			case 'drawer.close': return 'Close';
			case 'drawer.setting': return 'Settings';
			default: return null;
		}
	}
}
