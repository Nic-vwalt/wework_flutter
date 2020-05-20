import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FindSkill extends StatefulWidget {
  @override
  _FindSkillState createState() => _FindSkillState();
  final FirebaseAuth fAuth = FirebaseAuth.instance;
  final StorageReference fStorageRef = FirebaseStorage().ref().child("ID Photos");
  final Firestore fStore = Firestore.instance;

}

class _FindSkillState extends State<FindSkill> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
