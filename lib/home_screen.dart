import 'package:flutter/material.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> animals = [
    {
      'poster': 'assets/images/kucing.webp',
      'nama': 'Kucing Oren',
      'jenis': 'Kucing',
      'sifat': 'Lembut, manja, suka bermain',
      'tips': 'Berikan makanan berkualitas dan rutin periksa kesehatan',
    },
    {
      'poster': 'assets/images/anjing.jpg',
      'nama': 'Anjing Lucu',
      'jenis': 'Anjing',
      'sifat': 'Enerjik, setia, ramah',
      'tips': 'Latihan rutin dan berikan perhatian cukup',
    },
    {
      'poster': 'assets/images/hamster.webp',
      'nama': 'Hamster Kecil',
      'jenis': 'Hamster',
      'sifat': 'Aktif, suka berlari, kecil lucu',
      'tips': 'Berikan roda dan tempat tidur nyaman',
    },
    {
      'poster': 'assets/images/bebek.jpg',
      'nama': 'Bebek Kuning',
      'jenis': 'Bebek',
      'sifat': 'Ramah, aktif, sosial, dan suka bermain di air',
      'tips': 'Bersihkan lingkungan, beri makan yang cukup, dan jaga kebersihan air tempat bebek tinggal',
    },
    {
      'poster': 'assets/images/kelinci.webp',
      'nama': 'Kelinci Style',
      'jenis': 'Kelinci',
      'sifat': 'Lembut, pemalu, sosial, suka berlarian',
      'tips': 'Beri makanan sehat, hindari stres, dan sediakan tempat nyaman',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // background lembut
      appBar: AppBar(
        title: Text('Daftar Hewan', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal, // Warna keren
        elevation: 4,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => Navigator.pushNamed(context, '/search'),
            tooltip: 'Cari Hewan',
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: animals.length,
        itemBuilder: (_, i) {
          final item = animals[i];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              tileColor: Colors.white,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(item['poster'], width: 60, fit: BoxFit.cover),
              ),
              title: Text(item['nama'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              subtitle: Text('Jenis: ${item['jenis']}'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DetailScreen(animal: item)),
              ),
            ),
          );
        },
      ),
    );
  }
}