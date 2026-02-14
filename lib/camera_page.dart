import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'main.dart';

class CameraPage extends StatefulWidget {
  final List<CameraDescription> cameras;

  const CameraPage({super.key, required this.cameras});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

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
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: IconButton(
              onPressed: () {
                // You can add dark mode toggle later
              },
              icon: Image.asset(
                'assets/images/night-mode.png',
                width: 27,
                height: 27,
              ),
            ),
          ),
        ],
      ),

      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10), // some spacing from top / AppBar

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

                  // TITLE + TAGLINE
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'HindVadodara',
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
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: 'HindVadodara',
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
                            // Your scan action here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFDB850), // Button color
                            foregroundColor: Colors.white, // Text color
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40), 
                            ),
                          ),
                          child: const Text(
                            "Scan",
                            style: TextStyle(
                              fontSize: 16, // optional text size
                              fontWeight: FontWeight.bold, // optional
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
