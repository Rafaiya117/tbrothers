import 'package:flutter/material.dart';

class Connection {
  final String profilePicAsset;
  final String name;
  final String username;
  final bool isConnected;

  Connection({
    required this.profilePicAsset,
    required this.name,
    required this.username,
    required this.isConnected,
  });
}
