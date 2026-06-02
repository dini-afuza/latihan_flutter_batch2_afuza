import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// =============================================================================
// 1. MODEL CLASS (User Model)
// =============================================================================
class User {
  final int? id;
  final String nama;
  final String email;
  final String noHp;
  final String asalKota;

  User({
    this.id,
    required this.nama,
    required this.email,
    required this.noHp,
    required this.asalKota,
  });

  // Mengubah Objek User menjadi Map (Untuk disimpan ke Database)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'email': email,
      'noHp': noHp,
      'asalKota': asalKota,
    };
  }

  // Mengubah Map dari Database menjadi Objek User (Untuk ditampilkan ke UI)
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      nama: map['nama'],
      email: map['email'],
      noHp: map['noHp'],
      asalKota: map['asalKota'],
    );
  }
}

// =============================================================================
// 2. DATABASE HELPER (Pola Singleton)
// =============================================================================
class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('pendaftaran.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT NOT NULL,
        email TEXT NOT NULL,
        noHp TEXT NOT NULL,
        asalKota TEXT NOT NULL
      )
    ''');
  }

  // Fungsi Insert Data
  Future<int> insertUser(User user) async {
    final db = await instance.database;
    return await db.insert('users', user.toMap());
  }

  // Fungsi Query/Ambil Semua Data
  Future<List<User>> getAllUsers() async {
    final db = await instance.database;
    final result = await db.query('users', orderBy: 'id DESC');

    return result.map((json) => User.fromMap(json)).toList();
  }

  // Tambahan: Fungsi hapus data (opsional, untuk mempermudah pengujian)
  Future<int> deleteUser(int id) async {
    final db = await instance.database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }
}

// =============================================================================
// 3. UI Halaman Utama & Form Pendaftaran
// =============================================================================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pendaftaran Peserta SQFLITE',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.deepOrangeAccent,
        scaffoldBackgroundColor: const Color(0xFFF8F7FC),
      ),
      home: const PendaftaranPage(),
    );
  }
}

class PendaftaranPage extends StatefulWidget {
  const PendaftaranPage({super.key});

  @override
  State<PendaftaranPage> createState() => _PendaftaranPageState();
}

class _PendaftaranPageState extends State<PendaftaranPage> {
  // GlobalKey untuk validasi Form
  final _formKey = GlobalKey<FormState>();

  // TextEditingController sesuai instruksi teknis
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _noHpController = TextEditingController();
  final TextEditingController _kotaController = TextEditingController();

  // Stream/Future variabel untuk menampung data list pendaftar
  late Future<List<User>> _userList;

  @override
  void initState() {
    super.initState();
    _refreshUserList(); // Memuat data awal saat aplikasi dibuka
  }

  // Mengambil data terbaru dari DB untuk memperbarui UI secara real-time
  void _refreshUserList() {
    setState(() {
      _userList = DatabaseHelper.instance.getAllUsers();
    });
  }

  // Proses simpan data ke database
  void _simpanData() async {
    if (_formKey.currentState!.validate()) {
      // Membuat objek user dari inputan form
      final newUser = User(
        nama: _namaController.text.trim(),
        email: _emailController.text.trim(),
        noHp: _noHpController.text.trim(),
        asalKota: _kotaController.text.trim(),
      );

      // Panggil helper untuk insert ke DB
      await DatabaseHelper.instance.insertUser(newUser);

      // Bersihkan form input setelah sukses
      _namaController.clear();
      _emailController.clear();
      _noHpController.clear();
      _kotaController.clear();

      // Berikan notifikasi sukses
      if (!mounted) return;
      ScaffoldMessenger.of(this.context).showSnackBar(
        const SnackBar(content: Text('🎉 Pendaftaran Berhasil Disimpan!')),
      );

      // Perbarui list secara real-time setelah data disimpan
      _refreshUserList();
    }
  }

  @override
  void dispose() {
    // Menghindari kebocoran memori (memory leak)
    _namaController.dispose();
    _emailController.dispose();
    _noHpController.dispose();
    _kotaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SCORE-GG REGISTRATION',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        backgroundColor: const Color.fromARGB(255, 245, 245, 252),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // =================================================================
            // FORM INPUT (Card Atas)
            // =================================================================
            Form(
              key: _formKey,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _namaController,
                        decoration: const InputDecoration(
                          labelText: 'Nama Lengkap',
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                        validator: (value) => value == null || value.isEmpty
                            ? 'Nama tidak boleh kosong'
                            : null,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email tidak boleh kosong';
                          }
                          if (!value.contains('@')) {
                            return 'Format email tidak valid';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _noHpController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: 'Nomor HP',
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                        validator: (value) => value == null || value.isEmpty
                            ? 'Nomor HP tidak boleh kosong'
                            : null,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _kotaController,
                        decoration: const InputDecoration(
                          labelText: 'Asal Kota',
                          prefixIcon: Icon(
                            Icons.location_city,
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                        validator: (value) => value == null || value.isEmpty
                            ? 'Asal kota tidak boleh kosong'
                            : null,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton.icon(
                          onPressed: _simpanData,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrangeAccent,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: const Icon(Icons.save),
                          label: const Text(
                            'DAFTAR SEKARANG',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Header List
            const Row(
              children: [
                Icon(Icons.people, color: Colors.deepOrangeAccent),
                SizedBox(width: 10),
                Text(
                  'Daftar Peserta Terdaftar',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(color: Colors.white24, thickness: 1),
            const SizedBox(height: 10),

            // =================================================================
            // REAL-TIME LIST (FutureBuilder & ListView.builder)
            // =================================================================
            Expanded(
              child: FutureBuilder<List<User>>(
                future: _userList,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.deepOrangeAccent,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Terjadi kesalahan: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text(
                        'Belum ada peserta yang mendaftar.',
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  }

                  final dataPeserta = snapshot.data!;

                  return ListView.builder(
                    itemCount: dataPeserta.length,
                    itemBuilder: (context, index) {
                      final item = dataPeserta[index];
                      return Card(
                        color: const Color.fromARGB(255, 243, 243, 250),
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.white10),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.deepOrangeAccent.withValues(
                              alpha: 0.2,
                            ),
                            child: Text(
                              item.nama[0].toUpperCase(),
                              style: const TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          title: Text(
                            item.nama,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('📧 ${item.email}'),
                              Text('📞 ${item.noHp} | 📍 ${item.asalKota}'),
                            ],
                          ),
                          isThreeLine: true,
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.redAccent,
                            ),
                            onPressed: () async {
                              if (item.id != null) {
                                await DatabaseHelper.instance.deleteUser(
                                  item.id!,
                                );
                                _refreshUserList(); // Memperbarui daftar pendaftar
                              }
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
