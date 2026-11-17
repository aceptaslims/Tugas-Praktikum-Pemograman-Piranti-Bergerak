import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final List<Map<String, String>> filmData = [
  {
    'judul': 'Interstellar',
    'gambar':
        'https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
    'sutradara': 'Christopher Nolan',
    'tahun': '2014',
    'genre': 'Fiksi ilmiah, Petualangan',
    'sinopsis':
        'Sekelompok penjelajah melakukan perjalanan melintasi lubang cacing untuk mencari rumah baru bagi umat manusia.'
  },
  {
    'judul': 'Inception',
    'gambar':
        'https://image.tmdb.org/t/p/w500/9gk7adHYeDvHkCSEqAvQNLV5Uge.jpg',
    'sutradara': 'Christopher Nolan',
    'tahun': '2010',
    'genre': 'Fiksi ilmiah, Aksi',
    'sinopsis':
        'Dom Cobb adalah pencuri yang memasuki mimpi orang lain untuk mengambil rahasia. Kali ini, ia mendapat tugas untuk menanamkan sebuah ide.'
  },
  {
    'judul': 'The Dark Knight',
    'gambar':
        'https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg',
    'sutradara': 'Christopher Nolan',
    'tahun': '2008',
    'genre': 'Aksi, Kriminal',
    'sinopsis':
        'Batman menghadapi Joker, penjahat yang mengancam Gotham dan menguji batas moral para penduduknya.'
  },
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Film',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          title: Text(
            'Daftar Film',
            style: TextStyle(
              fontWeight: .bold,
              fontSize: 20
            ),
          ),
          centerTitle: true,
          foregroundColor: AppColor.lightBlue,
          backgroundColor: AppColor.primary,
          titleSpacing: 2,
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.list, color: Colors.white), text: 'List view'),
              Tab(icon: Icon(Icons.grid_on, color: Colors.white), text: 'Grid view')
            ]
          ),
        ),
        body: TabBarView(
          children: [
            buildListView(),
            membuatGrid()
          ] 
        ),
      ),
    );
  }
}

Widget buildListView(){
  return ListView.builder(
    itemCount: filmData.length,
    padding: EdgeInsets.all(10),
    itemBuilder: (context, index) {
      final item = filmData[index];
      return Card(
        elevation: 3,
        color: AppColor.secondary,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: .circular(12),
        ),
        child: InkWell(
          onTap: () => bukaDetailFilm(context, item),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Column(
              crossAxisAlignment: .center,
              children: [
                Center(
                  child: SizedBox(
                    width: 300,
                    child: buildFilmPoster(item),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                    item['judul']!,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget membuatGrid(){
  return GridView.builder(
    padding: EdgeInsets.all(10),
    itemCount: filmData.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 0.58,
    ), 
    itemBuilder: (context, index) {
      final item = filmData[index];
      return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: .circular(5),
          side: BorderSide(color: AppColor.primary),
        ),
        child: InkWell(
          onTap: () => bukaDetailFilm(context, item),
          child: Column(
            crossAxisAlignment:  CrossAxisAlignment.stretch,
            children: [
              buildFilmPoster(item),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  item['judul']!,
                  style: const TextStyle(
                    color: AppColor.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10,),
            ]
          ),
        ),
      );
    },
  );
}

Widget buildFilmPoster(Map<String, String> film) {
  return AspectRatio(
    aspectRatio: 2 / 3,
    child: Image.network(
      film['gambar']!,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return buildPosterPlaceholder(film, isLoading: true);
      },
      errorBuilder: (context, error, stackTrace) {
        return buildPosterPlaceholder(film);
      },
    ),
  );
}

Widget buildPosterPlaceholder(
  Map<String, String> film, {
  bool isLoading = false,
}) {
  return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [AppColor.lightBlue, AppColor.secondary],
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading)
          const CircularProgressIndicator(color: Colors.white)
        else
          const Icon(
            Icons.movie_creation_outlined,
            size: 56,
            color: Colors.white,
          ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            film['judul']!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}

void bukaDetailFilm(BuildContext context, Map<String, String> film) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DetailFilmPage(film: film),
    ),
  );
}


class DetailFilmPage extends StatelessWidget {
  const DetailFilmPage({super.key, required this.film});

  final Map<String, String> film;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(film['judul']!),
        foregroundColor: Colors.white,
        backgroundColor: AppColor.primary,
      ),
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(width: 220, child: buildFilmPoster(film)),
            ),
            SizedBox(height: 24),
            Text(
              'Judul Film: ${film['judul']!}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              'Sutradara: ${film['sutradara']!}',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            Text(
              'Tahun Rilis: ${film['tahun']!}',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            Text(
              'Genre: ${film['genre']!}',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            Text(
              'Sinopsis: ${film['sinopsis']!}',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}

class AppColor {
  static const Color primary = Color(0xFF1B365D);
  static const Color secondary = Color(0xFF005A9C);
  static const Color lightBlue = Color(0xFF60C1E5);
  static const Color background = Color(0xFFA0E0EF);
}
