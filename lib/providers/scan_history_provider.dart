import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/scan_result.dart';

class ScanHistoryProvider extends ChangeNotifier {
  List<ScanResult> _history = [];
  List<ScanResult> get history => _history;

  ScanHistoryProvider() {
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? historyJson = prefs.getStringList('scan_history');

      if (historyJson != null) {
        _history = historyJson
            .map((item) => ScanResult.fromJson(json.decode(item)))
            .toList();

        _history.sort((a, b) => b.timestamp.compareTo(a.timestamp));

        notifyListeners();
      }
    } catch (e) {
      print('Error loading history: $e');
    }
  }

  Future<void> _saveHistory() async {
    try {
      List<String> historyJson =
          _history.map((item) => json.encode(item.toJson())).toList();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('scan_history', historyJson);
    } catch (e) {
      print('Error saving history: $e');
    }
  }

  void addScan(ScanResult result) {
    _history.insert(0, result);
    notifyListeners();
    _saveHistory();
  }

  void clearHistory() {
    _history.clear();
    notifyListeners();
    _saveHistory();
  }

  void removeScan(int index) {
    if (index >= 0 && index < _history.length) {
      _history.removeAt(index);
      notifyListeners();
      _saveHistory();
    }
  }
}
