import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
    // Data lainnya...
  ];

  String searchQuery = '';
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    final filteredAnimals = animals
        .where((animal) =>
            animal['nama'].toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Cari hewan...',
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.white, fontSize: 16),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              )
            : Text('Daftar Hewan'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(isSearching ? Icons.close : Icons.search),
            tooltip: isSearching ? 'Tutup pencarian' : 'Cari hewan',
            onPressed: () {
              setState(() {
                if (isSearching) {
                  searchQuery = '';
                }
                isSearching = !isSearching;
              });
            },
          ),
        ],
        bottom: isSearching
            ? PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white70),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white.withOpacity(0.2),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 8),
                        Icon(Icons.search, color: Colors.white70),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            autofocus: true,
                            decoration: InputDecoration(
                              hintText: 'Cari hewan...',
                              border: InputBorder.none,
                            ),
                            style: TextStyle(color: Colors.white),
                            onChanged: (value) {
                              setState(() {
                                searchQuery = value;
                              });
                            },
                          ),
                        ),
                        if (searchQuery.isNotEmpty)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                searchQuery = '';
                              });
                            },
                            child: Icon(Icons.clear, color: Colors.white70),
                          ),
                        SizedBox(width: 8),
                      ],
                    ),
                  ),
                ),
              )
            : null,
      ),
      body: ListView.builder(
        itemCount: filteredAnimals.length,
        itemBuilder: (_, i) {
          final item = filteredAnimals[i];
          return ListTile(
            leading: Image.asset(item['poster'], width: 50, fit: BoxFit.cover),
            title: Text(item['nama']),
            subtitle: Text('Jenis: ${item['jenis']}'),
            onTap: () {
              // Navigasi ke DetailScreen
            },
          );
        },
      ),
    );
  }
}