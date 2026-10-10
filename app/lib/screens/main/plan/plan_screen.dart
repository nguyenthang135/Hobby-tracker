import 'package:flutter/material.dart';

import '../../../utils/responsive.dart';

import '../home/home_screen.dart';

// Style dùng chung, cỡ chữ đã scale
TextStyle _style(
  BuildContext context, {
  required double size,
  required FontWeight weight,
  required Color color,
}) {
  return TextStyle(
    fontFamily: 'Inter',
    fontSize: context.sp(size),
    fontWeight: weight,
    height: 1.3,
    letterSpacing: 0,
    color: color,
  );
}

const _ink = Color(0xFF131E1C);
const _muted = Color(0xFF5A6D67);
const _green = Color(0xFF0E8D68);
const _mint = Color(0xFFD6F2E5);

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBF7),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            context.w(24),
            context.h(22),
            context.w(24),
            context.h(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PlanHeader(),
              SizedBox(height: context.h(16)),
              WeekSelector(
                onDateSelected: (date) => debugPrint('Selected date: $date'),
              ),
              SizedBox(height: context.h(16)),
              const ScheduleHeader(),
              SizedBox(height: context.h(16)),
              const ScheduleCard(), // class này chưa có trong file
              SizedBox(height: context.h(16)),
              const SmartSuggestion(),
              SizedBox(height: context.h(16)),
            ],
          ),
        ),
      ),
    );
  }
}

class PlanHeader extends StatelessWidget {
  final String name;
  final String date;
  final VoidCallback? onAddTap;

  const PlanHeader({
    super.key,
    this.name = 'Plan your day',
    this.date = 'Friday, 2 October',
    this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.w(342),
      height: context.h(49),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: _style(
                    context,
                    size: 22,
                    weight: FontWeight.w700,
                    color: _ink,
                  ),
                ),
                SizedBox(height: context.h(2)),
                Text(
                  date,
                  style: _style(
                    context,
                    size: 13,
                    weight: FontWeight.w400,
                    color: _muted,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: context.w(10)),
          GestureDetector(
            onTap:
                onAddTap ?? () => Navigator.pushNamed(context, '/add_session'),
            child: Container(
              width: context.w(34),
              height: context.h(49),
              decoration: BoxDecoration(
                color: _mint,
                borderRadius: BorderRadius.circular(context.r(16)),
              ),
              alignment: Alignment.center,
              child: Text(
                '+',
                style: _style(
                  context,
                  size: 22,
                  weight: FontWeight.w600,
                  color: _green,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WeekSelector extends StatefulWidget {
  final DateTime? selectedDate;
  final ValueChanged<DateTime>? onDateSelected;

  const WeekSelector({super.key, this.selectedDate, this.onDateSelected});

  @override
  State<WeekSelector> createState() => _WeekSelectorState();
}

class _WeekSelectorState extends State<WeekSelector> {
  late DateTime selectedDate;
  final List<String> weekDays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
  late List<DateTime> dates;

  @override
  void initState() {
    super.initState();
    final today = DateTime.now();
    final monday = today.subtract(Duration(days: today.weekday - 1));
    dates = List.generate(7, (i) => monday.add(Duration(days: i)));
    selectedDate = widget.selectedDate ?? today;
  }

  @override
  void didUpdateWidget(covariant WeekSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedDate != null &&
        widget.selectedDate != oldWidget.selectedDate) {
      selectedDate = widget.selectedDate!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.w(342),
      height: context.h(69),
      padding: EdgeInsets.all(context.r(10)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(context.r(18)),
      ),
      child: Row(
        children: List.generate(7, (index) {
          final date = dates[index];
          final isSelected =
              date.year == selectedDate.year &&
              date.month == selectedDate.month &&
              date.day == selectedDate.day;

          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: index == 6 ? 0 : context.w(4)),
              child: GestureDetector(
                onTap: () {
                  setState(() => selectedDate = date);
                  widget.onDateSelected?.call(date);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? _mint : Colors.transparent,
                    borderRadius: BorderRadius.circular(context.r(14)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        weekDays[index],
                        style: _style(
                          context,
                          size: 11,
                          weight: FontWeight.w600,
                          color: _muted,
                        ),
                      ),
                      SizedBox(height: context.h(2)),
                      Text(
                        '${date.day}',
                        style: _style(
                          context,
                          size: 15,
                          weight: FontWeight.w700,
                          color: isSelected ? _green : _ink,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class ScheduleHeader extends StatelessWidget {
  final VoidCallback? onDayViewTap;

  const ScheduleHeader({super.key, this.onDayViewTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.w(342),
      height: context.h(23),
      child: Row(
        children: [
          Text(
            'Schedule',
            style: _style(
              context,
              size: 18,
              weight: FontWeight.w700,
              color: _ink,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onDayViewTap,
            child: Text(
              'Day view',
              style: _style(
                context,
                size: 13,
                weight: FontWeight.w600,
                color: _green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SmartSuggestion extends StatelessWidget {
  final String title;
  final String message;
  final String actionText;
  final VoidCallback? onScheduleTap;

  const SmartSuggestion({
    super.key,
    this.title = 'A window just opened up',
    this.message = 'Save 45 minutes at 17:30 for Photography.',
    this.actionText = 'Schedule it →',
    this.onScheduleTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.w(342),
      constraints: BoxConstraints(minHeight: context.h(96)),
      padding: EdgeInsets.all(context.r(16)),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE9CE),
        borderRadius: BorderRadius.circular(context.r(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: _style(
              context,
              size: 14,
              weight: FontWeight.w700,
              color: _ink,
            ),
          ),
          SizedBox(height: context.h(6)),
          Text(
            message,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: _style(
              context,
              size: 13,
              weight: FontWeight.w400,
              color: _muted,
            ),
          ),
          SizedBox(height: context.h(6)),
          GestureDetector(
            onTap: onScheduleTap,
            child: Text(
              actionText,
              style: _style(
                context,
                size: 13,
                weight: FontWeight.w600,
                color: _green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
