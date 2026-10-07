import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/profile_provider.dart';
import '../services/profile_storage_service.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() =>
      _EditProfileScreenState();
}

class _EditProfileScreenState
    extends ConsumerState<EditProfileScreen> {
  late TextEditingController nameController;
  late TextEditingController usernameController;

  final ProfileStorageService _storageService =
      ProfileStorageService();

  @override
  void initState() {
    super.initState();

    final profile = ref.read(profileProvider);

    nameController = TextEditingController(
      text: profile.name,
    );

    usernameController = TextEditingController(
      text: profile.username,
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    if (nameController.text.trim().isEmpty ||
        usernameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Nama dan username harus diisi.'),
        ),
      );
      return;
    }

    final oldProfile = ref.read(profileProvider);

    final newProfile = oldProfile.copyWith(
      name: nameController.text.trim(),
      username: usernameController.text.trim(),
    );

    ref.read(profileProvider.notifier).state =
        newProfile;

    await _storageService.saveProfile(newProfile);

    if (!mounted) {
      return;
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Nama',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: usernameController,
            decoration: const InputDecoration(
              labelText: 'Username',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.alternate_email),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: _saveProfile,
              child: const Text('Simpan Perubahan'),
            ),
          ),
        ],
      ),
    );
  }
}