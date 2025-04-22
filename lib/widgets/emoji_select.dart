import 'package:flutter/material.dart';

class EmojiSelector extends StatefulWidget {
  final Function(String) onEmojiSelected;

  const EmojiSelector({super.key, required this.onEmojiSelected});
  @override
  _EmojiSelectorState createState() => _EmojiSelectorState();
}

class _EmojiSelectorState extends State<EmojiSelector> {
  final List<String> emojis = ['😡', '😞', '😐', '🙂', '😄'];
  String selectedEmoji = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:
          emojis.map((emoji) {
            final isSelected = selectedEmoji == emoji;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedEmoji = emoji;
                });
                widget.onEmojiSelected(emoji);
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      isSelected
                          ? const Color(0xFF5A4FD3).withOpacity(0.3)
                          : Colors.transparent,
                ),
                child: Text(emoji, style: TextStyle(fontSize: 30)),
              ),
            );
          }).toList(),
    );
  }
}
