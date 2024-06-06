import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_tajwid/globals.dart';
import 'package:smart_tajwid/models/tajwid.dart';
import 'package:smart_tajwid/screens/detail_screen.dart';

class TajwidTab extends StatelessWidget {
  const TajwidTab({Key? key});

  // Fetch Tajwid data from JSON file
  Future<List<Tajwid>> _getTajwidData() async {
    String data = await rootBundle.loadString('assets/datas/list-tajwid.json');
    return tajwidFromJson(data); // Parse JSON data into List<Tajwid>
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Tajwid>>(
      future: _getTajwidData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error loading data'));
        }

        return ListView.separated(
          itemBuilder: (context, index) => _tajwidItem(
            tajwid: snapshot.data!.elementAt(index),
            context: context,
          ),
          itemCount: snapshot.data!.length,
          separatorBuilder: (context, index) => Divider(
            color: const Color(0xFF7B80AD).withOpacity(.35),
          ),
        );
      },
    );
  }

  Widget _tajwidItem({required Tajwid tajwid, required BuildContext context}) =>
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailScreen(
              tajwid: tajwid,
            ),
          ));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Stack(
                children: [
                  SvgPicture.asset('assets/svgs/nomor-surah.svg'),
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: Center(
                      child: Text(
                        "${tajwid.nomor}",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tajwid.nama,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      tajwid.jenis,
                      style: GoogleFonts.poppins(
                        color: text,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      tajwid.keterangan,
                      style: GoogleFonts.poppins(
                        color: text,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
