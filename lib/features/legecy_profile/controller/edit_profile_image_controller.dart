import 'dart:io';
import 'package:appsoleum/features/legecy_crop_screen/legecy_crop_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';


enum FilterAction {
  takePhoto,
  recordVideo,
  uploadGallery,
}

class EditProfileController extends ChangeNotifier {
  File? _imageFile;
  File? get imageFile => _imageFile;

  void setImageFile(File file) {
    _imageFile = file;
    notifyListeners();
  }
  

  // Future<void> pickImageAndNavigateToCrop(BuildContext context, ImageSource source) async {
  //   final pickedFile = await ImagePicker().pickImage(source: source);

  //   if (pickedFile != null) {
  //     final croppedFile = await Navigator.of(context).push<File>(
  //       MaterialPageRoute(
  //         builder: (context) => EditPhotoPage(imagePath: pickedFile.path, imageFile: pickedFile,),
  //       ),
  //     );
  //     if (croppedFile != null) {
  //       setImageFile(croppedFile);
  //     }
  //   }
  // }
  
  // MOVED TO CONTROLLER: GlobalKey map
  Map<String, GlobalKey> filterButtonKeys = {
      'Education': GlobalKey(),
      'Family': GlobalKey(),
      'Love & Relationship': GlobalKey(),
      'Travel': GlobalKey(),
      'Spiritual Journey': GlobalKey(),
      'Social': GlobalKey(),
      'Career': GlobalKey(),
  };

  // MOVED TO CONTROLLER: Popup Menu Items (Using enum)
  static final List<PopupMenuItem<FilterAction>> popupItems = [
    const PopupMenuItem<FilterAction>(
      value: FilterAction.takePhoto,
      child: Row(
        children: [
          Icon(Icons.insert_drive_file_outlined, color: Colors.black54),
          SizedBox(width: 10),
          Text('Take Photo'),
        ],
      ),
    ),
    const PopupMenuItem<FilterAction>(
      value: FilterAction.recordVideo,
      child: Row(
        children: [
          Icon(Icons.videocam_outlined, color: Colors.black54),
          SizedBox(width: 10),
          Text('Record Video'),
        ],
      ),
    ),
    const PopupMenuItem<FilterAction>(
      value: FilterAction.uploadGallery,
      child: Row(
        children: [
          Icon(Icons.folder_open_outlined, color: Colors.black54),
          SizedBox(width: 10),
          Text('Text Message'),
        ],
      ),
    ),
  ];

  Future<void> pickMediaFromGallery(BuildContext context, String filterText) async {
  final picker = ImagePicker();
  final XFile? pickedFile = await picker.pickMedia();

  if (pickedFile != null) {
    final isImage = pickedFile.mimeType?.startsWith('image/') ?? pickedFile.name.toLowerCase().endsWith('.jpg') || pickedFile.name.toLowerCase().endsWith('.png');

    if (isImage) {
      await pickImageAndNavigateToCrop(context, ImageSource.gallery, initialFile: File(pickedFile.path));
    } else {
      context.push('/videoUploadPage', extra: {'filter': filterText, 'filePath': pickedFile.path});
    }
  }
}


Future<void> pickImageAndNavigateToCrop(BuildContext context, ImageSource source, {File? initialFile}) async {
  XFile? pickedFile;

  if (initialFile != null) {
      pickedFile = XFile(initialFile.path);
  } else {
      final picker = ImagePicker();
      pickedFile = await picker.pickImage(source: source);
  }

  if (pickedFile != null) {
    final croppedFile = await Navigator.of(context).push<File>(
      MaterialPageRoute(
        builder: (context) => EditPhotoPage(imagePath: pickedFile!.path, imageFile: pickedFile,),
      ),
    );
    if (croppedFile != null) {
      setImageFile(croppedFile);
    }
  }
}

  Future<void> showFilterPopup(BuildContext context, GlobalKey buttonKey, String filterText) async {
    final RenderBox? renderBox = buttonKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final offset = renderBox.localToGlobal(Offset.zero);

    // Change type to FilterAction
    final FilterAction? selectedAction = await showMenu<FilterAction>( 
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx, 
        offset.dy + renderBox.size.height + 4, 
        MediaQuery.of(context).size.width, 
        offset.dy + renderBox.size.height + 4,
      ),
      items: popupItems,
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
    );
    if (selectedAction != null) {
      print('Selected action: $selectedAction for filter: $filterText');
        switch (selectedAction) {
          case FilterAction.takePhoto:
            context.push('/legecy_take_photo', extra: filterText); 
            break;               
          case FilterAction.recordVideo:
            context.push('/legecy_captured_video', extra: filterText);
            break;               
          case FilterAction.uploadGallery:
            //await pickMediaFromGallery(context, filterText); 
            context.push('/appso_text_message', extra: filterText);
            break;
          }
        }
      }
    }