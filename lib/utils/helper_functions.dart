    import 'package:intl/intl.dart';

    String getCurrentDate() {
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('EEEE, MMMM d').format(now);
      return formattedDate;
    }

    String getAbbreviatedDay(DateTime date) {
      return DateFormat('EEE').format(date);
    }

    String getAbbreviatedMonth(DateTime date) {
      return DateFormat('MMM').format(date);
    }

    String getDayOfMonth(DateTime date) {
      return date.day.toString();
    }

    String capitalize(String text) {
      if (text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1);
    }