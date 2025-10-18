import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/memoriers/controller/recording_controller.dart';
import 'package:appsoleum/features/memoriers/widget/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RecordMediaScreen extends StatefulWidget {
  final Gradient? backgroundGradient;
  const RecordMediaScreen({super.key, this.backgroundGradient});

  @override
  State<RecordMediaScreen> createState() => _RecordMediaScreenState();
}

class _RecordMediaScreenState extends State<RecordMediaScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        final isAudio = _tabController.index == 0;
        context.read<RecordMediaController>().switchTab(isAudio);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RecordMediaController>();
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradientColors.background_color
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Recording Messages',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,

          // 🔥 Updated TabBar section (matches your provided image)
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(color: Colors.amber, width: 2),
                //insets: EdgeInsets.symmetric(horizontal: 0),
              ),
              tabs: const [
                Tab(text: 'Record Audio'),
                Tab(text: 'Record Video'),
              ],
            ),
          ),
        ),

        body: 
        TabBarView(
          controller: _tabController,
          children: [
            MediaCardWidget(
              isAudio: true,
              isRecording: controller.model.isRecording,
              onRecordPressed: (){
                controller.toggleRecording();
                context.push('/record_memoryaudio_post');
              }
            ),
            MediaCardWidget(
              isAudio: false,
              isRecording: controller.model.isRecording,
              onRecordPressed:(){
                controller.toggleRecording();
                context.push('/record_memoryvideo_post');
              },
            ),
          ],
        ),
      ),
    );
  }
}
