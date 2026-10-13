import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
class KartuNama extends StatelessWidget {
  const KartuNama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
            child: CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/fotoaja.jpg'),
            ),
            ),
            SizedBox(height: 10),
              Text(
                'Acep Taslim Suherman',
                style: GoogleFonts.zhiMangXing(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),

              SizedBox(height: 10),
              Text(
                'Mahasiswa',
                style: GoogleFonts.zhiMangXing(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),

              SizedBox(height: 10),
              Text(
                'Teknik Informatika',
                style: GoogleFonts.zhiMangXing(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 10
                ),
                color: const Color.fromARGB(255, 72, 0, 167),
                child: ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.tiktok,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Atasky9',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.inknutAntiqua(
                      color: const Color.fromARGB(255, 251, 251, 251),
                      fontSize: 15,
                    ),
                    
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 10
                ),
                color: const Color.fromARGB(255, 72, 0, 167),
                child: ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.instagram,
                    color: Colors.black,
                  ),
                  title: Text(
                    '@aceptaslims',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.inknutAntiqua(
                      color: const Color.fromARGB(255, 251, 251, 251),
                      fontSize: 15,
                    ),
                    
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 10
                ),
                color: const Color.fromARGB(255, 72, 0, 167),
                child: ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.black,
                  ),
                  title: Text(
                    '0987654321',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.inknutAntiqua(
                      color: const Color.fromARGB(255, 251, 251, 251),
                      fontSize: 15,
                    ),
                    
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 10
                ),
                color: const Color.fromARGB(255, 72, 0, 167),
                child: ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.black,
                  ),
                  title: Text(
                    'taslim',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.inknutAntiqua(
                      color: const Color.fromARGB(255, 251, 251, 251),
                      fontSize: 15,
                    ),
                    
                  ),
                ),
              ),
              
          ],
        )
      
      ),
    );
  }
}