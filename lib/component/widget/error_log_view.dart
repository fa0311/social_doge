import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:social_doge/constant/config.dart';
import 'package:url_launcher/url_launcher.dart';

class ErrorData {
  const ErrorData(
    this.title, {
    this.message,
    this.isReport = false,
  });

  factory ErrorData.fromObject(AppLocalizations localizations, Object error) {
    return switch (error) {
      final DioException e => switch (e.type) {
          DioExceptionType.cancel => ErrorData(localizations.errorCancelMessage),
          DioExceptionType.receiveTimeout => ErrorData(localizations.errorReceiveTimeoutMessage),
          DioExceptionType.sendTimeout => ErrorData(localizations.errorSendTimeoutMessage),
          DioExceptionType.unknown => ErrorData(localizations.errorUnknownMessage),
          DioExceptionType.connectionTimeout => ErrorData(localizations.errorConnectionTimeoutMessage),
          DioExceptionType.badCertificate => ErrorData(localizations.errorBadCertificateMessage),
          DioExceptionType.badResponse => ErrorData(localizations.errorBadResponseMessage),
          DioExceptionType.connectionError => ErrorData(localizations.errorConnectionErrorMessage),
        },
      _ => ErrorData(localizations.errorUnknownMessage, isReport: true),
    };
  }

  final String title;
  final String? message;
  final bool isReport;
}

class ErrorLogView extends StatelessWidget {
  const ErrorLogView(
    this.error,
    this.stackTrace, {
    super.key,
  });

  final Object error;

  final StackTrace? stackTrace;

  @override
  Widget build(BuildContext context) {
    final errorData = ErrorData.fromObject(AppLocalizations.of(context)!, error);

    return Center(
      child: InkWell(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline),
            Text(errorData.title),
          ],
        ),
        onTap: () {
          showDialog<void>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(errorData.message ?? errorData.title),
                content: SingleChildScrollView(
                  child: SelectableText(
                    stackTrace.toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                actions: [
                  if (errorData.isReport)
                    TextButton(
                      onPressed: () async {
                        final markdown = [
                          '```log',
                          'Error: $error',
                          '```',
                          '```log',
                          'StackTrace: $stackTrace',
                          '```',
                        ].join('\n');

                        final uri = Config.report.replace(
                          queryParameters: {
                            'title': error.toString(),
                            'body': markdown,
                          },
                        );
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri, mode: LaunchMode.externalApplication);
                        }
                      },
                      child: Text(AppLocalizations.of(context)!.errorReportButton),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
