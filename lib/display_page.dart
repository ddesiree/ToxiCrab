import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'camera_page.dart';
import 'package:toxicrab/main.dart';

class DisplayPage extends StatelessWidget {
  final Map<String, dynamic> result;

  const DisplayPage({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final label = result["label"];
    final confidence = result["confidence"];

    String message;
    String iconPath;

    if (label == "toxic") {
      message = "Toxic - Unsafe to Consume";
      iconPath = "assets/images/toxic.jpg";
    } else {
      message = "No Toxic Crab Detected";
      iconPath = "assets/images/unknown.jpg";
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst); 
              },
              icon: Image.asset(
                'assets/images/home.png',
                width: 32,
                height: 32,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: IconButton(
              onPressed: () async {
                final cameras = await availableCameras();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CameraPage(cameras: cameras),
                  ),
                );
              },
              icon: Image.asset(
                'assets/images/camera.png',
                width: 31,
                height: 31,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: IconButton(
              onPressed: () {
                MyApp.of(context).toggleTheme();
              },
              icon: Image.asset(
                MyApp.of(context).themeMode == ThemeMode.light
                  ? 'assets/images/night-mode.png'
                  : 'assets/images/light-mode.png',
                width: 27,
                height: 27,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            /// LOGO + TITLE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Image.asset(
                    'assets/images/LOGO OFFICIAL.png',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 10),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'HindVadodara',
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      children: [
                        TextSpan(
                          text: 'ToxiCrab',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ' | Toxic Crab Detection',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// SECTION TITLE
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Result",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'HindVadodara',
                  ),
                ),
              ),
            ),

            const SizedBox(height: 5),

            /// RESULT CONTAINER (NO BORDER)
            Container(
              width: double.infinity,
              height: 520,
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(180, 255, 208, 208),
                borderRadius: BorderRadius.circular(33),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  /// RESULT ICON
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      iconPath,
                      width: 400,
                      height: 300,
                      fit: BoxFit.none,
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// RESULT TEXT
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'HindVadodara',
                      color: label == "toxic" ? Colors.red : Colors.black,
                    ),
                  ),

                  /// CONDITIONAL DISPLAY
                  if (label == "toxic") ...[
                    /// CONFIDENCE
                    Text(
                      "CONFIDENCE LEVEL: ${(confidence * 100).toStringAsFixed(1)}%",
                      style: const TextStyle(
                        fontSize: 13,
                        fontFamily: 'HindVadodara',
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// CRAB INFO
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Common Name: \nScientific Name: \nFamily: \nPrimary Toxin:",
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'InclusiveSans',
                        ),
                      ),
                    ),
                  ] else ...[
                    const SizedBox(height: 20),

                    /// NO TOXIC CRAB MESSAGE
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "No known toxic crab species identified in the image. Manual verification is advised.",
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'InclusiveSans',
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 50),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 9,
                      fontFamily: 'HindVadodara',
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    children: [
                      TextSpan(text: "Note: "),
                      TextSpan(
                        text: "ToxiCrab",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            " is designed to detect Category 1 toxic crabs only (Lophozozymus pictor, Demania sp., Zosimus aeneus, Platypodia granulosa, and Atergatis floridus). Results are for decision support only and should not replace expert verification.",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}