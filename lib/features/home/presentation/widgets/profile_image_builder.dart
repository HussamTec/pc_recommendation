import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Widget buildProfileImage(User? user, double? width,double? height) {
  if (user?.photoURL != null && user!.photoURL!.isNotEmpty) {
    return Column(
      children: [
        ClipOval(
          child: Image.network(
            _auth.currentUser!.photoURL!,
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  } else {
    return Column(
      children: [
        ClipOval(
          child: Container(
            color: Colors.white,
            width: width,
            height: height,
            child: SvgPicture.asset(
              'assets/svg_icons/profile.svg',
              color: Colors.grey,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}

Future<String> getUserDisplayName(User? user) async {
  if (user == null) {
    return '';
  }

  if (user.displayName != null && user.displayName!.isNotEmpty) {
    return user.displayName!;
  } else {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('userNames')
        .doc(user.uid)
        .get();

    if (userDoc.exists) {
      return userDoc['username'] ?? '';
    } else {
      return '';
    }
  }
}