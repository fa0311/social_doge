/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 294 (147 per locale)

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

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	ja(languageCode: 'ja', build: _TranslationsJa.build);

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
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get language => 'English';
	late final _TranslationsAccessibilityEn accessibility = _TranslationsAccessibilityEn._(_root);
	late final _TranslationsHelpEn help = _TranslationsHelpEn._(_root);
	late final _TranslationsHomeEn home = _TranslationsHomeEn._(_root);
	late final _TranslationsLoginEn login = _TranslationsLoginEn._(_root);
	late final _TranslationsResultEn result = _TranslationsResultEn._(_root);
	late final _TranslationsSettingEn setting = _TranslationsSettingEn._(_root);
	late final _TranslationsSetupEn setup = _TranslationsSetupEn._(_root);
	late final _TranslationsSynchronizeEn synchronize = _TranslationsSynchronizeEn._(_root);
	late final _TranslationsRouterEn router = _TranslationsRouterEn._(_root);
	late final _TranslationsErrorEn error = _TranslationsErrorEn._(_root);
	late final _TranslationsChartEn chart = _TranslationsChartEn._(_root);
	late final _TranslationsDrawerEn drawer = _TranslationsDrawerEn._(_root);
}

// Path: accessibility
class _TranslationsAccessibilityEn {
	_TranslationsAccessibilityEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Accessibility';
	String get language => 'Language';
	String get theme => 'Theme';
	String themeMode({required ThemeMode context}) {
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
class _TranslationsHelpEn {
	_TranslationsHelpEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Help';
	late final _TranslationsHelpContributionEn contribution = _TranslationsHelpContributionEn._(_root);
	late final _TranslationsHelpReportEn report = _TranslationsHelpReportEn._(_root);
	late final _TranslationsHelpDeveloperEn developer = _TranslationsHelpDeveloperEn._(_root);
	late final _TranslationsHelpVersionEn version = _TranslationsHelpVersionEn._(_root);
	late final _TranslationsHelpLicenseEn license = _TranslationsHelpLicenseEn._(_root);
}

// Path: home
class _TranslationsHomeEn {
	_TranslationsHomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Home';
	String get totalPeriod => 'Total Period';
	String get oneMonth => '1 Month';
	String get threeMonths => '3 Months';
	String get oneYear => '1 Year';
	late final _TranslationsHomeSynchronizeEn synchronize = _TranslationsHomeSynchronizeEn._(_root);
}

// Path: login
class _TranslationsLoginEn {
	_TranslationsLoginEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Login';
	List<String> get note => [
		'You can separate the account used for logging in and managing.',
		'It is recommended to log in with a sub-account to avoid suspicion of unauthorized operations.',
	];
}

// Path: result
class _TranslationsResultEn {
	_TranslationsResultEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Information';
	late final _TranslationsResultEmptyEn empty = _TranslationsResultEmptyEn._(_root);
	late final _TranslationsResultDetailEn detail = _TranslationsResultDetailEn._(_root);
	late final _TranslationsResultRemoveEn remove = _TranslationsResultRemoveEn._(_root);
	late final _TranslationsResultUserEn user = _TranslationsResultUserEn._(_root);
	late final _TranslationsResultFollowEn follow = _TranslationsResultFollowEn._(_root);
	late final _TranslationsResultFollowerEn follower = _TranslationsResultFollowerEn._(_root);
	late final _TranslationsResultMutualEn mutual = _TranslationsResultMutualEn._(_root);
	late final _TranslationsResultOneSideEn oneSide = _TranslationsResultOneSideEn._(_root);
	late final _TranslationsResultOneSideReverseEn oneSideReverse = _TranslationsResultOneSideReverseEn._(_root);
	late final _TranslationsResultNewFollowEn newFollow = _TranslationsResultNewFollowEn._(_root);
	late final _TranslationsResultNewFollowerEn newFollower = _TranslationsResultNewFollowerEn._(_root);
	late final _TranslationsResultRemoveFollowEn removeFollow = _TranslationsResultRemoveFollowEn._(_root);
	late final _TranslationsResultRemoveFollowerEn removeFollower = _TranslationsResultRemoveFollowerEn._(_root);
	String get detailConfig => 'Detail Configuration';
}

// Path: setting
class _TranslationsSettingEn {
	_TranslationsSettingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Settings';
	late final _TranslationsSettingAccessibilityEn accessibility = _TranslationsSettingAccessibilityEn._(_root);
	late final _TranslationsSettingAccountEn account = _TranslationsSettingAccountEn._(_root);
	late final _TranslationsSettingLogoutEn logout = _TranslationsSettingLogoutEn._(_root);
	late final _TranslationsSettingHelpEn help = _TranslationsSettingHelpEn._(_root);
}

// Path: setup
class _TranslationsSetupEn {
	_TranslationsSetupEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Account';
	List<String> get description => [
		'Enter the account information to be used for synchronization.',
		'You can use multiple accounts by adding them.',
	];
	String get accountId => 'Account ID';
	String get accountHint => 'elonmusk';
	String get save => 'Save';
}

// Path: synchronize
class _TranslationsSynchronizeEn {
	_TranslationsSynchronizeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Synchronize';
	List<String> get notificationTitle => [
		'Synchronizing',
		'Synchronizing.',
		'Synchronizing..',
		'Synchronizing...',
	];
	late final _TranslationsSynchronizeNotificationEn notification = _TranslationsSynchronizeNotificationEn._(_root);
	late final _TranslationsSynchronizeChannelEn channel = _TranslationsSynchronizeChannelEn._(_root);
	late final _TranslationsSynchronizeApiLimitEn apiLimit = _TranslationsSynchronizeApiLimitEn._(_root);
	String get success => 'Synchronization completed successfully';
	late final _TranslationsSynchronizeAlertEn alert = _TranslationsSynchronizeAlertEn._(_root);
	late final _TranslationsSynchronizeWarningEn warning = _TranslationsSynchronizeWarningEn._(_root);
	String get close => 'Close';
	String get cancel => 'Cancel';
	late final _TranslationsSynchronizeFinishEn finish = _TranslationsSynchronizeFinishEn._(_root);
}

// Path: router
class _TranslationsRouterEn {
	_TranslationsRouterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get notice => 'There is an app update available';
	String get check => 'Check';
}

// Path: error
class _TranslationsErrorEn {
	_TranslationsErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String dioExceptionType({required DioExceptionType context}) {
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
	String get unknown => 'Unknown error occurred';
	String get report => 'Report Error';
}

// Path: chart
class _TranslationsChartEn {
	_TranslationsChartEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get noData => 'No data available';
	String get date1 => 'yy/MM/dd H:mm';
	String get date2 => 'MM/dd';
}

// Path: drawer
class _TranslationsDrawerEn {
	_TranslationsDrawerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get close => 'Close';
	String get setting => 'Settings';
}

// Path: help.contribution
class _TranslationsHelpContributionEn {
	_TranslationsHelpContributionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Contribution';
	String get description => 'Contribute to development on Github';
}

// Path: help.report
class _TranslationsHelpReportEn {
	_TranslationsHelpReportEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Report';
	String get description => 'Report bugs or request new features to developers';
}

// Path: help.developer
class _TranslationsHelpDeveloperEn {
	_TranslationsHelpDeveloperEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Developer';
	String get description => 'View developer information';
}

// Path: help.version
class _TranslationsHelpVersionEn {
	_TranslationsHelpVersionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Version';
	String description({required Object version}) => 'Current version: ${version}';
}

// Path: help.license
class _TranslationsHelpLicenseEn {
	_TranslationsHelpLicenseEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'License';
	String get description => 'Display license information';
}

// Path: home.synchronize
class _TranslationsHomeSynchronizeEn {
	_TranslationsHomeSynchronizeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Sync';
	String get description => 'Fetch the latest information from Twitter';
	late final _TranslationsHomeSynchronizeRemoveEn remove = _TranslationsHomeSynchronizeRemoveEn._(_root);
	late final _TranslationsHomeSynchronizePermissionEn permission = _TranslationsHomeSynchronizePermissionEn._(_root);
}

// Path: result.empty
class _TranslationsResultEmptyEn {
	_TranslationsResultEmptyEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'No Sync Data';
	String get description => 'Press the sync button on the home screen to sync';
}

// Path: result.detail
class _TranslationsResultDetailEn {
	_TranslationsResultDetailEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Comparison';
	String get data => 'Data';
	String get time => 'Time';
	String get comparison => 'Comparison';
	String get date => 'yy/MM/dd H:mm';
	String latinChar({required LatinChar context}) {
		switch (context) {
			case LatinChar.A:
				return '𝐴';
			case LatinChar.B:
				return '𝐵';
		}
	}
	String get operator => 'Operator';
	String operatorTypeText({required OperatorType context}) {
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
	String get search => 'Search';
}

// Path: result.remove
class _TranslationsResultRemoveEn {
	_TranslationsResultRemoveEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Remove Sync Data';
	String synchronizeMode({required SynchronizeMode context}) {
		switch (context) {
			case SynchronizeMode.follower:
				return 'Follower';
			case SynchronizeMode.following:
				return 'Following';
		}
	}
	String get all => 'All';
	late final _TranslationsResultRemoveListEn list = _TranslationsResultRemoveListEn._(_root);
}

// Path: result.user
class _TranslationsResultUserEn {
	_TranslationsResultUserEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Differential';
	late final _TranslationsResultUserMenuEn menu = _TranslationsResultUserMenuEn._(_root);
	String searchType({required SearchType context}) {
		switch (context) {
			case SearchType.normal:
				return 'Normal';
			case SearchType.regex:
				return 'Regex';
		}
	}
	String sortBy({required SortBy context}) {
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
	String sortType({required SortType context}) {
		switch (context) {
			case SortType.asc:
				return 'Ascending';
			case SortType.desc:
				return 'Descending';
		}
	}
	String get viewWeb => 'View on Web';
}

// Path: result.follow
class _TranslationsResultFollowEn {
	_TranslationsResultFollowEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Follow';
	String get description => 'Users you are following';
}

// Path: result.follower
class _TranslationsResultFollowerEn {
	_TranslationsResultFollowerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Follower';
	String get description => 'Users who are following you';
}

// Path: result.mutual
class _TranslationsResultMutualEn {
	_TranslationsResultMutualEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Mutual';
	String get description => 'Users you are following and who are following you';
}

// Path: result.oneSide
class _TranslationsResultOneSideEn {
	_TranslationsResultOneSideEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'One-sided';
	String get description => 'Users you are following but who are not following you';
}

// Path: result.oneSideReverse
class _TranslationsResultOneSideReverseEn {
	_TranslationsResultOneSideReverseEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'One-sided Reverse';
	String get description => 'Users who are following you but whom you are not following';
}

// Path: result.newFollow
class _TranslationsResultNewFollowEn {
	_TranslationsResultNewFollowEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'New Follow';
	String get description => 'Users recently followed';
}

// Path: result.newFollower
class _TranslationsResultNewFollowerEn {
	_TranslationsResultNewFollowerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'New Follower';
	String get description => 'Users recently followed you';
}

// Path: result.removeFollow
class _TranslationsResultRemoveFollowEn {
	_TranslationsResultRemoveFollowEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Remove Follow';
	String get description => 'Users recently unfollowed';
}

// Path: result.removeFollower
class _TranslationsResultRemoveFollowerEn {
	_TranslationsResultRemoveFollowerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Remove Follower';
	String get description => 'Users recently unfollowed you';
}

// Path: setting.accessibility
class _TranslationsSettingAccessibilityEn {
	_TranslationsSettingAccessibilityEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Accessibility';
}

// Path: setting.account
class _TranslationsSettingAccountEn {
	_TranslationsSettingAccountEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Account';
}

// Path: setting.logout
class _TranslationsSettingLogoutEn {
	_TranslationsSettingLogoutEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Logout';
	String get confirm => 'Are you sure you want to log out?';
	String get ok => 'OK';
}

// Path: setting.help
class _TranslationsSettingHelpEn {
	_TranslationsSettingHelpEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Help';
}

// Path: synchronize.notification
class _TranslationsSynchronizeNotificationEn {
	_TranslationsSynchronizeNotificationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get text => 'Sync is in progress';
	String text1({required Object count, required Object total}) => 'Following: ${count}/${total}';
	String text2({required Object count, required Object total}) => 'Followers: ${count}/${total}';
}

// Path: synchronize.channel
class _TranslationsSynchronizeChannelEn {
	_TranslationsSynchronizeChannelEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Twitter Sync Channel';
	String get description => 'Channel for fetching Twitter information';
}

// Path: synchronize.apiLimit
class _TranslationsSynchronizeApiLimitEn {
	_TranslationsSynchronizeApiLimitEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'API Limit';
	String description({required Object sec}) => 'API limit reached. Retrying in ${sec} seconds';
}

// Path: synchronize.alert
class _TranslationsSynchronizeAlertEn {
	_TranslationsSynchronizeAlertEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Synchronization in progress.';
	String get description => 'The app will continue syncing in the background when you switch.';
}

// Path: synchronize.warning
class _TranslationsSynchronizeWarningEn {
	_TranslationsSynchronizeWarningEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Synchronization in progress.';
	String get description => 'Do not switch apps or turn off the screen.';
}

// Path: synchronize.finish
class _TranslationsSynchronizeFinishEn {
	_TranslationsSynchronizeFinishEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Sync Complete';
	String get description => 'Sync has been completed';
}

// Path: home.synchronize.remove
class _TranslationsHomeSynchronizeRemoveEn {
	_TranslationsHomeSynchronizeRemoveEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Remove Sync';
	String get description => 'Remove synchronization';
}

// Path: home.synchronize.permission
class _TranslationsHomeSynchronizePermissionEn {
	_TranslationsHomeSynchronizePermissionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Sync Permission';
	String get description => 'Allow synchronization';
	String get success => 'Permission granted';
	String get failure => 'Permission not granted';
}

// Path: result.remove.list
class _TranslationsResultRemoveListEn {
	_TranslationsResultRemoveListEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get date => 'yy/MM/dd H:mm';
	String description({required Object time, required Object count}) => 'Synced at ${time} / ${count} items';
}

// Path: result.user.menu
class _TranslationsResultUserMenuEn {
	_TranslationsResultUserMenuEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get searchInput => 'Search';
	String get searchType => 'Search Type';
	String get sortBy => 'Sort By';
	String get sortType => 'Sort Type';
}

// Path: <root>
class _TranslationsJa extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsJa.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	@override late final _TranslationsJa _root = this; // ignore: unused_field

	// Translations
	@override String get language => '日本語';
	@override late final _TranslationsAccessibilityJa accessibility = _TranslationsAccessibilityJa._(_root);
	@override late final _TranslationsHelpJa help = _TranslationsHelpJa._(_root);
	@override late final _TranslationsHomeJa home = _TranslationsHomeJa._(_root);
	@override late final _TranslationsLoginJa login = _TranslationsLoginJa._(_root);
	@override late final _TranslationsResultJa result = _TranslationsResultJa._(_root);
	@override late final _TranslationsSettingJa setting = _TranslationsSettingJa._(_root);
	@override late final _TranslationsSetupJa setup = _TranslationsSetupJa._(_root);
	@override late final _TranslationsSynchronizeJa synchronize = _TranslationsSynchronizeJa._(_root);
	@override late final _TranslationsRouterJa router = _TranslationsRouterJa._(_root);
	@override late final _TranslationsErrorJa error = _TranslationsErrorJa._(_root);
	@override late final _TranslationsChartJa chart = _TranslationsChartJa._(_root);
	@override late final _TranslationsDrawerJa drawer = _TranslationsDrawerJa._(_root);
}

// Path: accessibility
class _TranslationsAccessibilityJa extends _TranslationsAccessibilityEn {
	_TranslationsAccessibilityJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

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

// Path: help
class _TranslationsHelpJa extends _TranslationsHelpEn {
	_TranslationsHelpJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ヘルプ';
	@override late final _TranslationsHelpContributionJa contribution = _TranslationsHelpContributionJa._(_root);
	@override late final _TranslationsHelpReportJa report = _TranslationsHelpReportJa._(_root);
	@override late final _TranslationsHelpDeveloperJa developer = _TranslationsHelpDeveloperJa._(_root);
	@override late final _TranslationsHelpVersionJa version = _TranslationsHelpVersionJa._(_root);
	@override late final _TranslationsHelpLicenseJa license = _TranslationsHelpLicenseJa._(_root);
}

// Path: home
class _TranslationsHomeJa extends _TranslationsHomeEn {
	_TranslationsHomeJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ホーム';
	@override String get totalPeriod => '全期間';
	@override String get oneMonth => '1ヶ月';
	@override String get threeMonths => '3ヶ月';
	@override String get oneYear => '1年';
	@override late final _TranslationsHomeSynchronizeJa synchronize = _TranslationsHomeSynchronizeJa._(_root);
}

// Path: login
class _TranslationsLoginJa extends _TranslationsLoginEn {
	_TranslationsLoginJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ログイン';
	@override List<String> get note => [
		'ログインするアカウントと管理するアカウントは分けることが出来ます。',
		'不正な操作を疑われる可能性が高いため、サブアカウントでログインすることを推奨します。',
	];
}

// Path: result
class _TranslationsResultJa extends _TranslationsResultEn {
	_TranslationsResultJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '情報';
	@override late final _TranslationsResultEmptyJa empty = _TranslationsResultEmptyJa._(_root);
	@override late final _TranslationsResultDetailJa detail = _TranslationsResultDetailJa._(_root);
	@override late final _TranslationsResultRemoveJa remove = _TranslationsResultRemoveJa._(_root);
	@override late final _TranslationsResultUserJa user = _TranslationsResultUserJa._(_root);
	@override late final _TranslationsResultFollowJa follow = _TranslationsResultFollowJa._(_root);
	@override late final _TranslationsResultFollowerJa follower = _TranslationsResultFollowerJa._(_root);
	@override late final _TranslationsResultMutualJa mutual = _TranslationsResultMutualJa._(_root);
	@override late final _TranslationsResultOneSideJa oneSide = _TranslationsResultOneSideJa._(_root);
	@override late final _TranslationsResultOneSideReverseJa oneSideReverse = _TranslationsResultOneSideReverseJa._(_root);
	@override late final _TranslationsResultNewFollowJa newFollow = _TranslationsResultNewFollowJa._(_root);
	@override late final _TranslationsResultNewFollowerJa newFollower = _TranslationsResultNewFollowerJa._(_root);
	@override late final _TranslationsResultRemoveFollowJa removeFollow = _TranslationsResultRemoveFollowJa._(_root);
	@override late final _TranslationsResultRemoveFollowerJa removeFollower = _TranslationsResultRemoveFollowerJa._(_root);
	@override String get detailConfig => '詳細設定';
}

// Path: setting
class _TranslationsSettingJa extends _TranslationsSettingEn {
	_TranslationsSettingJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '設定';
	@override late final _TranslationsSettingAccessibilityJa accessibility = _TranslationsSettingAccessibilityJa._(_root);
	@override late final _TranslationsSettingAccountJa account = _TranslationsSettingAccountJa._(_root);
	@override late final _TranslationsSettingLogoutJa logout = _TranslationsSettingLogoutJa._(_root);
	@override late final _TranslationsSettingHelpJa help = _TranslationsSettingHelpJa._(_root);
}

// Path: setup
class _TranslationsSetupJa extends _TranslationsSetupEn {
	_TranslationsSetupJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'アカウント';
	@override List<String> get description => [
		'実際に管理するTwitterのアカウントのIDを入力してください',
		'ログインしたアカウントと異なるアカウントを入力することもできます',
	];
	@override String get accountId => 'アカウントID';
	@override String get accountHint => 'elonmusk';
	@override String get save => '保存';
}

// Path: synchronize
class _TranslationsSynchronizeJa extends _TranslationsSynchronizeEn {
	_TranslationsSynchronizeJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '同期';
	@override List<String> get notificationTitle => [
		'同期中',
		'同期中.',
		'同期中..',
		'同期中...',
	];
	@override late final _TranslationsSynchronizeNotificationJa notification = _TranslationsSynchronizeNotificationJa._(_root);
	@override late final _TranslationsSynchronizeChannelJa channel = _TranslationsSynchronizeChannelJa._(_root);
	@override late final _TranslationsSynchronizeApiLimitJa apiLimit = _TranslationsSynchronizeApiLimitJa._(_root);
	@override String get success => '同期が正常に完了しました';
	@override late final _TranslationsSynchronizeAlertJa alert = _TranslationsSynchronizeAlertJa._(_root);
	@override late final _TranslationsSynchronizeWarningJa warning = _TranslationsSynchronizeWarningJa._(_root);
	@override String get close => '閉じる';
	@override String get cancel => 'キャンセル';
	@override late final _TranslationsSynchronizeFinishJa finish = _TranslationsSynchronizeFinishJa._(_root);
}

// Path: router
class _TranslationsRouterJa extends _TranslationsRouterEn {
	_TranslationsRouterJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get notice => 'アプリのアップデートがあります';
	@override String get check => '確認';
}

// Path: error
class _TranslationsErrorJa extends _TranslationsErrorEn {
	_TranslationsErrorJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String dioExceptionType({required DioExceptionType context}) {
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
	@override String get unknown => '不明なエラーが発生しました';
	@override String get report => 'エラーを報告する';
}

// Path: chart
class _TranslationsChartJa extends _TranslationsChartEn {
	_TranslationsChartJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get noData => 'データがありません';
	@override String get date1 => 'yy/MM/dd H:mm';
	@override String get date2 => 'MM/dd';
}

// Path: drawer
class _TranslationsDrawerJa extends _TranslationsDrawerEn {
	_TranslationsDrawerJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get close => '閉じる';
	@override String get setting => '設定';
}

// Path: help.contribution
class _TranslationsHelpContributionJa extends _TranslationsHelpContributionEn {
	_TranslationsHelpContributionJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '貢献';
	@override String get description => 'Githubでの開発に貢献する';
}

// Path: help.report
class _TranslationsHelpReportJa extends _TranslationsHelpReportEn {
	_TranslationsHelpReportJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '報告';
	@override String get description => '開発者にバグの報告や新機能のリクエストする';
}

// Path: help.developer
class _TranslationsHelpDeveloperJa extends _TranslationsHelpDeveloperEn {
	_TranslationsHelpDeveloperJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '開発者';
	@override String get description => '開発者の情報を表示する';
}

// Path: help.version
class _TranslationsHelpVersionJa extends _TranslationsHelpVersionEn {
	_TranslationsHelpVersionJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'バージョン';
	@override String description({required Object version}) => '現在のバージョン: ${version}';
}

// Path: help.license
class _TranslationsHelpLicenseJa extends _TranslationsHelpLicenseEn {
	_TranslationsHelpLicenseJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ライセンス';
	@override String get description => 'ライセンス情報を表示する';
}

// Path: home.synchronize
class _TranslationsHomeSynchronizeJa extends _TranslationsHomeSynchronizeEn {
	_TranslationsHomeSynchronizeJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '同期';
	@override String get description => '最新の情報をTwitterから取得します';
	@override late final _TranslationsHomeSynchronizeRemoveJa remove = _TranslationsHomeSynchronizeRemoveJa._(_root);
	@override late final _TranslationsHomeSynchronizePermissionJa permission = _TranslationsHomeSynchronizePermissionJa._(_root);
}

// Path: result.empty
class _TranslationsResultEmptyJa extends _TranslationsResultEmptyEn {
	_TranslationsResultEmptyJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '同期データがありません';
	@override String get description => 'ホームの同期ボタンを押して同期してください';
}

// Path: result.detail
class _TranslationsResultDetailJa extends _TranslationsResultDetailEn {
	_TranslationsResultDetailJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '比較';
	@override String get data => 'データ';
	@override String get time => '時間';
	@override String get comparison => '比較';
	@override String get date => 'yy/MM/dd H:mm';
	@override String latinChar({required LatinChar context}) {
		switch (context) {
			case LatinChar.A:
				return '𝐴';
			case LatinChar.B:
				return '𝐵';
		}
	}
	@override String get operator => '演算子';
	@override String operatorTypeText({required OperatorType context}) {
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
	@override String get search => '検索';
}

// Path: result.remove
class _TranslationsResultRemoveJa extends _TranslationsResultRemoveEn {
	_TranslationsResultRemoveJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '同期データ削除';
	@override String synchronizeMode({required SynchronizeMode context}) {
		switch (context) {
			case SynchronizeMode.follower:
				return 'フォロワー';
			case SynchronizeMode.following:
				return 'フォロー中';
		}
	}
	@override String get all => '全て';
	@override late final _TranslationsResultRemoveListJa list = _TranslationsResultRemoveListJa._(_root);
}

// Path: result.user
class _TranslationsResultUserJa extends _TranslationsResultUserEn {
	_TranslationsResultUserJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '差分';
	@override late final _TranslationsResultUserMenuJa menu = _TranslationsResultUserMenuJa._(_root);
	@override String searchType({required SearchType context}) {
		switch (context) {
			case SearchType.normal:
				return '通常';
			case SearchType.regex:
				return '正規表現';
		}
	}
	@override String sortBy({required SortBy context}) {
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
	@override String sortType({required SortType context}) {
		switch (context) {
			case SortType.asc:
				return '昇順';
			case SortType.desc:
				return '降順';
		}
	}
	@override String get viewWeb => 'Webで表示';
}

// Path: result.follow
class _TranslationsResultFollowJa extends _TranslationsResultFollowEn {
	_TranslationsResultFollowJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'フォロー';
	@override String get description => 'フォローしているユーザー';
}

// Path: result.follower
class _TranslationsResultFollowerJa extends _TranslationsResultFollowerEn {
	_TranslationsResultFollowerJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'フォロワー';
	@override String get description => 'フォローされているユーザー';
}

// Path: result.mutual
class _TranslationsResultMutualJa extends _TranslationsResultMutualEn {
	_TranslationsResultMutualJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '相互フォロー';
	@override String get description => 'フォローしていてフォローされているユーザー';
}

// Path: result.oneSide
class _TranslationsResultOneSideJa extends _TranslationsResultOneSideEn {
	_TranslationsResultOneSideJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '片思い';
	@override String get description => 'フォローしていてフォローされていないユーザー';
}

// Path: result.oneSideReverse
class _TranslationsResultOneSideReverseJa extends _TranslationsResultOneSideReverseEn {
	_TranslationsResultOneSideReverseJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '片思われ';
	@override String get description => 'フォローしていなくてフォローされているユーザー';
}

// Path: result.newFollow
class _TranslationsResultNewFollowJa extends _TranslationsResultNewFollowEn {
	_TranslationsResultNewFollowJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '新規フォロー';
	@override String get description => '最近フォローしたユーザー';
}

// Path: result.newFollower
class _TranslationsResultNewFollowerJa extends _TranslationsResultNewFollowerEn {
	_TranslationsResultNewFollowerJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '新規フォロワー';
	@override String get description => '最近フォローされたユーザー';
}

// Path: result.removeFollow
class _TranslationsResultRemoveFollowJa extends _TranslationsResultRemoveFollowEn {
	_TranslationsResultRemoveFollowJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'フォロー解除';
	@override String get description => '最近フォロー解除したユーザー';
}

// Path: result.removeFollower
class _TranslationsResultRemoveFollowerJa extends _TranslationsResultRemoveFollowerEn {
	_TranslationsResultRemoveFollowerJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'フォロワー解除';
	@override String get description => '最近フォロー解除されたユーザー';
}

// Path: setting.accessibility
class _TranslationsSettingAccessibilityJa extends _TranslationsSettingAccessibilityEn {
	_TranslationsSettingAccessibilityJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'アクセシビリティ';
}

// Path: setting.account
class _TranslationsSettingAccountJa extends _TranslationsSettingAccountEn {
	_TranslationsSettingAccountJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'アカウント';
}

// Path: setting.logout
class _TranslationsSettingLogoutJa extends _TranslationsSettingLogoutEn {
	_TranslationsSettingLogoutJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ログアウト';
	@override String get confirm => 'ログアウトしますか？';
	@override String get ok => '決定';
}

// Path: setting.help
class _TranslationsSettingHelpJa extends _TranslationsSettingHelpEn {
	_TranslationsSettingHelpJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ヘルプ';
}

// Path: synchronize.notification
class _TranslationsSynchronizeNotificationJa extends _TranslationsSynchronizeNotificationEn {
	_TranslationsSynchronizeNotificationJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get text => '同期の開始中です';
	@override String text1({required Object count, required Object total}) => 'フォロー: ${count}/${total}';
	@override String text2({required Object count, required Object total}) => 'フォロワー: ${count}/${total}';
}

// Path: synchronize.channel
class _TranslationsSynchronizeChannelJa extends _TranslationsSynchronizeChannelEn {
	_TranslationsSynchronizeChannelJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get name => 'Twitter同期チャンネル';
	@override String get description => 'Twitterの情報を取得するためのチャンネル';
}

// Path: synchronize.apiLimit
class _TranslationsSynchronizeApiLimitJa extends _TranslationsSynchronizeApiLimitEn {
	_TranslationsSynchronizeApiLimitJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'API制限';
	@override String description({required Object sec}) => 'APIリミットに到達しました ${sec} 秒後に再試行します';
}

// Path: synchronize.alert
class _TranslationsSynchronizeAlertJa extends _TranslationsSynchronizeAlertEn {
	_TranslationsSynchronizeAlertJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '同期中です';
	@override String get description => 'アプリを切り替えるとバックグラウンドで同期を続行します';
}

// Path: synchronize.warning
class _TranslationsSynchronizeWarningJa extends _TranslationsSynchronizeWarningEn {
	_TranslationsSynchronizeWarningJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '同期中です';
	@override String get description => 'アプリを切り替えたり画面を消灯しないでください';
}

// Path: synchronize.finish
class _TranslationsSynchronizeFinishJa extends _TranslationsSynchronizeFinishEn {
	_TranslationsSynchronizeFinishJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '同期完了';
	@override String get description => '同期が完了しました';
}

// Path: home.synchronize.remove
class _TranslationsHomeSynchronizeRemoveJa extends _TranslationsHomeSynchronizeRemoveEn {
	_TranslationsHomeSynchronizeRemoveJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '同期の削除';
	@override String get description => '同期を削除します';
}

// Path: home.synchronize.permission
class _TranslationsHomeSynchronizePermissionJa extends _TranslationsHomeSynchronizePermissionEn {
	_TranslationsHomeSynchronizePermissionJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '権限の許可';
	@override String get description => '権限を許可します';
	@override String get success => '権限が付与されています';
	@override String get failure => '権限が付与されていません';
}

// Path: result.remove.list
class _TranslationsResultRemoveListJa extends _TranslationsResultRemoveListEn {
	_TranslationsResultRemoveListJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get date => 'yy/MM/dd H:mm';
	@override String description({required Object time, required Object count}) => '${time} に同期 / ${count} 件';
}

// Path: result.user.menu
class _TranslationsResultUserMenuJa extends _TranslationsResultUserMenuEn {
	_TranslationsResultUserMenuJa._(_TranslationsJa root) : this._root = root, super._(root);

	@override final _TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get searchInput => '検索';
	@override String get searchType => '検索種類';
	@override String get sortBy => '並び替え基準';
	@override String get sortType => '並び替え種類';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
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
			case 'setup.description.0': return 'Enter the account information to be used for synchronization.';
			case 'setup.description.1': return 'You can use multiple accounts by adding them.';
			case 'setup.accountId': return 'Account ID';
			case 'setup.accountHint': return 'elonmusk';
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

extension on _TranslationsJa {
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
			case 'home.synchronize.remove.title': return '同期の削除';
			case 'home.synchronize.remove.description': return '同期を削除します';
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
			case 'setup.description.0': return '実際に管理するTwitterのアカウントのIDを入力してください';
			case 'setup.description.1': return 'ログインしたアカウントと異なるアカウントを入力することもできます';
			case 'setup.accountId': return 'アカウントID';
			case 'setup.accountHint': return 'elonmusk';
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
