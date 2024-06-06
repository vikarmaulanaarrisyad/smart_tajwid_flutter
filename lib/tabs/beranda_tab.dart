import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_tajwid/models/sifathuruf.dart'; // Perbaiki import model

class BerandaTab extends StatelessWidget {
  const BerandaTab({Key? key}) : super(key: key);

  // Fetch SifatHuruf data from JSON file
  Future<SifatHuruf> _getSifatHurufData() async {
    String data =
        await rootBundle.loadString('assets/datas/list-sifat-huruf.json');
    return sifatHurufFromJson(data); // Parse JSON data into SifatHuruf object
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SifatHuruf>(
      future: _getSifatHurufData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error fetching data'));
        } else {
          SifatHuruf sifatHuruf = snapshot.data!;
          return ListView.builder(
            itemCount: sifatHuruf.sifatHuruf.length,
            itemBuilder: (context, index) {
              SifatHurufElement huruf = sifatHuruf.sifatHuruf[index];
              return ListTile(
                title: Text(
                  huruf.arabic,
                  style: GoogleFonts.amiri(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  huruf.indonesian,
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
