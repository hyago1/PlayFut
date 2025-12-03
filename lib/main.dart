import 'package:playfut/ui/widgets/bannerAd.dart';
import 'package:playfut/ui/widgets/sectionChannels.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


import 'data/channels.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:  HomePage(),
    );
  }
}



class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF041902),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          children: [
            ImageIcon(
              AssetImage('assets/images/icon.png'), // Path to your image
              size: 30,

            ),
            SizedBox(width: 8),
            Text("PlayFut", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white)),
          ],
        ),
        actions: [

        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bannerAd(),
            SectionChannels(title: "Esportes", items: sports, context: context),
            SectionChannels(title:"Canais Premium", items: premium, context: context),
            SectionChannels(title: "Filmes", items: films, context: context),
          ],
        ),
      ),
    );
  }

}


