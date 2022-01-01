import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

String checkPercentage(Map<String, dynamic> data) {
  int sum = 0;
  data.forEach((key, value) {
    if (value != '') {
      sum += 1;
    }
  });
  return sum == 0 ? sum.toString() : (sum / data.length).toString();
}

void setMapDataToLocalStorage(String name, Map<String, dynamic> data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String percentage = checkPercentage(data);
  data.putIfAbsent("percentage", () => percentage);
  prefs.setString(name, json.encode(data));
}

Future<Map<String, dynamic>> getMapDataFromLocalStorage(String name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? localData = prefs.getString(name);
  return localData != null ? json.decode(localData) as Map<String, dynamic> : {};
}
