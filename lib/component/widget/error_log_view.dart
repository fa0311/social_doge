import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:social_doge/constant/config.dart';
import 'package:social_doge/i18n/translations.g.dart';
import 'package:url_launcher/url_launcher.dart';

class ErrorData {
  const ErrorData(
    this.title, {
    this.message,
    this.isReport = false,
  });

  factory ErrorData.fromObject(BuildContext context, Object error) {
    final t = Translations.of(context).error;
    return switch (error) {
      final DioException e => ErrorData(t.dioExceptionType(context: e.type)),
      _ => ErrorData(t.unknown, isReport: true),
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
    final t = Translations.of(context).error;
    final errorData = ErrorData.fromObject(context, error);

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
                      child: Text(t.report),
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
