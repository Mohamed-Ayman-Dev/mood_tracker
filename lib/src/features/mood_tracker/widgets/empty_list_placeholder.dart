import 'package:flutter/material.dart';

class EmptyTimeline extends StatelessWidget {
  const EmptyTimeline({super.key});

  @override
  Widget build(BuildContext context) => Container(
    height: 120,
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
    ),
    child: const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 8),
          Text(
            'Log your first mood above!',
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
        ],
      ),
    ),
  );
}
