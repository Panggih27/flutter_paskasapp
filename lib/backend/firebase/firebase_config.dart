import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA6_w_LaEwXsvljzFrMp2B0QlRKfGR002E",
            authDomain: "paskasapp.firebaseapp.com",
            projectId: "paskasapp",
            storageBucket: "paskasapp.appspot.com",
            messagingSenderId: "754236308957",
            appId: "1:754236308957:web:aadaeaccf1d3f74a128a34"));
  } else {
    await Firebase.initializeApp();
  }
}
