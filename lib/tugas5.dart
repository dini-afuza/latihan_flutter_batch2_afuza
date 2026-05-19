import 'package:flutter/material.dart';

class ScoreGGApp extends StatelessWidget {
  const ScoreGGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(
          0xFF0F1014,
        ), // Background gelap Score-GG
        primaryColor: Colors.cyanAccent,
      ),
      home: const ScoreGGInteractionPage(),
    );
  }
}

// WAJIB: Menggunakan StatefulWidget untuk mengelola perubahan state/tampilan
class ScoreGGInteractionPage extends StatefulWidget {
  const ScoreGGInteractionPage({super.key});

  @override
  State<ScoreGGInteractionPage> createState() => _ScoreGGInteractionPageState();
}

class _ScoreGGInteractionPageState extends State<ScoreGGInteractionPage> {
  // ------------------ VARIABLE STATE ------------------
  bool _showDevText = false; // State untuk ElevatedButton
  bool _isFavorited = false; // State untuk IconButton
  bool _showExtraDescription = false; // State untuk TextButton
  int _tournamentPoints = 10; // State Counter untuk GestureDetector & FAB
  String _inkWellMessage = ""; // State untuk InkWell

  @override
  // ignore_for_file: avoid_print
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SCORE-GG: Lab Interaksi',
          style: TextStyle(
            color: Colors.cyanAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF1A1D23),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // =================================================================
            // 1. ELEVATEDBUTTON - Aksi Toggle Teks Rahasia Developer
            // =================================================================
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyanAccent,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: () {
                setState(() {
                  _showDevText = !_showDevText; // Toggle Nilai True/False
                });
              },
              icon: const Icon(Icons.code),
              label: const Text(
                "Cek Pesan Developer",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            if (_showDevText) ...[
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E222A),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "🎮 Halo Afuza! Saya Developer Score-GG. Selamat menonton live stream!",
                  style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
            const SizedBox(height: 24),

            // =================================================================
            // 2. ICONBUTTON - Perubahan State Warna Favorit Tim
            // =================================================================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // PERBAIKAN UTAMA: Dibungkus dengan Expanded agar teks tidak menabrak tombol hati
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Ikuti Tim Favorit (Onic):",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _isFavorited ? "Tersimpan di Favorit!" : "Sukai Tim",
                        style: TextStyle(
                          color: _isFavorited ? Colors.redAccent : Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                // Tombol hati diposisikan di paling kanan Row
                IconButton(
                  iconSize: 32,
                  icon: Icon(
                    _isFavorited ? Icons.favorite : Icons.favorite_border,
                    color: _isFavorited ? Colors.redAccent : Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _isFavorited =
                          !_isFavorited; // Logika klik untuk mengubah warna hati
                    });
                  },
                ),
              ],
            ),
            const Divider(color: Colors.white10),
            const SizedBox(height: 12),
            // =================================================================
            // 3. TEXTBUTTON - Menampilkan Informasi Tambahan Aplikasi
            // =================================================================
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                style: TextButton.styleFrom(foregroundColor: Colors.black),
                onPressed: () {
                  setState(() {
                    _showExtraDescription = !_showExtraDescription;
                  });
                },
                icon: Icon(
                  _showExtraDescription ? Icons.expand_less : Icons.expand_more,
                ),
                label: const Text("Lihat Detail Aturan Turnamen"),
              ),
            ),
            if (_showExtraDescription) ...[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Text(
                  "Setiap tim profesional yang terdaftar di aplikasi Score-GG wajib mengikuti aturan fair play. Poin turnamen diperbarui secara real-time berdasarkan performa kemenangan di arena pertandingan.",
                  style: TextStyle(
                    color: Color.fromARGB(179, 7, 7, 7),
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ),
            ],
            const SizedBox(height: 24),

            // =================================================================
            // 4. INKWELL - Efek Splash & Print Log Debug
            // =================================================================
            const Text(
              "Kotak Hadiah Harian (Klik Untuk Klaim):",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Card(
              clipBehavior: Clip.antiAlias,
              color: const Color(0xFF1E222A),
              child: InkWell(
                // PERBAIKAN WARNING: Mengganti withOpacity menjadi withValues
                splashColor: Colors.cyanAccent.withValues(alpha: 0.3),

                // PERBAIKAN UTAMA 1: Mengubah onPressed menjadi onTap
                onTap: () {
                  print(
                    'Sentuhan terdeteksi: Afuza telah mengklaim item harian!',
                  );
                  setState(() {
                    _inkWellMessage = "🎁 Berhasil mengklaim 50 GG-Coins!";
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 16,
                  ),
                  alignment: Alignment.center,
                  child: const Column(
                    children: [
                      Icon(
                        Icons.card_giftcard,
                        color: Colors.cyanAccent,
                        size: 36,
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Klaim Loot Box Anda",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (_inkWellMessage.isNotEmpty) ...[
              const SizedBox(height: 8),
              // PERBAIKAN UTAMA 2: Memindahkan textAlign keluar dari TextStyle
              Text(
                _inkWellMessage,
                style: const TextStyle(color: Colors.green),
                textAlign: TextAlign.center, // Posisi yang benar di sini
              ),
            ],
            const SizedBox(height: 24),

            // =================================================================
            // 5. GESTUREDETECTOR - Multi-Gesture Counter Poin Turnamen
            // =================================================================
            const Text(
              "Papan Skor Interaktif (Detektor Gestur):",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                print("Ditekan sekali");
                setState(() {
                  _tournamentPoints += 1; // Logika Angka +1
                });
              },
              onDoubleTap: () {
                print("Ditekan dua kali");
                setState(() {
                  _tournamentPoints += 2; // Logika Angka +2
                });
              },
              onLongPress: () {
                print("Tahan lama");
                setState(() {
                  _tournamentPoints += 3; // Logika Angka +3
                });
              },
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1E1E26), Color(0xFF2B2B36)],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.cyanAccent.withValues(alpha: 0.5),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      "$_tournamentPoints",
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyanAccent,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Ketuk: +1 | Ketuk 2x: +2 | Tahan Lama: +3",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ), // Jarak spasi ekstra di bawah agar tidak tertutup FAB
          ],
        ),
      ),

      // =======================================================================
      // 6. FLOATINGACTIONBUTTON - Mengurangi Nilai Counter (Decrement)
      // =======================================================================
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyanAccent,
        foregroundColor: Colors.black,
        onPressed: () {
          setState(() {
            _tournamentPoints--; // Logika Mengurangi Angka Poin di atas
          });
        },
        child: const Icon(Icons.remove), // Simbol minus untuk mengurangi
      ),
    );
  }
}
