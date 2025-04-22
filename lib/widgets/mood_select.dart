import 'package:flutter/material.dart';

class MoodTagsSelector extends StatefulWidget {
  final List<String> tags;
  final Function(List<String>) onSelectionChanged;

  const MoodTagsSelector({
    required this.tags,
    required this.onSelectionChanged,
  });

  @override
  State<MoodTagsSelector> createState() => _MoodTagsSelectorState();
}

class _MoodTagsSelectorState extends State<MoodTagsSelector> {
  List<String> selectedTags = [];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children:
          widget.tags.map((tag) {
            final isSelected = selectedTags.contains(tag);
            return FilterChip(
              label: Text(tag),
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
              selectedColor: Colors.deepPurple,
              backgroundColor: Colors.transparent,
              shape: StadiumBorder(
                side: BorderSide(
                  color: isSelected ? Colors.deepPurple : Colors.white24,
                ),
              ),
              selected: isSelected,
              onSelected: (bool selected) {
                setState(() {
                  if (selected) {
                    selectedTags.add(tag);
                  } else {
                    selectedTags.remove(tag);
                  }
                  widget.onSelectionChanged(selectedTags);
                });
              },
            );
          }).toList(),
    );
  }
}
