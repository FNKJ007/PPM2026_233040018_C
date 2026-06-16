import 'dart:io' show File;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb; // Tambahkan ini
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  final String initialName;
  final String initialAbout;
  final String initialEducation;
  final String initialLocation;
  final String initialContact;
  final XFile? initialImage; // Ubah dari File? ke XFile?

  const EditProfilePage({
    super.key,
    required this.initialName,
    required this.initialAbout,
    required this.initialEducation,
    required this.initialLocation,
    required this.initialContact,
    this.initialImage,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController nameController;
  late TextEditingController aboutController;
  late TextEditingController eduController;
  late TextEditingController locController;
  late TextEditingController contactController;
  XFile? _selectedImage; // Ubah ke XFile?

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.initialName);
    aboutController = TextEditingController(text: widget.initialAbout);
    eduController = TextEditingController(text: widget.initialEducation);
    locController = TextEditingController(text: widget.initialLocation);
    contactController = TextEditingController(text: widget.initialContact);
    _selectedImage = widget.initialImage;
  }

  @override
  void dispose() {
    nameController.dispose();
    aboutController.dispose();
    eduController.dispose();
    locController.dispose();
    contactController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = image; // Langsung masukkan XFile
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profil')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Informasi Profil',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade300,
                    // Menggunakan ClipOval agar Image.network / Image.file bisa merender dengan aman di web & mobile
                    child: _selectedImage == null
                        ? const Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.white,
                          )
                        : ClipOval(
                            child: kIsWeb
                                ? Image.network(
                                    _selectedImage!.path,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    File(_selectedImage!.path),
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                  ),
                  const SizedBox(height: 8),
                  TextButton.icon(
                    onPressed: _pickImage,
                    icon: const Icon(Icons.photo_library),
                    label: const Text('Ganti Foto dari Galeri'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: aboutController,
              decoration: const InputDecoration(
                labelText: 'Bio/Tentang',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: eduController,
              decoration: const InputDecoration(
                labelText: 'Pendidikan',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: locController,
              decoration: const InputDecoration(
                labelText: 'Lokasi',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: contactController,
              decoration: const InputDecoration(
                labelText: 'Kontak',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'name': nameController.text,
                  'about': aboutController.text,
                  'education': eduController.text,
                  'location': locController.text,
                  'contact': contactController.text,
                  'image': _selectedImage,
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Simpan Perubahan'),
            ),
          ],
        ),
      ),
    );
  }
}
