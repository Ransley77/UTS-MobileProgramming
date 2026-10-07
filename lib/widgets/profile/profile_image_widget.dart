import 'dart:io';

import 'package:flutter/material.dart';

import '../../services/image_service.dart';
import '../../services/profile_storage_service.dart';

class ProfileImageWidget extends StatefulWidget {
  const ProfileImageWidget({super.key});

  @override
  State<ProfileImageWidget> createState() =>
      _ProfileImageWidgetState();
}

class _ProfileImageWidgetState
    extends State<ProfileImageWidget> {
  final ImageService _imageService = ImageService();
  final ProfileStorageService _storageService =
      ProfileStorageService();

  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final path = await _storageService.loadImagePath();

    if (path == null) {
      return;
    }

    final file = File(path);

    if (!file.existsSync()) {
      return;
    }

    setState(() {
      _imageFile = file;
    });
  }

  Future<void> _pickImage(bool fromCamera) async {
    try {
      final file = fromCamera
          ? await _imageService.pickFromCamera()
          : await _imageService.pickFromGallery();

      if (file == null) {
        return;
      }

      setState(() {
        _imageFile = file;
      });

      await _storageService.saveImagePath(file.path);

      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            fromCamera
                ? 'Berhasil mengganti foto dari Kamera!'
                : 'Berhasil mengganti foto dari Galeri!',
          ),
        ),
      );
    } catch (e) {
      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terjadi error: $e'),
        ),
      );
    }
  }

  void _showImageSource() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Ambil dari Kamera'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(true);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Pilih dari Galeri'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(false);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor:
              const Color(0xFFFFE0B2),
          backgroundImage: _imageFile != null
              ? FileImage(_imageFile!)
              : null,
          child: _imageFile == null
              ? const Icon(
                  Icons.person,
                  size: 64,
                  color: Colors.orange,
                )
              : null,
        ),
        GestureDetector(
          onTap: _showImageSource,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.camera_alt,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}