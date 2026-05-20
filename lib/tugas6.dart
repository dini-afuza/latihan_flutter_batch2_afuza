import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isObscure = true;
  String _errorMessage = "";

  void _loginValidation() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    const String validEmail = "admin@score.gg";
    const String validPassword = "p37799";

    setState(() {
      if (email.isEmpty || password.isEmpty) {
        _errorMessage = "❌ Email dan Password tidak boleh kosong!";
      } else if (email == validEmail && password == validPassword) {
        _errorMessage = "";
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("🎉 Login Berhasil!")));
      } else {
        _errorMessage =
            "❌ Email atau Password salah. Silahkan periksa kembali!";
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Widget Helper untuk membuat Tombol Social Login secara rapi
  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required Color color,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          backgroundColor: color,
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ), // Gaya kapsul melingkar
        ),
        onPressed: onTap,
        icon: Icon(icon, color: textColor, size: 20),
        label: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1014),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              // Logo & Judul Utama
              const Icon(
                Icons.sports_esports,
                size: 80,
                color: Colors.deepOrangeAccent,
              ),
              const SizedBox(height: 15),
              const Text(
                "SCORE-GG",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent,
                  letterSpacing: 2,
                ),
              ),
              const Text(
                "Level up your game tracking",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const SizedBox(height: 35),

              // Notifikasi Error
              if (_errorMessage.isNotEmpty) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.redAccent.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.redAccent, width: 1),
                  ),
                  child: Text(
                    _errorMessage,
                    style: const TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],

              // Input Username / Email
              TextField(
                controller: _emailController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF1E1E26),
                  hintText: "Email or Username",
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(
                    Icons.person_outline,
                    color: Colors.deepOrangeAccent,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Input Password
              TextField(
                controller: _passwordController,
                obscureText: _isObscure,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF1E1E26),
                  hintText: "Password",
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Colors.deepOrangeAccent,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              // Link Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Tombol LOGIN Utama
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _loginValidation,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home, color: Colors.black),
                      SizedBox(width: 10),
                      Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // ===============================================================
              // SEPARATOR "OR CONTINUE WITH"
              // ===============================================================
              const Row(
                children: [
                  Expanded(child: Divider(color: Colors.white24, thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      "or continue with",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.white24, thickness: 1)),
                ],
              ),
              const SizedBox(height: 20),

              // ===============================================================
              // TOMBOL SOCIAL OAUTH LOGIN
              // ===============================================================

              // 1. Tombol Google
              _buildSocialButton(
                icon: Icons
                    .g_mobiledata_rounded, // Menggunakan icon bawaan material yang mirip
                label: "Continue with Google",
                color: Colors.white,
                textColor: Colors.black87,
                onTap: () {
                  debugPrint("Login via Google dipicu");
                },
              ),
              const SizedBox(height: 12),

              // 2. Tombol Discord
              _buildSocialButton(
                icon: Icons.discord,
                label: "Continue with Discord",
                color: const Color(0xFF5865F2), // Warna Biru Khas Discord
                textColor: Colors.white,
                onTap: () {
                  debugPrint("Login via Discord dipicu");
                },
              ),
              const SizedBox(height: 12),

              // 3. Tombol Steam (Sangat cocok untuk Aplikasi Game Tracking)
              _buildSocialButton(
                icon: Icons.videogame_asset,
                label: "Continue with Steam",
                color: const Color.fromARGB(255, 9, 152, 247), // Warna Steam
                textColor: Colors.white,
                onTap: () {
                  debugPrint("Login via Steam dipicu");
                },
              ),
              const SizedBox(height: 30),

              // Footer Menuju Registrasi
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "New player?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Create Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
