import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Latihan Widget Dasar',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Praktikum Pertemuan 1'),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView( // Agar halaman bisa di-scroll
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- LATIHAN 1: TEXT & STYLING ---
                const Text(
                  'Latihan 1: Text Styling',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Hello Flutter!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    letterSpacing: 2, // Eksperimen Bonus
                  ),
                ),
                const Text(
                  'Ini teks biasa dengan ukuran kecil',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const Divider(height: 40),

                // --- LATIHAN 2: CONTAINER & DECORATION ---
                const Text(
                  'Latihan 2: Container',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20), // Ganti ke 100 untuk lingkaran
                      border: Border.all(color: Colors.black, width: 4), // Eksperimen Bonus
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Box',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                  ),
                ),
                const Divider(height: 40),

                // --- LATIHAN 3: ROW & COLUMN (Layouting) ---
                const Text(
                  'Latihan 3: Row & Column',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Eksperimen ganti ini
                  children: [
                    Container(color: Colors.red, width: 50, height: 50),
                    Container(color: Colors.green, width: 50, height: 50),
                    Container(color: Colors.purple, width: 50, height: 50),
                  ],
                ),
                const Divider(height: 40),

                // --- LATIHAN 4: ICON & BOTTOM BAR MOCKUP ---
                const Text(
                  'Latihan 4: Icons',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.home, size: 48, color: Colors.red),
                    Icon(Icons.receipt_long, size: 48, color: Colors.green),
                    Icon(Icons.person, size: 48, color: Colors.purple),
                    Icon(Icons.settings, size: 48, color: Colors.orange),
                  ],
                ),
              ],
            ),
          ),
        ),

        // --- RINGKASAN: ELEVATED BUTTON ---
        floatingActionButton: ElevatedButton(
          onPressed: () {
            print('Tombol ditekan!');
          },
          child: const Text('Elevated Button'),
        ),
      ),
    );
  }
}