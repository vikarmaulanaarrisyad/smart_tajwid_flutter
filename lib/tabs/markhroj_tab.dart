import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_tajwid/models/makhroj.dart';

class MarkhrojTab extends StatelessWidget {
  const MarkhrojTab({Key? key}) : super(key: key);

  // Fetch Makhroj data from JSON file
  Future<Makhroj> _getMakhrojData() async {
    String data = await rootBundle.loadString('assets/datas/list-makhroj.json');
    return makhrojFromJson(data); // Parse JSON data into Makhroj object
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Makhroj>(
      future: _getMakhrojData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error fetching data'));
        } else {
          Makhroj makhroj = snapshot.data!;
          return ListView.builder(
            itemCount: makhroj.makhrojHuruf.length,
            itemBuilder: (context, index) {
              MakhrojHuruf huruf = makhroj.makhrojHuruf[index];
              return ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      huruf.ayat,
                      style: GoogleFonts.amiri(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
                subtitle: Text(
                  textAlign: TextAlign.justify,
                  huruf.arti,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
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
