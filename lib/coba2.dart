import 'package:flutter/material.dart';

class ScoreGG extends StatelessWidget {
  const ScoreGG({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Memastikan Material Icons diaktifkan
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F1014),
        primaryColor: Colors.cyanAccent,
        colorScheme: const ColorScheme.dark(
          primary: Colors.cyanAccent,
        ),
      ),
      home: ScoreGGTaskPage(),
    );
  }
}

class ScoreGGTaskPage extends StatelessWidget {
  ScoreGGTaskPage({super.key});

  final List<Map<String, String>> galleryItems = [
    {'title': 'Valorant', 'img': 'https://placehold.jp/24/00d4ff/ffffff/200x200.png?text=VALORANT'},
    {'title': 'Dota 2', 'img': 'https://placehold.jp/24/00d4ff/ffffff/200x200.png?text=DOTA+2'},
    {'title': 'MLBB', 'img': 'https://placehold.jp/24/00d4ff/ffffff/200x200.png?text=MLBB'},
    {'title': 'CS2', 'img': 'https://placehold.jp/24/00d4ff/ffffff/200x200.png?text=CS2'},
    {'title': 'LoL', 'img': 'https://placehold.jp/24/00d4ff/ffffff/200x200.png?text=LOL'},
    {'title': 'PUBG', 'img': 'https://placehold.jp/24/00d4ff/ffffff/200x200.png?text=PUBG'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SCORE-GG: Registrasi & Galeri', 
          style: TextStyle(color: Color.fromARGB(255, 238, 247, 247), fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF1A1D23),
        centerTitle: true,
      ),
      // 1. AREA SCROLL UTAMA
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Formulir Member Pro", 
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 14, 13, 13))),
            const SizedBox(height: 16),

            // 2. FORMULIR INPUT DATA
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Nama Lengkap',
                labelStyle: const TextStyle(color: Colors.grey),
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.person, color: Color.fromARGB(255, 13, 14, 14)), // Ikon dipertegas warnanya
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade800)),
              ),
            ),
            const SizedBox(height: 12),

            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Email @score.gg',
                labelStyle: const TextStyle(color: Colors.grey),
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.email, color: Color.fromARGB(255, 13, 14, 14)),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade800)),
              ),
            ),
            const SizedBox(height: 12),

            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: const TextStyle(color: Colors.grey),
                border:const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.key, color: Color.fromARGB(255, 10, 10, 10),),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade800),
                 ) 
              ) ,
            ),
            const SizedBox(height: 12,),

            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'No. HP / Discord ID',
                labelStyle: const TextStyle(color: Colors.grey),
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.phone_android, color: Color.fromARGB(255, 13, 14, 14)),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade800)),
              ),
            ),
            const SizedBox(height: 12),

            TextField(
              maxLines: 3,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Deskripsi Role',
                labelStyle: const TextStyle(color: Colors.grey),
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.sports_esports, color: Color.fromARGB(255, 10, 10, 10)),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade800)),
              ),
            ),
            
            const SizedBox(height: 24),
            const Text("Katalog Game Populer", 
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 20, 20, 20))),
            const SizedBox(height: 16),

            // 3. GALERI GRID
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true, // 4. INTEGRASI SCROLL
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Image.asset('assets/images/valorant.png', fit: BoxFit.cover),
                Image.asset('assets/images/dota 2.png', fit: BoxFit.cover),
                Image.asset('assets/images/mlbb.png', fit: BoxFit.cover),
                Image.asset('assets/images/cs 2.png', fit: BoxFit.cover),
                Image.asset('assets/images/lol.png', fit: BoxFit.cover),
                Image.asset('assets/images/pubg.png', fit: BoxFit.cover),
              ],
            ),
                Stack( // 5. OVERLAY LABEL MENGGUNAKAN STACK
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(item['img']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0, left: 0, right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.7), // Kompatibilitas lebih luas
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: Text(
                          item['title']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                );
              }).(),
            ),
            const SizedBox(height: 24),
            
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyanAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                ),
                onPressed: () {}, 
                child: const Text("DAFTAR SEKARANG", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
              ),
            ),
            const SizedBox(height: 20),
          ],
        )  
  }
}