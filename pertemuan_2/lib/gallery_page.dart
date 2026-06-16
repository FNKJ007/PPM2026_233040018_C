import 'package:flutter/material.dart';

class GalleryHome extends StatelessWidget {
  const GalleryHome({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      ('Display', Icons.image, Colors.blue),
      ('Input', Icons.edit, Colors.green),
      ('Button', Icons.smart_button, Colors.orange),
      ('Feedback', Icons.notifications, Colors.purple),
      ('Layout', Icons.dashboard, Colors.teal),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Widget Gallery')),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, i) {
          final (name, icon, color) = categories[i];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: color,
              child: Icon(icon, color: Colors.white),
            ),
            title: Text(name),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CategoryPage(name: name)),
            ),
          );
        },
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
  final String name;
  const CategoryPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    Widget demo;
    if (name == 'Display')
      demo = const DisplayDemo();
    else if (name == 'Input')
      demo = const InputDemo();
    else if (name == 'Button')
      demo = const ButtonDemo();
    else if (name == 'Feedback')
      demo = const FeedbackDemo();
    else
      demo = const LayoutDemo();

    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Padding(padding: const EdgeInsets.all(16), child: demo),
    );
  }
}

class DisplayDemo extends StatelessWidget {
  const DisplayDemo({super.key});
  @override
  Widget build(BuildContext context) => const Column(
    children: [
      Card(
        child: ListTile(leading: Icon(Icons.album), title: Text('Contoh Card')),
      ),
      Divider(),
      Wrap(
        spacing: 8,
        children: [
          Chip(label: Text('Tag 1')),
          Chip(label: Text('Tag 2')),
        ],
      ),
    ],
  );
}

class InputDemo extends StatelessWidget {
  const InputDemo({super.key});
  @override
  Widget build(BuildContext context) => const Column(
    children: [
      TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Input Teks',
        ),
      ),
      SwitchListTile(title: Text('Opsi Switch'), value: true, onChanged: null),
    ],
  );
}

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});
  @override
  Widget build(BuildContext context) => Column(
    children: [
      ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
      OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
    ],
  );
}

class FeedbackDemo extends StatelessWidget {
  const FeedbackDemo({super.key});
  @override
  Widget build(BuildContext context) => const Column(
    children: [
      LinearProgressIndicator(),
      SizedBox(height: 20),
      CircularProgressIndicator(),
    ],
  );
}

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});
  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(width: 50, height: 50, color: Colors.red),
      Container(width: 50, height: 50, color: Colors.blue),
    ],
  );
}
