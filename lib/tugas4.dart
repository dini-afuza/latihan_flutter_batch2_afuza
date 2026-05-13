import 'package:flutter/material.dart';

class ScoreGG extends StatelessWidget {
  const ScoreGG({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F1014),
        primaryColor: Colors.cyanAccent,
      ),
      home: const ScoreGGHistoryPage(),
    );
  }
}

class ScoreGGHistoryPage extends StatelessWidget {
  const ScoreGGHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SCORE-GG: Input & Riwayat',
          style: TextStyle(color: Color.fromARGB(255, 17, 17, 17), fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 242, 244, 247),
        centerTitle: true,
      ),
      // 1. ROOT WIDGET: Menggunakan ListView langsung sebagai body
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            "Input Hasil Pertandingan",
            style: TextStyle(
              fontSize: 18, 
              fontWeight: FontWeight.bold, 
              color: Color.fromARGB(255, 17, 17, 17)),
          ),
          const SizedBox(height: 16),

          // 2. FORMULIR PENGGUNA (4 TextField dengan SizedBox)
          const TextField(
            decoration: InputDecoration(
              labelText: 'Nama Tim A',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.shield, color: Color.fromARGB(255, 13, 14, 14)),
            ),
          ),
          const SizedBox(height: 12),

          const TextField(
            decoration: InputDecoration(
              labelText: 'Nama Tim B',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.shield_outlined, color: Color.fromARGB(255, 12, 12, 12)),
            ),
          ),
          const SizedBox(height: 12),

          const TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Skor Akhir',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.scoreboard, color: Color.fromARGB(255, 13, 14, 14)),
            ),
          ),
          const SizedBox(height: 12),

          const TextField(
            decoration: InputDecoration(
              labelText: 'Nama Turnamen',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.emoji_events, color: Color.fromARGB(255, 13, 14, 14)),
            ),
          ),
          
          const SizedBox(height: 32),
          const Text(
            "Riwayat Pertandingan Terakhir",
            style: TextStyle(
              fontSize: 18, 
              fontWeight: FontWeight.bold, 
              color: Color.fromARGB(255, 15, 15, 15)),
          ),
          const SizedBox(height: 8),

          // 3 & 4. DAFTAR ITEM (Minimal 5 ListTile)
          _buildMatchHistory(
            title: "T1 vs Gen.G",
            subtitle: "Skor 2 - 1 (Selesai - LCK Season 2026)",
            icon: Icons.flash_on,
          ),
          _buildMatchHistory(
            title: "RRQ vs ONIC",
            subtitle: "Skor 0 - 2 (Selesai - MPL ID)",
            icon: Icons.shield, // Ikon representasi tim
          ),
          _buildMatchHistory(
            title: "Sentinels vs LOUD",
            subtitle: "Skor 3 - 0 (Selesai - VCT Americas)",
            icon: Icons.ads_click,
          ),
          _buildMatchHistory(
            title: "Blacklist vs Echo",
            subtitle: "Skor 1 - 2 (Selesai - MPL PH)",
            icon: Icons.military_tech,
          ),
          _buildMatchHistory(
            title: "NaVi vs FaZe Clan",
            subtitle: "Skor 16 - 10 (Selesai - PGL Major)",
            icon: Icons.gps_fixed,
          ),
          
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Helper Widget untuk ListTile agar kode tetap rapi
 Widget _buildMatchHistory({required String title, required String subtitle, required IconData icon}) {
  return Card(
    color: const Color(0xFF1E222A),
    margin: const EdgeInsets.symmetric(vertical: 4),
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.cyanAccent.withValues(alpha: 0.1),
        child: Icon(icon, color: Colors.cyanAccent),
      ),
      title: Text(
        title, 
        style: const TextStyle(
          fontWeight: FontWeight.bold, 
          color: Colors.white, // WAJIB: Ganti ke putih agar terlihat
        ),
      ),
      subtitle: Text(
        subtitle, 
        style: const TextStyle(
          color: Colors.white70, // Ganti ke putih agak pudar
          fontSize: 12,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.cyanAccent),
    ),
  );
}
}