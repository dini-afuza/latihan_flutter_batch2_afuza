import 'package:flutter/material.dart';

class ScoreGGApp extends StatelessWidget {
  const ScoreGGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Score-GG',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050B18),

      // APP BAR
      appBar: AppBar(
        backgroundColor: const Color(0xFF050B18),
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.white),
        title: Row(
          children: const [
            Icon(
              Icons.gamepad,
              color: Colors.orange,
            ),
            SizedBox(width: 8),
            Text(
              "SCORE-GG",
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // PROFILE CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF1E293B),
                      Color(0xFFFF6B00),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [

                    // ICON USER
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(width: 20),

                    // USER INFO
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [

                          Text(
                            "Muhammad Dini Afuza",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 8),

                          Text(
                            "Premium Member",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),

                          SizedBox(height: 6),

                          Text(
                            "Member ID : GG256789",
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // QR BUTTON
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Icon(
                        Icons.qr_code,
                        color: Colors.orange,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // MENU GRID
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 4,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 0.9,
                children: const [

                  MenuItem(
                    icon: Icons.live_tv,
                    title: "Live\nScore",
                  ),

                  MenuItem(
                    icon: Icons.emoji_events,
                    title: "Turnamen",
                  ),

                  MenuItem(
                    icon: Icons.calendar_month,
                    title: "Jadwal",
                  ),

                  MenuItem(
                    icon: Icons.flag,
                    title: "Hasil",
                  ),

                  MenuItem(
                    icon: Icons.star,
                    title: "Favorit",
                  ),

                  MenuItem(
                    icon: Icons.bar_chart,
                    title: "Ranking",
                  ),

                  MenuItem(
                    icon: Icons.newspaper,
                    title: "Berita",
                  ),

                  MenuItem(
                    icon: Icons.notifications,
                    title: "Notifikasi",
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // TITLE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Turnamen Populer",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "Lihat Semua",
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // TOURNAMENT LIST
              SizedBox(
                height: 210,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [

                    TournamentCard(
                      title: "MPL Indonesia",
                      subtitle: "Season 17",
                      status: "LIVE",
                    ),

                    TournamentCard(
                      title: "VCT Champions",
                      subtitle: "2026",
                      status: "LIVE",
                    ),

                    TournamentCard(
                      title: "PMGC",
                      subtitle: "2026",
                      status: "UPCOMING",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // LIVE MATCH
              const Text(
                "Live Match",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 18),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF111827),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "MPL Indonesia S17",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),

                        Text(
                          "LIVE",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [

                        TeamItem(name: "ONIC"),

                        Text(
                          "2 - 1",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        TeamItem(name: "RRQ"),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF111827),
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white54,
        currentIndex: 0,
        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: "Turnamen",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorit",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Akun",
          ),
        ],
      ),
    );
  }
}

// MENU ITEM
class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Icon(
            icon,
            color: Colors.orange,
            size: 34,
          ),

          const SizedBox(height: 10),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

// TOURNAMENT CARD
class TournamentCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String status;

  const TournamentCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: status == "LIVE"
                  ? Colors.red
                  : Colors.orange,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              status,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Spacer(),

          const Icon(
            Icons.gamepad,
            size: 50,
            color: Colors.orange,
          ),

          const SizedBox(height: 20),

          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}

// TEAM ITEM
class TeamItem extends StatelessWidget {
  final String name;

  const TeamItem({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(
            Icons.security,
            color: Colors.white,
            size: 38,
          ),
        ),

        const SizedBox(height: 10),

        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}