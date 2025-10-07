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
          icon: SvgPicture.asset('assets/icons/arrow_back.svg', colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
          onPressed: () {}, 
        ),
        title: const Text(
          'My Connections',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/search_icon.svg', colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
            onPressed: () {}, 
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
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
      //margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.all(15.0),
      // decoration: BoxDecoration(
      //   color: const Color(0xFF1976D2), 
      //   borderRadius: BorderRadius.circular(15.0),
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.black.withOpacity(0.1),
      //       spreadRadius: 1,
      //       blurRadius: 3,
      //       offset: const Offset(0, 2),
      //     ),
      //   ],
      // ),
      child: Row(
        children: [
          Container(
            width: 56, 
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), 
              color: Colors.grey.shade300,
              image: DecorationImage(
                image: AssetImage(connection.profilePicAsset),
                fit: BoxFit.cover,
              ),
            ),
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
                    // ignore: deprecated_member_use
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 140,
            height: 40,
            child: Container(
              decoration: BoxDecoration(
                gradient: connection.isConnected
                    ? const LinearGradient(
                        colors: [Color(0xFFFF8740), Color(0xFFFDAE57)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
                color: connection.isConnected ? null : const Color(0xFF0F4C82),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: connection.isConnected
                      ? Colors.transparent
                      : Colors.white,
                  width: 1.5,
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Your onPressed logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  connection.isConnected ? "Connected" : "Follow",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}