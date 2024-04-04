

import 'package:flutter/material.dart%20';


DateTime selectedDate = DateTime.now();

Future<DateTime?> selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101));

  if (picked != null && picked != selectedDate) {
    return picked;

  }

  // return picked;
}
