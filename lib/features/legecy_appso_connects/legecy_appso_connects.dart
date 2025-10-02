import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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

// Main screen widget
class MyConnectionsScreen extends StatefulWidget {
  const MyConnectionsScreen({super.key});

  @override
  State<MyConnectionsScreen> createState() => _MyConnectionsScreenState();
}

class _MyConnectionsScreenState extends State<MyConnectionsScreen> {
  final List<Connection> _connections = [
    Connection(
      profilePicAsset: 'assets/profile_pic_james.jpg',
      name: 'James Smith',
      username: '@username',
      isConnected: true,
    ),
    Connection(
      profilePicAsset: 'assets/profile_pic_savannah.jpg',
      name: 'Savannah Hall',
      username: '@username',
      isConnected: true,
    ),
    Connection(
      profilePicAsset: 'assets/profile_pic_davide.jpg',
      name: 'Davide Price',
      username: '@username',
      isConnected: false,
    ),
    Connection(
      profilePicAsset: 'assets/profile_pic_christopher.jpg',
      name: 'Christoper Jones',
      username: '@username',
      isConnected: false,
    ),
    Connection(
      profilePicAsset: 'assets/profile_pic_theresa.jpg',
      name: 'Theresa Reed',
      username: '@username',
      isConnected: false,
    ),
    Connection(
      profilePicAsset: 'assets/profile_pic_arlene.jpg',
      name: 'Arlene Mcmahon',
      username: '@username',
      isConnected: true,
    ),
    Connection(
      profilePicAsset: 'assets/profile_pic_george.jpg',
      name: 'Jeorge Wilson',
      username: '@username',
      isConnected: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F4C82), 
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F4C82),
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/back_arrow.svg', colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
          onPressed: () {}, 
        ),
        title: const Text(
          'My Connections',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/search_icon.svg', colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
            onPressed: () {}, 
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        itemCount: _connections.length,
        itemBuilder: (context, index) {
          final connection = _connections[index];
          return _buildConnectionCard(connection);
        },
      ),
    );
  }

  Widget _buildConnectionCard(Connection connection) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1976D2), 
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Profile Picture
          CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage(connection.profilePicAsset),
            backgroundColor: Colors.grey.shade300, 
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  connection.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  connection.username,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print('${connection.name} button tapped!');
              setState(() {
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: connection.isConnected ? Colors.orange.shade700 : const Color(0xFF0F4C82), // Orange for Connected, Deep Blue for Following
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              elevation: 0, 
            ),
            child: Text(
              connection.isConnected ? 'Connected' : 'Following',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}