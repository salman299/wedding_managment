import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

String checkPercentage(Map<String, dynamic> data) {
  int sum = 0;
  int total = 0;
  data.forEach((key, value) {
    if (key != 'otherDetails'){
      if (value != '') {
        sum += 1;
      }
      total += 1;
    }
  });
  return sum == 0 ? sum.toString() : (sum / total).toString();
}

Future<void> getPercentage() async{
  await getMapDataFromLocalStorage('percentage');
}

void setPercentage(SharedPreferences prefs ,String name, percentage) {
  Map<String,dynamic> perData = getMapDataFromLocal(prefs,'percentage');
  perData[name] = percentage;
  prefs.setString(name, json.encode(perData));
}

void setMapDataToLocalStorage(String name, Map<String, dynamic> data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String percentage = checkPercentage(data);
  data.putIfAbsent("percentage", () => percentage);
  prefs.setString(name, json.encode(data));
  setPercentage(prefs ,'percentage', percentage);
}

Future<Map<String, dynamic>> getMapDataFromLocalStorage(String name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? localData = prefs.getString(name);
  return localData != null ? json.decode(localData) as Map<String, dynamic> : {};
}

Map<String, dynamic> getMapDataFromLocal(SharedPreferences prefs, String name){
  final String? localData = prefs.getString(name);
  return localData != null ? json.decode(localData) as Map<String, dynamic> : {};
}

Future<void> removeLocalData(String name) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove(name);
}

