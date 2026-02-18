import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'camera_page.dart';
import 'package:toxicrab/main.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
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
                Navigator.pop(context); 
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

                  const SizedBox(width: 10),

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
                        text: 'Upload Image',
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 5),

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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Upload and drop files here",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Limit 2000MB per file: .JPG, .PNG, .JPEG, .BMP, .TIFF, .TIF',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10), 
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Add file picker logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 57, 57, 57),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      child: const Text(
                        "Browse Here",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
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
}