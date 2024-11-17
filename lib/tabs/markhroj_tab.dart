import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_tajwid/models/makhroj.dart';
import 'package:url_launcher/url_launcher.dart';

class MarkhrojTab extends StatelessWidget {
  const MarkhrojTab({Key? key}) : super(key: key);

  // Fetch Makhroj data from JSON file
  Future<Makhroj> _getMakhrojData() async {
    try {
      String data =
          await rootBundle.loadString('assets/datas/list-makhroj.json');
      return makhrojFromJson(data); // Parse JSON data into Makhroj object
    } catch (e) {
      throw Exception('Failed to load Makhroj data');
    }
  }

  // Function to launch Google Drive URL
  Future<void> _goToGoogleDrive() async {
    const url =
        'https://drive.google.com/file/d/17fKJXYJ9pgj5xKCoN3AyaL3L7qQcqtht';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Markhroj Tab'),
        actions: [
          IconButton(
            icon: const Icon(Icons.open_in_browser),
            onPressed: _goToGoogleDrive,
            tooltip: 'Open Google Drive',
          ),
        ],
      ),
      body: FutureBuilder<Makhroj>(
        future: _getMakhrojData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error fetching data: ${snapshot.error}',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.makhrojHuruf.isEmpty) {
            return Center(
              child: Text(
                'No data available',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            );
          } else {
            Makhroj makhroj = snapshot.data!;
            return ListView.builder(
              itemCount: makhroj.makhrojHuruf.length,
              itemBuilder: (context, index) {
                MakhrojHuruf huruf = makhroj.makhrojHuruf[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.blueGrey[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            huruf.ayat,
                            style: GoogleFonts.amiri(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                      subtitle: Text(
                        huruf.arti,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToGoogleDrive,
        tooltip: 'Open Google Drive',
        child: const Icon(Icons.cloud),
      ),
    );
  }
}
