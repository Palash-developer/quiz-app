import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScoreSummary extends StatelessWidget {
  const ScoreSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...summaryData.map(
          (e) => Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(((e["question_index"] as int) + 1).toString()),
                        const SizedBox(width: 5),
                        Text(e["question"] as String),
                        const SizedBox(height: 5),
                      ],
                    ),
                    const Text("Correct Answer : "),
                    Text(e["correct_answer"] as String),
                    const SizedBox(height: 5),
                    const Text("Your selected Answer : "),
                    Text(e["user_answer"] as String),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
