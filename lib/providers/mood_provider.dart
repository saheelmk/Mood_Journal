import 'package:flutter/material.dart';
import 'package:mood_journal/models/mood_entry.dart';

class MoodProvider with ChangeNotifier {
  // create a private list of MoodEntry
  final List<MoodEntry> _moodEntry = [];
  List<MoodEntry> get moodEntry => _moodEntry;

  // for adding mood entries
  void addNewEntry(MoodEntry newEntry) {
    _moodEntry.add(newEntry);
    notifyListeners();
  }

  // for removing mood entries
  void removeEntry(int index) {
    _moodEntry.removeAt(index);
    notifyListeners();
  }
}
