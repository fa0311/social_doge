import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guard.g.dart';

enum GuardType {
  loginGuard,
  updateGuard;
}

@Riverpod(keepAlive: true)
class LastGuard extends _$LastGuard {
  @override
  DateTime build(GuardType type) {
    return DateTime(0);
  }

  void refresh() {
    state = DateTime.now();
  }

  void reset() {
    state = DateTime(0);
  }

  bool isExpired(Duration duration) {
    return DateTime.now().difference(state) > duration;
  }
}
