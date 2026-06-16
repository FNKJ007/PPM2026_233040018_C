import 'dart:io' show File;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart'; // Tambahkan import ini

import 'edit_profile_page.dart';
import 'upload_pengalaman_page.dart';
import 'gallery_page.dart';
import 'helper_widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'Muhammad Haekal Al Ghazy';
  String title = 'Mahasiswa Teknik Informatika';
  String about = 'Belajar Flutter!';
  String education = 'Teknik Informatika - Semester 6';
  String location = 'Bandung, Jawa Barat';
  String contact = 'm.haekalalghazy078@gmail.com';
  XFile? profileImage; // Ubah ke XFile?

  String expTitle = 'Belum ada pengalaman';
  String expDesc = 'Tambahkan pengalaman dari menu drawer.';
  XFile? expImage; // Ubah ke XFile?
  bool hasExperience = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu Utama',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.widgets),
              title: const Text('Widget Gallery'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GalleryHome()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.upload_file),
              title: const Text('Upload Pengalaman'),
              onTap: () async {
                Navigator.pop(context);
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UploadPengalamanPage(
                      initialTitle: hasExperience ? expTitle : '',
                      initialDesc: hasExperience ? expDesc : '',
                      initialImage: expImage,
                    ),
                  ),
                );

                if (result != null) {
                  setState(() {
                    expTitle = result['title'];
                    expDesc = result['desc'];
                    expImage = result['image'];
                    hasExperience = true;
                  });
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Pengaturan'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Pengaturan'),
                    content: const Text(
                      'Halaman pengaturan akan segera hadir.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Tutup'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade300,
                    child: profileImage == null
                        ? const Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.white,
                          )
                        : ClipOval(
                            child: kIsWeb
                                ? Image.network(
                                    profileImage!.path,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    File(profileImage!.path),
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            const Row(
              children: [
                Expanded(
                  child: StatBox(label: 'Post', value: '12'),
                ),
                Expanded(
                  child: StatBox(label: 'Teman', value: '128'),
                ),
                Expanded(
                  child: StatBox(label: 'Like', value: '1.2K'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SectionCard(
              icon: Icons.info_outline,
              title: 'Tentang',
              content: about,
            ),
            SectionCard(
              icon: Icons.school,
              title: 'Pendidikan',
              content: education,
            ),
            SectionCard(
              icon: Icons.location_on,
              title: 'Lokasi',
              content: location,
            ),
            SectionCard(icon: Icons.email, title: 'Kontak', content: contact),
            Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.star, color: Colors.blue, size: 28),
                        SizedBox(width: 16),
                        Text(
                          'Skills',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      children: const [
                        Chip(label: Text('Flutter')),
                        Chip(label: Text('Dart')),
                        Chip(label: Text('Java')),
                        Chip(label: Text('Python')),
                        Chip(label: Text('Git')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (hasExperience)
              Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.work, color: Colors.blue, size: 28),
                          SizedBox(width: 16),
                          Text(
                            'Pengalaman',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      if (expImage != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: kIsWeb
                              ? Image.network(
                                  expImage!.path,
                                  width: double.infinity,
                                  height: 150,
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  File(expImage!.path),
                                  width: double.infinity,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      const SizedBox(height: 12),
                      Text(
                        expTitle,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(expDesc),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditProfilePage(
                initialName: name,
                initialAbout: about,
                initialEducation: education,
                initialLocation: location,
                initialContact: contact,
                initialImage: profileImage,
              ),
            ),
          );

          if (result != null) {
            setState(() {
              name = result['name'];
              about = result['about'];
              education = result['education'];
              location = result['location'];
              contact = result['contact'];
              profileImage = result['image'];
            });
          }
        },
        icon: const Icon(Icons.edit),
        label: const Text('Edit Profil'),
      ),
    );
  }
}
