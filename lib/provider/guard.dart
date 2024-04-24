import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guard.g.dart';

@Riverpod(keepAlive: true)
class LastGuard extends _$LastGuard {
  @override
  DateTime build(int hash) {
    return DateTime(0);
  }

  void refresh() {
    state = DateTime.now();
  }

  bool isExpired(Duration duration) {
    return DateTime.now().difference(state) > duration;
  }
}
