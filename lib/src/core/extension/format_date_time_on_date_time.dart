extension FormatDateTimeOnDateTime on DateTime {
  String fmtDate() {
    const months = [
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

    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    return '${days[weekday - 1]}, ${months[month - 1]} $day';
  }

  String fmtTime() {
    final hour12 = hour % 12 == 0 ? 12 : hour % 12;

    final minuteFormatted = minute.toString().padLeft(2, '0');

    final period = hour >= 12 ? 'PM' : 'AM';

    return '$hour12:$minuteFormatted $period';
  }
}
