import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/profile_provider.dart';
import '../services/profile_storage_service.dart';
import '../widgets/profile/achievement_card.dart';
import '../widgets/profile/level_progress_card.dart';
import '../widgets/profile/language_selector.dart';
import '../widgets/profile/profile_edit_button.dart';
import '../widgets/profile/profile_header.dart';
import '../widgets/profile/settings_tile.dart';
import '../widgets/profile/stat_card.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() =>
      _ProfileScreenState();
}

class _ProfileScreenState
    extends ConsumerState<ProfileScreen> {
  final ProfileStorageService _storageService =
      ProfileStorageService();

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final profile = await _storageService.loadProfile();

    if (!mounted) {
      return;
    }

    ref.read(profileProvider.notifier).state =
        profile;
  }

  Future<void> _updateProfile(ProfileData profile) async {
    ref.read(profileProvider.notifier).state =
        profile;

    await _storageService.saveProfile(profile);
  }

  void _openEditProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const EditProfileScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(profileProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            20,
            20,
            20,
            32,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              const Text(
                'Profil',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),

              ProfileHeader(
                name: profile.name,
                username: profile.username,
                level: profile.level,
                xp: profile.xp,
              ),

              const SizedBox(height: 18),

              ProfileEditButton(
                onPressed: _openEditProfile,
              ),

              const SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: StatCard(
                      value: '${profile.lessonsCompleted}',
                      label: 'Lesson',
                      icon: Icons.menu_book,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: StatCard(
                      value: '${profile.xp}',
                      label: 'XP',
                      icon: Icons.bolt,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: StatCard(
                      value: '${profile.streak}',
                      label: 'Streak',
                      icon: Icons.local_fire_department,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              const Text(
                'Progress Belajar',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              LevelProgressCard(
                level: profile.level,
                xp: profile.xp,
                nextLevelXp: 500,
              ),

              const SizedBox(height: 24),

              const Text(
                'Pencapaian',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.05,
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(),
                children: const [
                  AchievementCard(
                    icon: Icons.school,
                    title: 'First Lesson',
                    description:
                        'Menyelesaikan lesson pertama',
                    unlocked: true,
                  ),
                  AchievementCard(
                    icon: Icons.local_fire_department,
                    title: '7 Day Streak',
                    description:
                        'Belajar selama 7 hari',
                    unlocked: true,
                  ),
                  AchievementCard(
                    icon: Icons.star,
                    title: 'Perfect Quiz',
                    description:
                        'Mendapat nilai sempurna',
                    unlocked: true,
                  ),
                  AchievementCard(
                    icon: Icons.emoji_events,
                    title: 'Vocabulary Master',
                    description:
                        'Menguasai 100 kosakata',
                    unlocked: false,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              const Text(
                'Preferensi',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              LanguageSelector(
                currentLanguage: profile.language,
                onChanged: (value) {
                  _updateProfile(
                    profile.copyWith(
                      language: value,
                    ),
                  );
                },
              ),

              const SizedBox(height: 10),

              SettingsTile(
                icon: Icons.notifications,
                title: 'Notifikasi',
                subtitle:
                    'Pengingat untuk belajar',
                value:
                    profile.notificationsEnabled,
                onChanged: (value) {
                  _updateProfile(
                    profile.copyWith(
                      notificationsEnabled: value,
                    ),
                  );
                },
              ),

              const SizedBox(height: 10),

              SettingsTile(
                icon: Icons.volume_up,
                title: 'Suara',
                subtitle:
                    'Suara pada latihan dan kuis',
                value: profile.soundEnabled,
                onChanged: (value) {
                  _updateProfile(
                    profile.copyWith(
                      soundEnabled: value,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}