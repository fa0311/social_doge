/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 100 (50 per locale)
///
/// Built on 2024-04-29 at 11:53 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

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
				return '和';
			case OperatorType.union:
				return '積';
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
	String get title => '同期の許可';
	String get description => '同期を許可します';
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
	@override String get language => '日本語';
	@override late final _TranslationsAccessibilityEn accessibility = _TranslationsAccessibilityEn._(_root);
}

// Path: accessibility
class _TranslationsAccessibilityEn implements _TranslationsAccessibilityJa {
	_TranslationsAccessibilityEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'アクセシビリティ';
	@override String get language => '言語';
	@override String get theme => 'テーマ';
	@override String themeMode({required ThemeMode context}) {
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
			case 'home.totalPeriod': return '全期間';
			case 'home.oneMonth': return '1ヶ月';
			case 'home.threeMonths': return '3ヶ月';
			case 'home.oneYear': return '1年';
			case 'home.synchronize.title': return '同期';
			case 'home.synchronize.description': return '最新の情報をTwitterから取得します';
			case 'home.synchronize.remove.title': return '同期の解除';
			case 'home.synchronize.remove.description': return '同期を解除します';
			case 'home.synchronize.permission.title': return '同期の許可';
			case 'home.synchronize.permission.description': return '同期を許可します';
			case 'home.synchronize.permission.success': return '権限が付与されています';
			case 'home.synchronize.permission.failure': return '権限が付与されていません';
			case 'login.title': return 'ログイン';
			case 'login.note.0': return 'ログインするアカウントと管理するアカウントは分けることが出来ます。';
			case 'login.note.1': return '不正な操作を疑われる可能性が高いため、サブアカウントでログインすることを推奨します。';
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
						return '和';
					case OperatorType.union:
						return '積';
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
			default: return null;
		}
	}
}

extension on _TranslationsEn {
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
			default: return null;
		}
	}
}
