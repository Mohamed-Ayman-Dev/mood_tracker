extension FormatDateTimeOnDateTime on DateTime {
  static const _shortMonths = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  static const _fullMonths = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  static const _shortDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  static const _fullDays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  String fmtDate({
    bool upperCase = false,
    bool fullDay = true,
    bool fullMonth = true,
  }) {
    final dayName = fullDay ? _fullDays[weekday - 1] : _shortDays[weekday - 1];

    final monthName = fullMonth
        ? _fullMonths[month - 1]
        : _shortMonths[month - 1];

    final result = '$dayName, $monthName $day';

    return upperCase ? result.toUpperCase() : result;
  }

  String fmtTime() {
    final hour12 = hour % 12 == 0 ? 12 : hour % 12;

    final minuteFormatted = minute.toString().padLeft(2, '0');

    final period = hour >= 12 ? 'PM' : 'AM';

    return '$hour12:$minuteFormatted $period';
  }
}
