import 'package:flutter/material.dart';

class MoodCard extends StatelessWidget {
  final String emoji;
  final List<String> tags;
  final String note;
  final DateTime dateTime;

  const MoodCard({
    required this.emoji,
    required this.tags,
    required this.note,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Emoji + Time Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(emoji, style: TextStyle(fontSize: 32)),
              Text(
                '${dateTime.month}/${dateTime.day} ${dateTime.hour}:${dateTime.minute} ${dateTime.hour > 12 ? 'PM' : 'AM'}',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),

          // Tags
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: tags.map((tag) => _buildChip(tag)).toList(),
          ),
          SizedBox(height: 12),

          // Note Preview
          Text(
            note,
            style: TextStyle(color: Colors.white, fontSize: 16, height: 1.4),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Color(0xFF2F2F42),
      labelStyle: TextStyle(color: Colors.white),
      shape: StadiumBorder(),
    );
  }
}
