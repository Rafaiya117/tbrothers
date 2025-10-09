import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/legecy_appso_connects/controller/controller.dart';
import 'package:appsoleum/features/legecy_appso_connects/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MyConnectionsScreen extends StatefulWidget {
  const MyConnectionsScreen({super.key});

  @override
  State<MyConnectionsScreen> createState() => _MyConnectionsScreenState();
}

class _MyConnectionsScreenState extends State<MyConnectionsScreen> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ConnectionsController(),
      child: Consumer<ConnectionsController>(
        builder: (context, controller, _) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: AppGradientColors.background_color,
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: const Color(0xFF017FDC),
                elevation: 0,
                leading: IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/arrow_back.svg',
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  onPressed: () {
                    context.pop();
                  },
                ),
                title: _isSearching
                    ? TextField(
                        controller: _searchController,
                        autofocus: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.white70),
                          border: InputBorder.none,
                        ),
                        onChanged: controller.search,
                      )
                    : const Text(
                        'My Connections',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                centerTitle: true,
                actions: [
                  IconButton(
                    icon: SvgPicture.asset(
                      _isSearching ? 'assets/icons/close_icon.svg' : 'assets/icons/search_icon.svg',
                      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                    onPressed: () {
                      setState(() {
                        if (_isSearching) {
                          _isSearching = false;
                          _searchController.clear();
                          controller.search('');
                        } else {
                          _isSearching = true;
                        }
                      });
                    },
                  ),
                ],
              ),
              body: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                itemCount: controller.connections.length,
                itemBuilder: (context, index) {
                  final connection = controller.connections[index];
                  return _buildConnectionCard(connection);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildConnectionCard(Connection connection) {
    return Container(
      padding: const EdgeInsets.all(15.0),
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
                  color: connection.isConnected ? Colors.transparent : Colors.white,
                  width: 1.5,
                ),
              ),
              child: ElevatedButton(
                onPressed: () {},
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