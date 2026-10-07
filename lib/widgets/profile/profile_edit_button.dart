import 'package:flutter/material.dart';

class ProfileEditButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ProfileEditButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.edit),
        label: const Text('Edit Profil'),
      ),
    );
  }
}