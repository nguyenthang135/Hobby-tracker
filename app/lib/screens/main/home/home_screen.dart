import 'package:flutter/material.dart';

import '../../../widgets/app_button.dart';
import '../main_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBF7),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 22, 24, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),
              const SizedBox(height: 16),
              FocusSession(
                onStart: () => mainTabIndex.value = 2, // 2 = tab Focus
              ),
              const SizedBox(height: 16),
              TodayHeading(
                onSeeCalendarTap: () {
                  mainTabIndex.value = 1; // 1 = tab Plan
                },
              ),
              const SizedBox(height: 16),
              const ScheduleCard(),
              const SizedBox(height: 16),
              const WeeklyGoal(),
              const SizedBox(height: 16),
              const Insight(),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  final String name;
  final String date;
  final VoidCallback? onNotificationTap;

  const HomeHeader({
    super.key,
    this.name = 'Minh Anh',
    this.date = 'Friday, 2 October',
    this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 342,
      height: 49,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Greeting
          Expanded(
            child: SizedBox(
              height: 49,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Good morning, $name',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      height: 1.3,
                      letterSpacing: 0,
                      color: Color(0xFF131E1C),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    date,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      height: 1.3,
                      letterSpacing: 0,
                      color: Color(0xFF5A6D67),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 10),

          // Notification
          GestureDetector(
            onTap: onNotificationTap,
            child: Container(
              width: 34,
              height: 49,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: const Text(
                '◌',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                  letterSpacing: 0,
                  color: Color(0xFF0E8D68),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FocusSession extends StatelessWidget {
  final String time;
  final String title;
  final String description;
  final VoidCallback? onStart;

  const FocusSession({
    super.key,
    this.time = '17:30',
    this.title = 'Capture the golden hour',
    this.description = 'Photography · 45 min · Riverside walk',
    this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      height: 207,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0E8D68),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Focus top
          Row(
            children: [
              Container(
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFD6F2E5),
                  borderRadius: BorderRadius.circular(999),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'NEXT UP',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                    letterSpacing: 0,
                    color: Color(0xFF0E8D68),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                time,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                  letterSpacing: 0,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // Session title
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              height: 1.3,
              letterSpacing: 0,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 4),

          // Session description
          Text(
            description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              fontWeight: FontWeight.w400,
              height: 1.3,
              letterSpacing: 0,
              color: Colors.white,
            ),
          ),

          const Spacer(),

          // Reuse existing button
          StartFocusButton(text: 'Start Focus', onPressed: onStart),
        ],
      ),
    );
  }
}

class TodayHeading extends StatelessWidget {
  final VoidCallback? onSeeCalendarTap;

  const TodayHeading({super.key, this.onSeeCalendarTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 342,
      height: 23,
      child: Row(
        children: [
          const Text(
            'Today’s plan',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.w700,
              height: 1.3,
              letterSpacing: 0,
              color: Color(0xFF131E1C),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onSeeCalendarTap,
            child: const Text(
              'See calendar',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                fontWeight: FontWeight.w600,
                height: 1.3,
                letterSpacing: 0,
                color: Color(0xFF0E8D68),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      height: 194,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: const [
          ScheduleItem(
            time: '09:00',
            title: 'UX research class',
            subtitle: 'Room A3 · 90 min',
            markerColor: Color(0xFFEB624C),
          ),
          SizedBox(height: 13),
          Divider(height: 1, thickness: 1, color: Color(0xFFDFE7E3)),
          SizedBox(height: 13),
          ScheduleItem(
            time: '14:30',
            title: 'Review moodboard',
            subtitle: 'Design task · 30 min',
            markerColor: Color(0xFF0E8D68),
          ),
          SizedBox(height: 13),
          Divider(height: 1, thickness: 1, color: Color(0xFFDFE7E3)),
          SizedBox(height: 13),
          ScheduleItem(
            time: '17:30',
            title: 'Golden hour walk',
            subtitle: 'Photography · 45 min',
            markerColor: Color(0xFFE9A23B),
          ),
        ],
      ),
    );
  }
}

class ScheduleItem extends StatelessWidget {
  final String time;
  final String title;
  final String subtitle;
  final Color markerColor;

  const ScheduleItem({
    super.key,
    required this.time,
    required this.title,
    required this.subtitle,
    required this.markerColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: Row(
        children: [
          SizedBox(
            width: 42,
            child: Text(
              time,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                fontWeight: FontWeight.w600,
                height: 1.3,
                letterSpacing: 0,
                color: Color(0xFF5A6D67),
              ),
            ),
          ),

          const SizedBox(width: 12),

          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: markerColor,
              shape: BoxShape.circle,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
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
                const SizedBox(height: 2),
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
          ),
        ],
      ),
    );
  }
}

class WeeklyGoal extends StatelessWidget {
  final String title;
  final String progressText;
  final double progress;
  final String progressLabel;

  const WeeklyGoal({
    super.key,
    this.title = 'This week’s rhythm',
    this.progressText = '2h 15m of 3h photography',
    this.progress = 0.75,
    this.progressLabel = '75%',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      height: 86,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE9CE),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // Weekly progress
          SizedBox(
            width: 54,
            height: 54,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Vòng nền trắng
                Container(
                  width: 54,
                  height: 54,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    shape: BoxShape.circle,
                  ),
                ),

                // Vòng tiến độ màu Mint
                SizedBox(
                  width: 54,
                  height: 54,
                  child: CircularProgressIndicator(
                    value: progress.clamp(0.0, 1.0),
                    strokeWidth: 6,
                    backgroundColor: Colors.transparent,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xFF0E8D68),
                    ),
                  ),
                ),

                // Phần trăm ở giữa
                Text(
                  progressLabel,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                    color: Color(0xFF0E8D68),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 14),

          // Goal details
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                    color: Color(0xFF131E1C),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  progressText,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                    color: Color(0xFF5A6D67),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Insight extends StatelessWidget {
  final String title;
  final String message;

  const Insight({
    super.key,
    this.title = 'A gentle nudge',
    this.message = 'You focus best on creative tasks after 5 PM.',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      height: 75,
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
            title,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              height: 1.3,
              letterSpacing: 0,
              color: Color(0xFF131E1C),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
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
