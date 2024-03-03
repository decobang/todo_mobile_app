
    import 'package:intl/intl.dart';

String getCurrentDate() {
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('EEEE, MMMM d').format(now);
      return formattedDate;
    }

 String capitalize(String text) {
      if (text.isEmpty) {
        return text;
      }
      return text[0].toUpperCase() + text.substring(1);
    }