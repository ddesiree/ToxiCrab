import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'camera_page.dart';
import 'upload_page.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Image.asset(
              'assets/images/home.png',
              width: 32, 
              height: 32,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              onPressed: () {
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
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'assets/images/night-mode.png', 
              width: 27,  
              height: 27,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/LOGO OFFICIAL.png',
                width: 200,
                height: 200,
              ),

              const SizedBox(height: 20),
              const Text(
                'ToxiCrab',
                style: TextStyle(
                  fontFamily: 'HindVadodara',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                'Toxic Crab Detection',
                style: TextStyle(
                  fontFamily: 'HindVadodara',
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontFamily: 'InclusiveSans',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    children: [
                      const TextSpan(
                        text:
                            'Eat Smart. Scan Safe. Unsure if that catch is safe to eat? ',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const TextSpan(
                        text: 'ToxiCrab',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const TextSpan(
                        text:
                            ' turns your device into a powerful biosafety tool. Using advanced AI and morphological analysis, ',
                      ),
                      const TextSpan(
                        text: 'ToxiCrab',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const TextSpan(
                        text:
                            ' helps fishers, consumers, and seafood enthusiasts identify potentially poisonous crab species in seconds.',
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraPage(cameras: cameras),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFDB850),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Capture now',
                  style: TextStyle(
                    fontFamily: 'HindVadodara',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Navigate to UploadPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UploadPage(), // your page widget
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFDB850),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Upload Image',
                  style: TextStyle(
                    fontFamily: 'HindVadodara',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  'ABOUT\n\n'
                  'ToxiCrab is a thesis project that aims to reduce illnesses and fatalities caused by the accidental consumption of toxic crabs. The system uses AI based image detection to help identify dangerous crab species, supporting fishers, vendors, and consumers in making safer decisions. It serves as a visual screening tool and public awareness aid, not a replacement for expert judgment or official food safety advisories. ',
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontFamily: 'InclusiveSans',
                    fontSize: 13,
                  ),
                ),
              ),

              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  'DISCLAIMER\n\n'
                  'ToxiCrab is designed to detect Category 1 toxic crabs only.\n\n'
                  'Category 1 includes permanently and highly toxic species that are dangerous regardless of cooking, season, or location. These crabs, mostly from the family Xanthidae, often have bright warning colors and contain potent neurotoxins such as palytoxin, saxitoxin, and tetrodotoxin. Even small amounts can be fatal.\n\n'
                  'Category 2 includes mildly or occasionally toxic species whose toxicity varies by diet, environment, or season. These may cause illness but are not consistently poisonous.\n\n'
                  'ToxiCrab does not assess Category 2 species, as their toxicity cannot be reliably determined through appearance alone.',
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontFamily: 'InclusiveSans',
                    fontSize: 13,
                    color: Colors.red,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    const Text(
                      'Authors',
                      style: TextStyle(
                        fontFamily: 'HindVadodara',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage('assets/images/1.png'),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              'Desiree Joice F. Boo',
                              style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(width: 30),

                        Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage('assets/images/3.png'),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              'Rojelyn Laguinan',
                              style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                        const SizedBox(width: 30),

                        Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage('assets/images/2.png'),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              'Remart S. Maynantay',
                              style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              const Text(
                '© 2026 ToxiCrab. All Rights Reserved.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'InclusiveSans',
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),

      


    );
  }
}
