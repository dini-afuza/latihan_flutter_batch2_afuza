import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Profil Saya'),
          backgroundColor: const Color.fromARGB(255, 233, 2, 59),
          foregroundColor: const Color.fromARGB(255, 235, 240, 241), 
          ),
          body: Padding(
          padding: const EdgeInsets.all(20.0), // Agar tidak menempel ke tepi layar
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Rata tengah
            children: [
              // Elemen 1: Nama Lengkap
              const Text(
                'Nama: Muhammad Dini Afuza',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(height: 8), // Memberi jarak antar elemen

              // Elemen 2: Row untuk Ikon dan Lokasi
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.location_on,
                    color: Colors.redAccent,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Jakarta Selatan',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Elemen 3: Deskripsi Singkat
              const Text(
                'Seorang peserta pelatihan yang sedang mempelajari flutter dari nol di PPKD.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 18, 18, 19), // Warna kontras hitam
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}