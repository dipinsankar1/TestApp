import 'package:flutter/material.dart';
import 'package:testapp/data/api_manager.dart';
import 'package:testapp/view_model/search_view_model.dart';

class SearchListViewModel extends ChangeNotifier {
  List<SearchViewModel> events = [];
  Future<void> fetchEvents(String keyword) async {
    final results = await ApiModel().fetchEvents(keyword);
    events = results.map((item) => SearchViewModel(search: item)).toList();
    notifyListeners();
  }
}
