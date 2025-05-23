class MoodEntry {
  final int id;
  final String emoji;
  final List<String> tags;
  final String note;
  final DateTime dateTime;

  MoodEntry({
    required this.emoji,
    required this.tags,
    required this.note,
    required this.dateTime,
    required this.id,
  });
}
