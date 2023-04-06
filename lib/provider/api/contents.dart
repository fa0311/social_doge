// Dart imports:



/*
final timeLineProvider = FutureProvider.family<TimelineAddEntries, TimeLineArgs>((ref, args) async {
  if (kDebugMode) {
    print("Request API: ${args.toString()}");
  }
  final session = await ref.watch(loginSessionProvider.future);
  return (await session.getTimeLine(cursor: args.cursor)).timelineAddEntries;
});
*/



/*
class ContentListNotifier extends StateNotifier<List<Content>> {
  ContentListNotifier() : super([]);
  void refresh() {
    state = [];
  }

  void set(List<Content> entries) {
    state = [...entries];
  }

  void add(List<Content> entries) {
    state = [...state, ...entries];
  }

  void insertFirst(List<Content> entries) {
    state = [...entries, ...state];
  }
}
*/