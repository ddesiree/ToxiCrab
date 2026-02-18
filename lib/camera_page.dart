import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'display_page.dart';
import 'dart:math';
import 'package:toxicrab/main.dart';

class CameraPage extends StatefulWidget {
  final List<CameraDescription> cameras;

  const CameraPage({super.key, required this.cameras});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

//PANG SIMULATE RA NI, TANGGALA IF NAA NA ANG ML MODEL------------------
final List<Map<String, dynamic>> testResults = [
  {"label": "toxic", "confidence": 0.91},
  {"label": "non_toxic", "confidence": 0.88},
  {"label": "unknown", "confidence": 0.40},
];

Map<String, dynamic> getRandomResult() {
  final random = Random();
  return testResults[random.nextInt(testResults.length)];
}
//HANTUD DIRI -----------------------------------------------------------


class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(
      widget.cameras[0], // back camera
      ResolutionPreset.medium,
      enableAudio: false,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {
                // Do nothing or refresh
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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 10),
                  Image.asset(
                    'assets/images/LOGO OFFICIAL.png',
                    width: 40,
                    height: 40,
                  ),

                  const SizedBox(width: 10), // space between image and text

                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'HindVadodara',
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      children: const [
                        TextSpan(
                          text: 'ToxiCrab',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' | Toxic Crab Detection',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'HindVadodara',
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    children: [
                      TextSpan(
                        text: 'Capture Image',
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 5),
            // CAMERA PREVIEW BOX
            FutureBuilder(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    width: 370,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(180, 255, 208, 208),
                      borderRadius: BorderRadius.circular(33),
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CameraPreview(_controller),
                        ),
                        const SizedBox(height: 50),
                        ElevatedButton(
                          onPressed: () {
                            //------------------------------------------------------
                            final result = getRandomResult();

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DisplayPage(result: result),
                              ),
                            );
                            //------------------------------------------------------
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFDB850),
                            foregroundColor: Colors.white, 
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40), 
                            ),
                          ),
                          child: const Text(
                            "Scan",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),

          ],
        ),
      ),

    );
  }
}
