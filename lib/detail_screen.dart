import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Map<String, dynamic> animal;
  const DetailScreen({required this.animal});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isFavorited = false; // Status favorit

  @override
  Widget build(BuildContext context) {
    final animal = widget.animal;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(animal['nama']),
        backgroundColor: Colors.teal,
        elevation: 4,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Gambar dengan border radius dan efek shadow
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Image.asset(animal['poster']),
                ),
              ),
              SizedBox(height: 16),
              // Nama hewan
              Text(
                'Nama: ${animal['nama']}',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal[800]),
              ),
              SizedBox(height: 8),
              // Jenis
              Text(
                'Jenis: ${animal['jenis']}',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 16),
              // Karakteristik
              Text(
                'Karakteristik:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                '${animal['sifat']}',
                style: TextStyle(fontSize: 16, height: 1.4),
              ),
              SizedBox(height: 16),
              // Tips
              Text(
                'Tips:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                '${animal['tips']}',
                style: TextStyle(fontSize: 16, height: 1.4),
              ),
              SizedBox(height: 24),
              // Tombol Favorit dengan efek hover dan warna
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      isFavorited = !isFavorited;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.teal,
                        content: Text(
                          isFavorited
                              ? 'Hewan berhasil ditambahkan ke favorit'
                              : 'Hewan dihapus dari favorit',
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isFavorited ? Colors.redAccent : Colors.teal,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    elevation: 6,
                  ),
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  label: Text(
                    isFavorited ? 'Hapus dari Favorit' : 'Tambah ke Favorit',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}