import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1014), // Background gelap konsisten
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 1. LOGO & JUDUL
              const Icon(Icons.sports_esports, size: 80, color: Colors.cyanAccent),
              const SizedBox(height: 20),
              const Text(
                "SCORE-GG",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyanAccent,
                  letterSpacing: 2,
                ),
              ),
              const Text(
                "Level up your game tracking",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(height: 50),

              // 2. INPUT USERNAME/EMAIL
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF1A1D23),
                  hintText: "Email or Username",
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.person_outline, color: Colors.cyanAccent),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // 3. INPUT PASSWORD
              TextField(
                obscureText: true, // Menyembunyikan karakter password
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF1A1D23),
                  hintText: "Password",
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.lock_outline, color: Colors.cyanAccent),
                  suffixIcon: const Icon(Icons.visibility_off, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              // FORGOT PASSWORD
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Forgot Password?", style: TextStyle(color: Colors.cyanAccent)),
                ),
              ),
              const SizedBox(height: 20),

              // 4. TOMBOL LOGIN
              SizedBox(
  width: double.infinity,
  height: 55,
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.cyanAccent, // Warna latar belakang tombol (sesuai gambar)
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Membuat sudut tombol tumpul
      ),
    ),
    onPressed: () {
      // Navigasi ke halaman utama (ScoreGGHistoryPage)
      // Navigator.push(context, MaterialPageRoute(builder: (context) => const ScoreGGHistoryPage()));
    },
    // BAGIAN CHILD YANG DIUBAH
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center, // Menengahkan konten Row
      children: [
        Icon(
          Icons.home, // Menampilkan logo rumah
          color: Colors.black, // Warna ikon hitam agar kontras dengan cyan
        ),
        SizedBox(width: 10), // Memberikan jeda spasi horizontal antara ikon dan teks
        Text(
          "LOGIN", // Tulisan pada tombol
          style: TextStyle(
            color: Colors.black, // Warna teks hitam
            fontWeight: FontWeight.bold, // Membuat teks tebal
            fontSize: 18, // Ukuran teks
          ),
        ),
      ],
    ),
  ),
),
              // 5. FOOTER (REGISTER)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("New User?", style: TextStyle(color: Colors.white)),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Create Account", style: TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}