import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCXHh5ZxPGoQqjEtC8crqUiE84P6orj5fg",
            authDomain: "margwa-manga.firebaseapp.com",
            projectId: "margwa-manga",
            storageBucket: "margwa-manga.appspot.com",
            messagingSenderId: "842824867919",
            appId: "1:842824867919:web:e2478c97b0d13748d48a3a",
            measurementId: "G-NGY3DM35J1"));
  } else {
    await Firebase.initializeApp();
  }
}
