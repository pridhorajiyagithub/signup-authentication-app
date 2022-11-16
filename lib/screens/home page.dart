import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../global.dart';
import '../helper/firebase_auth_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: GoogleFonts.ubuntu(),
        ),
        backgroundColor: Color(0xffa58fd2),
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuthHelper.firebaseAuthHelper.signOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("/", (route) => false);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(
          "Welcome Home",
          style: GoogleFonts.ubuntu(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
