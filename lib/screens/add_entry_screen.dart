import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mood_journal/models/mood_entry.dart';
import 'package:mood_journal/providers/mood_provider.dart';
import 'package:mood_journal/widgets/emoji_select.dart';
import 'package:mood_journal/widgets/logmood_button.dart';
import 'package:mood_journal/widgets/mood_select.dart';
import 'package:mood_journal/widgets/textform.dart';
import 'package:provider/provider.dart';

class AddEntryScreen extends StatefulWidget {
  AddEntryScreen({super.key});

  @override
  State<AddEntryScreen> createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddEntryScreen> {
  final TextEditingController noteController = TextEditingController();
  String selectedEmojy = '';
  List<String> selectedTags = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F0F1A),
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.white.withOpacity(0.1), // soft underline color
            height: 1.0,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Mood Journal",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Color(0xFF0F0F1A),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 15),
                child: Column(
                  children: [
                    Text(
                      'How Are You Feeling ?',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    EmojiSelector(
                      onEmojiSelected: (emoji) {
                        setState(() {
                          selectedEmojy = emoji;
                        });
                        print(emoji);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Whats affecting your mood?',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),

              MoodTagsSelector(
                tags: [
                  'Work',
                  'Exercise',
                  'Family',
                  'Sleep',
                  'Drink',
                  'Food',
                  'Education',
                  'Weather',
                  'Music',
                  'Travel',
                  'Health',
                  'Hobbies',
                  'Finances',
                  'Relationships',
                ],
                onSelectionChanged: (tags) {
                  // Store selected tags in a variable or pass to providers
                  setState(() {
                    selectedTags = tags;
                  });
                  print(tags);
                },
              ),

              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 110),
                child: Text(
                  '''Let's write about it''',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 10),
              JournalTextField(
                controller: noteController,
                onChanged: (value) {
                  setState(() {
                    noteController.text = value;
                  });
                  print(value);
                },
              ),
              SizedBox(height: 10),

              MoodButton(
                onPressed: () {
                  _submit(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit(BuildContext context) {
    if (selectedEmojy == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please select an emoji to represent your mood!"),
        ),
      );
      return;
    }

    final newEntry = MoodEntry(
      emoji: selectedEmojy,
      tags: selectedTags,
      note: noteController.text,
      dateTime: DateTime.now(),
    );
    print(newEntry);
    Provider.of<MoodProvider>(context, listen: false).addNewEntry(newEntry);

    Navigator.pop(context);
  }
}
