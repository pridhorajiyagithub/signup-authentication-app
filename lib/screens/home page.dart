import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helper/firebase_auth_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    User? data = ModalRoute.of(context)!.settings.arguments as User?;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: GoogleFonts.ubuntu(),
        ),
        backgroundColor: const Color(0xffa58fd2),
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuthHelper.firebaseAuthHelper.signOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("/", (route) => false);
              },
              icon: const Icon(Icons.logout))
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
      drawer: Drawer(
        backgroundColor: const Color(0xffa58fd2),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage("${data!.photoURL}"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Colors.black,
                thickness: 1.5,
              ),
              const SizedBox(
                height: 10,
              ),
              (data!.displayName != null)
                  ? Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Name = ${data!.displayName}",
                        textAlign: TextAlign.left,
                        style:
                            const TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    )
                  : const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Name = ---",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
              const SizedBox(
                height: 10,
              ),
              (data.email != null)
                  ? Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Gmail = ${data.email}",
                        textAlign: TextAlign.left,
                        style:
                            const TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    )
                  : const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Gmail = ---",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
