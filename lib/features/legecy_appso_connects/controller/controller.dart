import 'package:appsoleum/features/legecy_appso_connects/model/model.dart';
import 'package:flutter/material.dart';

class ConnectionsController extends ChangeNotifier {
  final List<Connection> _allConnections = [
    Connection(profilePicAsset: 'assets/profile_pic_james.jpg', name: 'James Smith', username: '@username', isConnected: true),
    Connection(profilePicAsset: 'assets/profile_pic_savannah.jpg', name: 'Savannah Hall', username: '@username', isConnected: true),
    Connection(profilePicAsset: 'assets/profile_pic_davide.jpg', name: 'Davide Price', username: '@username', isConnected: false),
    Connection(profilePicAsset: 'assets/profile_pic_christopher.jpg', name: 'Christoper Jones', username: '@username', isConnected: false),
    Connection(profilePicAsset: 'assets/profile_pic_theresa.jpg', name: 'Theresa Reed', username: '@username', isConnected: false),
    Connection(profilePicAsset: 'assets/profile_pic_arlene.jpg', name: 'Arlene Mcmahon', username: '@username', isConnected: true),
    Connection(profilePicAsset: 'assets/profile_pic_george.jpg', name: 'Jeorge Wilson', username: '@username', isConnected: false),
  ];

  List<Connection> _filteredConnections = [];
  String _searchQuery = '';

  ConnectionsController() {
    _filteredConnections = List.from(_allConnections);
  }

  List<Connection> get connections => _filteredConnections;

  void search(String query) {
    _searchQuery = query.toLowerCase();
    if (_searchQuery.isEmpty) {
      _filteredConnections = List.from(_allConnections);
    } else {
      _filteredConnections = _allConnections.where((c) {
        return c.name.toLowerCase().contains(_searchQuery) ||
        c.username.toLowerCase().contains(_searchQuery);
      }).toList();
    }
    notifyListeners();
  }
}
