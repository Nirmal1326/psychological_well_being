import 'package:flutter/material.dart';
import 'package:psychological_well_being/auth/splash.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://judpokxmtitvqxqqvskj.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp1ZHBva3htdGl0dnF4cXF2c2tqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc3MjQ3MTMsImV4cCI6MjAyMzMwMDcxM30.8MHukAymRPNSXGS8nqdHiyspskz1aIYmyqTzCW_ka_Q',
  );
  runApp(MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Well-Being App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue, // You can choose your primary color
          accentColor: Colors.orange, // You can choose your accent color
        ),
        fontFamily: 'Roboto',
      ),
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});
  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF50C4ED), //0xff
        appBar: AppBar(
          backgroundColor: Color(0xFF387ADF),
          title: const Center(
            child: Text(
              'Psychological Well Being',
              style: TextStyle(
                  color: Color(0xFFDBE7C9),
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage('images/start.png'),
              ),
            ),
            SizedBox(
              height: 80.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SlideAction(
                onSubmit: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SplashPage(),
                    ),
                  );
                  return null;
                },
                elevation: 24,
                borderRadius: 16,
                outerColor: Color(0xFF333A73),
                innerColor: Color(0xFFDBE7C9),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ));
  }
}
