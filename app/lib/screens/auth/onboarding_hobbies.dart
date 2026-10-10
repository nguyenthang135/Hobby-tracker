import 'package:flutter/material.dart';

import '../../widgets/app_button.dart';
import '../../widgets/onboarding_header.dart';

class OnboardingHobbies extends StatefulWidget {
  const OnboardingHobbies({super.key});

  @override
  State<OnboardingHobbies> createState() => _OnboardingHobbiesState();
}

class _OnboardingHobbiesState extends State<OnboardingHobbies> {
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
                title: 'Pick hobbies',
                subtitle: 'Step 1 of 3',
                actionText: '1/3',
                onActionTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 16),
              Text(
                'Pick at least one hobby to begin.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                  letterSpacing: 0,
                  color: Color(0xFF131E1C),
                ),
              ),
              const SizedBox(height: 16),
              HobbySelection(
                hobbies: const ['Photography', 'Reading', 'Drawing', 'Music'],
                icons: const ['◉', '▤', '✦', '♫'],
                onSelectionChanged: (selected) {
                  debugPrint('Selected hobbies: $selected');
                },
              ),
              const SizedBox(height: 16),
              StartFocusButton(
                text: 'Continue',
                onPressed: () {
                  Navigator.pushNamed(context, '/onboarding_goals');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HobbySelection extends StatefulWidget {
  final List<String> hobbies;
  final List<String> icons;
  final ValueChanged<List<String>>? onSelectionChanged;

  const HobbySelection({
    super.key,
    this.hobbies = const ['Photography', 'Reading', 'Drawing', 'Music'],
    this.icons = const ['📷', '📚', '🎨', '🎵'],
    this.onSelectionChanged,
  });

  @override
  State<HobbySelection> createState() => _HobbySelectionState();
}

class _HobbySelectionState extends State<HobbySelection> {
  final Set<String> selectedHobbies = {};

  @override
  Widget build(BuildContext context) {
    final hobbies = widget.hobbies.take(4).toList();

    return SizedBox(
      width: 138,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(hobbies.length, (index) {
          final hobby = hobbies[index];
          final isSelected = selectedHobbies.contains(hobby);

          final icon = index < widget.icons.length ? widget.icons[index] : '◉';

          return Padding(
            padding: EdgeInsets.only(
              bottom: index == hobbies.length - 1 ? 0 : 8,
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedHobbies.remove(hobby);
                  } else {
                    selectedHobbies.add(hobby);
                  }
                });

                widget.onSelectionChanged?.call(selectedHobbies.toList());
              },
              child: Container(
                width: 138,
                height: 46,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF0E8D68)
                      : const Color(0xFFD6F2E5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Text(
                      icon,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        height: 1.3,
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFF0E8D68),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        hobby,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFF131E1C),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
