import 'package:flutter/material.dart';
import 'package:mood_journal/providers/mood_provider.dart';
import 'package:mood_journal/screens/add_entry_screen.dart';
import 'package:mood_journal/widgets/mood_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F0F1A),
      appBar: AppBar(
        backgroundColor: Color(0xFF0F0F1A),
        centerTitle: true,
        title: Text(
          'Your Mood History',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(height: 1, color: Colors.white.withOpacity(0.1)),
        ),
      ),
      body: Consumer<MoodProvider>(
        builder:
            (ctx, moodProvider, child) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: moodProvider.moodEntry.length, // Temp static count
                itemBuilder: (context, index) {
                  final mood = moodProvider.moodEntry[index];
                  return Dismissible(
                    key: ValueKey(mood.id),
                    onDismissed: (DismissDirection direction) {
                      moodProvider.removeEntry(index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: MoodCard(
                        emoji: mood.emoji,
                        tags: mood.tags,
                        note: mood.note,
                        dateTime:
                            mood.dateTime, // Replace with your dynamic date
                      ),
                    ),
                  );
                },
              ),
            ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.purpleAccent.withOpacity(0.3),
              blurRadius: 20,
              spreadRadius: 1,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AddEntryScreen()),
            );
          },
          backgroundColor: Color(0xFF3E3E55),
          elevation: 6,
          icon: Icon(
            Icons.emoji_emotions, // mood-friendly icon 😄
            color: Colors.white,
            size: 26,
          ),
          label: Text(
            'Add Mood',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
