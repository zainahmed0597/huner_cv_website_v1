import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/color_palettes.dart';
import '../utils/strings.dart';
import '../widgets/button/gradient_button_container.dart';
import '../widgets/cursor/animated_circle_cursor.dart';
import '../widgets/icons/padded_icons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color2,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 250, vertical: 30),
        child: Column(
          children: [
            // Top bar and left side area here
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo here
                AnimatedCircleCursorMouseRegion(
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: Image.asset(
                      logoOnly1,
                    ),
                  ),
                ),
                // Right side widgets
                Row(
                  children: [
                    // 4 social media icons here
                    PaddedIcon(
                      fIcon: FontAwesomeIcons.facebookF,
                      color: color3,
                    ),
                    PaddedIcon(
                      fIcon: FontAwesomeIcons.twitter,
                      color: color4,
                    ),
                    PaddedIcon(
                      fIcon: FontAwesomeIcons.youtube,
                      color: color5,
                    ),
                    PaddedIcon(
                      fIcon: FontAwesomeIcons.instagram,
                      color: color6,
                    ),
                    const SizedBox(width: 20),
                    // cv button here
                    AnimatedCircleCursorMouseRegion(
                      child: GradientButtonContainer(
                        height: 80,
                        width: 250,
                        clr: [color7, color7],
                        title: downloadCv,
                        isGradientVertical: false,
                        overlayColor: Colors.red,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 60),
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      height: 500,
                      color: color7,
                    )),
                Expanded(
                    child: Container(
                  height: 500,
                  color: color4,
                      child: Column(
                        children: [

                        ],
                      ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
