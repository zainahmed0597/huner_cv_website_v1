import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/color_palettes.dart';

class GradientButtonContainer extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final List<Color> clr;
  final Color overlayColor;
  final bool isGradientVertical;
  final Function() onPressed;

  const GradientButtonContainer({
    super.key,
    required this.title,
    required this.height,
    required this.width,
    required this.clr,
    required this.overlayColor,
    required this.isGradientVertical,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: isGradientVertical ? Alignment.topCenter : Alignment.centerLeft,
                end: isGradientVertical ? Alignment.bottomCenter : Alignment.centerRight,
                colors: clr,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                elevation: const MaterialStatePropertyAll(0),
                overlayColor: MaterialStatePropertyAll(overlayColor),
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.all(0),
                ),
                backgroundColor: const MaterialStatePropertyAll(
                  Colors.transparent,
                ),
              ),
              onPressed: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w900,
                      color: color2,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),


          ),
        ),
      ),
    );
  }
}
