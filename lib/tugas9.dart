import 'package:flutter/material.dart';

class ScoreGGApp extends StatelessWidget {
  const ScoreGGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SCORE-GG',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F1014),
        primaryColor: Colors.deepOrangeAccent,
        colorScheme: const ColorScheme.dark(primary: Colors.deepOrangeAccent),
      ),
      home: const MainPageNavigator(),
    );
  }
}

// =============================================================================
// MAIN NAVIGATOR (MENGATUR BOTTOM NAVIGATION BAR & DRAWER)
// =============================================================================
class MainPageNavigator extends StatefulWidget {
  const MainPageNavigator({super.key});

  @override
  State<MainPageNavigator> createState() => _MainPageNavigatorState();
}

class _MainPageNavigatorState extends State<MainPageNavigator> {
  int _currentIndex = 0;
  final bool =
      true; // Dikunci true untuk mempertahankan estetika SCORE-GG Gaming Hub

  @override
  Widget build(BuildContext context) {
    // List Halaman: Tab 1 memuat List Multi-Level, Tab 2 memuat Informasi Statis
    final List<Widget> pages = [const HomeTab(), const AboutTab()];

    return Scaffold(
      backgroundColor: const Color(0xFF0F1014),

      // 1. APP BAR
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E26),
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          _currentIndex == 0 ? "SCORE-GG: Kategori Produk" : "Tentang Aplikasi",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      // 2. LOGIKA DRAWER: Hanya aktif di Tab Home (Index 0)
      drawer: _currentIndex == 0
          ? Drawer(
              backgroundColor: const Color(0xFF14161D),
              child: Column(
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xFF1E1E26),
                      border: Border(
                        bottom: BorderSide(color: Colors.white24, width: 1),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.sports_esports,
                          color: Colors.deepOrangeAccent,
                          size: 40,
                        ),
                        SizedBox(width: 12),
                        Text(
                          "SCORE-GG\nKategori Menu",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    key: Key('drawer_info'),
                    child: Text(
                      "Gunakan TabBar di halaman utama untuk melihat Level 1, Level 2, dan Level 3.",
                      style: TextStyle(color: Colors.white60, fontSize: 14),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.stars,
                      color: Colors.deepOrangeAccent,
                    ),
                    title: const Text(
                      "Kembali Ke Home",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
            )
          : null,

      // 3. BODY
      body: pages[_currentIndex],

      // 4. BOTTOM NAVIGATION BAR
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: const Color(0xFF1E1E26),
        selectedItemColor: Colors.deepOrangeAccent,
        unselectedItemColor: Colors.white60,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Tentang'),
        ],
      ),
    );
  }
}

// =============================================================================
// MODEL CLASS UNTUK LEVEL 3 (PROFESSIONAL LEVEL)
// =============================================================================
class GameProduct {
  final String name;
  final String imageUrl;
  final String description;
  final String price;

  GameProduct({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
  });
}

// =============================================================================
// TAB 1: HOME TAB (MENAMPILKAN 3 LEVEL LIST MENGGUNAKAN TABBAR)
// =============================================================================
class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  // --- DATA LEVEL 1: List<String> berisi minimal 10 nama kategori dari lampiran
  final List<String> _level1Data = [
    'Elektronik (Gaming Gear)',
    'Pakaian Pria (Jersey Esports)',
    'Alat Tulis Kantor',
    'Buku & Majalah Game',
    'Makanan Ringan (Camilan Gamer)',
    'Minuman (Energy Drink)',
    'Mainan Anak / Action Figure',
    'Peralatan Olahraga',
    'Voucher & Tiket Turnamen',
    'Barang Bekas (Secondhand Console)',
  ];

  // --- DATA LEVEL 2: List<Map<String, dynamic>> menyimpan Nama & Ikon relevan
  final List<Map<String, dynamic>> _level2Data = [
    {'nama': 'Buah-buahan', 'icon': Icons.apple},
    {'nama': 'Sayuran', 'icon': Icons.grass},
    {'nama': 'Elektronik', 'icon': Icons.computer},
    {'nama': 'Pakaian Pria', 'icon': Icons.checkroom},
    {'nama': 'Pakaian Wanita', 'icon': Icons.style},
    {'nama': 'Alat Tulis Kantor', 'icon': Icons.edit},
    {'nama': 'Buku & Majalah', 'icon': Icons.menu_book},
    {'nama': 'Peralatan Dapur', 'icon': Icons.soup_kitchen},
    {'nama': 'Makanan Ringan', 'icon': Icons.cookie},
    {'nama': 'Minuman', 'icon': Icons.local_drink},
  ];

  // --- DATA LEVEL 3: List dari Model Class (Tema: Top-Up / In-Game Items SCORE-GG)
  final List<GameProduct> _level3Data = [
    GameProduct(
      name: "720 Diamonds Mobile Legends",
      imageUrl:
          "https://images.unsplash.com/photo-1551103782-8ab07afd45c1?w=500&q=80",
      description:
          "Paket Diamond legal untuk membeli Skin Epic, Lightborn, atau Collector impian Anda.",
      price: "Rp 165.000",
    ),
    GameProduct(
      name: "1000 Valorant Points",
      imageUrl:
          "https://images.unsplash.com/photo-1542751371-adc38448a05e?w=500&q=80",
      description:
          "Poin resmi Valorant untuk membuka akses Battlepass atau membeli Skin Kuronami / Prime.",
      price: "Rp 135.000",
    ),
    GameProduct(
      name: "Steam Wallet Code IDR 250k",
      imageUrl:
          "https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=500&q=80",
      description:
          "Kode saldo instan untuk membeli game-game PC terbaik dan terbaru di platform Steam.",
      price: "Rp 265.000",
    ),
    GameProduct(
      name: "Genesis Crystals 980 Genshin",
      imageUrl:
          "https://images.unsplash.com/photo-1538481199705-c710c4e965fc?w=500&q=80",
      description:
          "Kristal premium Teyvat untuk melakukan gacha karakter bintang 5 kesukaan Anda.",
      price: "Rp 210.000",
    ),
    GameProduct(
      name: "Free Fire 1050 Diamonds",
      imageUrl:
          "https://images.unsplash.com/photo-1511512578047-dfb367046420?w=500&q=80",
      description:
          "Diamond instan FF murah untuk spin bundle legendaris dan upgrade skin senjata.",
      price: "Rp 140.000",
    ),
    GameProduct(
      name: "PUBG Mobile 660 UC",
      imageUrl:
          "https://images.unsplash.com/photo-1552820728-8b83bb6b773f?w=500&q=80",
      description:
          "Unknown Cash resmi untuk membuka Royale Pass musim terbaru dan skin eksklusif.",
      price: "Rp 150.000",
    ),
    GameProduct(
      name: "PlayStation Network Card IDR 200k",
      imageUrl:
          "https://images.unsplash.com/photo-1606144042614-b2417e99c4e3?w=500&q=80",
      description:
          "Top-up dompet digital PSN Store Indonesia untuk membeli game PS4 / PS5 secara digital.",
      price: "Rp 205.000",
    ),
    GameProduct(
      name: "Nintendo eShop Card \$20",
      imageUrl:
          "https://images.unsplash.com/photo-1566241477600-ac026ad43874?w=500&q=80",
      description:
          "Beli game indie dan game andalan Nintendo Switch langsung melalui eShop US.",
      price: "Rp 315.000",
    ),
    GameProduct(
      name: "EA Sports FC Points 1050",
      imageUrl:
          "https://images.unsplash.com/photo-1518091043644-c1d4457512c6?w=500&q=80",
      description:
          "Poin pack khusus untuk membangun tim Ultimate Team impian Anda di FC 24/25.",
      price: "Rp 145.000",
    ),
    GameProduct(
      name: "Roblox 800 Robux Card",
      imageUrl:
          "https://images.unsplash.com/photo-1585647347483-22b66260dfff?w=500&q=80",
      description:
          "Kredit Robux aman untuk membeli item, gamepass, kosmetik, atau upgrade avatar Roblox.",
      price: "Rp 160.000",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          // TAB BAR KATEGORI LEVEL PENDEKATAN
          const TabBar(
            indicatorColor: Colors.deepOrangeAccent,
            labelColor: Colors.deepOrangeAccent,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(text: "Level 1\n(Simple)", icon: Icon(Icons.list)),
              Tab(text: "Level 2\n(Map)", icon: Icon(Icons.map)),
              Tab(text: "Level 3\n(Model)", icon: Icon(Icons.stars)),
            ],
          ),

          // TAB VIEW CONTENT AREA
          Expanded(
            child: TabBarView(
              children: [
                // LEVEL 1: ListView.builder + ListTile Sederhana
                ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: _level1Data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: const Color(0xFF1E1E26),
                      margin: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      child: ListTile(
                        title: Text(
                          _level1Data[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: Colors.white30,
                        ),
                      ),
                    );
                  },
                ),

                // LEVEL 2: ListView.builder + List of Map (Nama & Ikon)
                ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: _level2Data.length,
                  itemBuilder: (context, index) {
                    final item = _level2Data[index];
                    return Card(
                      color: const Color(0xFF1E1E26),
                      margin: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.deepOrangeAccent.withValues(
                            alpha: 0.2,
                          ),
                          child: Icon(
                            item['icon'],
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                        title: Text(
                          item['nama'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          "Kategori ID: 00${index + 1}",
                          style: const TextStyle(color: Colors.white38),
                        ),
                      ),
                    );
                  },
                ),

                // LEVEL 3: ListView.builder + Custom Widget + Model Class (Professional)
                ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: _level3Data.length,
                  itemBuilder: (context, index) {
                    return ItemProduk(produk: _level3Data[index]);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// CUSTOM WIDGET UNTUK LEVEL 3 (ITEM PRODUK DENGAN CARD & GAMBAR)
// =============================================================================
class ItemProduk extends StatelessWidget {
  final GameProduct produk;

  const ItemProduk({super.key, required this.produk});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1E1E26),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bagian Banner Gambar Produk dengan placeholder jika network error
          Image.network(
            produk.imageUrl,
            height: 140,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 140,
                color: Colors.grey.shade900,
                child: const Center(
                  child: Icon(
                    Icons.broken_image,
                    color: Colors.white30,
                    size: 40,
                  ),
                ),
              );
            },
          ),
          // Bagian Detail Informasi Teks
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        produk.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      produk.price,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyanAccent,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  produk.description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white60,
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// TAB 2: ABOUT TAB (HALAMAN INFORMASI STATIS)
// =============================================================================
class AboutTab extends StatelessWidget {
  const AboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E26),
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.sports_esports,
                size: 80,
                color: Colors.deepOrangeAccent,
              ),
              SizedBox(height: 16),
              Text(
                "SCORE-GG Hub",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Aplikasi manajemen interaktif untuk kebutuhan turnamen, manajemen tim esports, pendaftaran scrim, serta katalog item voucher game.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                  height: 1.4,
                ),
              ),
              Divider(height: 32, thickness: 1, color: Colors.white12),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                key: Key('about_dev'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nama Pembuat",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white60,
                      ),
                    ),
                    Text(
                      "SCORE-GG Developer Team",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                key: Key('about_ver'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Versi Aplikasi",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white60,
                      ),
                    ),
                    Text(
                      "v3.0.0 (Tugas 9)",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
