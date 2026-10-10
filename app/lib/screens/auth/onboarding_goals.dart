import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/app_button.dart';
import '../../widgets/onboarding_header.dart';

class OnboardingGoals extends StatefulWidget {
  const OnboardingGoals({super.key});

  @override
  State<OnboardingGoals> createState() => _OnboardingGoalsState();
}

class _OnboardingGoalsState extends State<OnboardingGoals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBF7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 22, 24, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OnboardingHeader(
                title: 'Set a gentle goal',
                subtitle: 'Step 2 of 3',
                actionText: '2/3',
                onActionTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 16),
              WeeklyGoal(
                hobby: 'Photography',
                onGoalChanged: (goal) {
                  debugPrint('Weekly goal: $goal');
                },
              ),
              const SizedBox(height: 16),
              const PreferredTime(),
              const SizedBox(height: 16),
              StartFocusButton(
                text: 'Continue',
                onPressed: () {
                  Navigator.pushNamed(context, '/onboarding_permission');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WeeklyGoal extends StatefulWidget {
  final String hobby;
  final ValueChanged<String>? onGoalChanged;

  const WeeklyGoal({super.key, this.hobby = 'Photography', this.onGoalChanged});

  @override
  State<WeeklyGoal> createState() => _WeeklyGoalState();
}

class _WeeklyGoalState extends State<WeeklyGoal> {
  String selectedGoal = '1h';
  final TextEditingController customController = TextEditingController();

  final List<String> presets = ['1h', '3h', '5h', 'Custom'];

  @override
  void dispose() {
    customController.dispose();
    super.dispose();
  }

  void selectGoal(String goal) {
    setState(() {
      selectedGoal = goal;
    });

    if (goal != 'Custom') {
      widget.onGoalChanged?.call(goal);
    } else if (customController.text.isNotEmpty) {
      widget.onGoalChanged?.call('${customController.text}h');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      height: 120,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE9CE),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.hobby,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 1.3,
              color: Color(0xFF131E1C),
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            'How much time feels good this week?',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              fontWeight: FontWeight.w400,
              height: 1.3,
              color: Color(0xFF5A6D67),
            ),
          ),

          const SizedBox(height: 8),

          Row(
            children: presets.map((goal) {
              final isSelected = selectedGoal == goal;

              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap: () => selectGoal(goal),
                  child: Container(
                    height: 34,
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFFD6F2E5)
                          : const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: goal == 'Custom' && isSelected
                        ? SizedBox(
                            width: 46,
                            child: TextField(
                              controller: customController,
                              autofocus: true,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF5A6D67),
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Hours',
                                hintStyle: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  color: Color(0xFF5A6D67),
                                ),
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  widget.onGoalChanged?.call('${value}h');
                                }
                              },
                            ),
                          )
                        : Text(
                            goal,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              height: 1.3,
                              color: Color(0xFF5A6D67),
                            ),
                          ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class PreferredTime extends StatelessWidget {
  final String time;
  final String subtitle;

  const PreferredTime({
    super.key,
    this.time = 'Saturday · 17:00–19:00',
    this.subtitle = 'You can adjust this anytime.',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      height: 70,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              height: 1.3,
              letterSpacing: 0,
              color: Color(0xFF131E1C),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 1.3,
              letterSpacing: 0,
              color: Color(0xFF5A6D67),
            ),
          ),
        ],
      ),
    );
  }
}
