import 'package:flutter/material.dart';
import 'package:iem_spacex_2022/app/locator.dart';
import 'package:iem_spacex_2022/core/api/api.dart';
import 'package:iem_spacex_2022/core/model/launch.dart';

class LaunchViewModel extends ChangeNotifier {
  final Api _api = locator<Api>();

  List<Launch> launches = [];

  // The view is loading by default, waiting for API call to succeed
  bool isLoading = true;

  LaunchViewModel() {
    loadData();
  }

  void loadData() async {
    try {
      var response = await _api.getUpcomingLaunches();
      launches.addAll(List<Launch>.from(
          response.data?.map((item) => Launch.fromJson(item)) ?? []));
    } catch (error, stackTrace) {
      debugPrint("$stackTrace");
    }
    isLoading = false;
    notifyListeners();
  }
}
