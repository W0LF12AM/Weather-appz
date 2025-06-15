import 'package:clima/utilities/constatnts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IconAndNumberWdiget extends StatelessWidget {
  IconAndNumberWdiget({super.key, required this.icons, required this.numbers});

  final IconData? icons;
  final dynamic numbers;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icons,
          color: Colors.white,
        ),
        SizedBox(
          width: 5,
        ),
        Text('$numbers',
            style: GoogleFonts.poppins(color: Colors.white, fontSize: h4))
      ],
    );
  }
}
