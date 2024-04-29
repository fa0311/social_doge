import 'package:flutter/material.dart';

Future<T?> showModalBottomSheetStatelessWidget<T>({
  required BuildContext context,
  required Widget Function() builder,
}) {
  assert(debugCheckHasMediaQuery(context));
  assert(debugCheckHasMaterialLocalizations(context));

  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (BuildContext context) => builder(),
  );
}
