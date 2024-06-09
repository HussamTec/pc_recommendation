String timeAgo(DateTime dateTime) {
  final Duration difference = DateTime.now().difference(dateTime);
  if (difference.inDays > 365) {
    return '${(difference.inDays / 365).floor()} y';
  } else if (difference.inDays > 30) {
    return '${(difference.inDays / 30).floor()} month';
  } else if (difference.inDays > 0) {
    return '${difference.inDays} d';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} h';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} m';
  } else {
    return 'just now';
  }
}
