import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class viewprofile extends StatelessWidget {
  //final Document document;
  final DocumentSnapshot document;
  viewprofile(this.document);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(document["FirstName"].toString()+"'s Info"),
      ),
      body: Container(),

      );

  }
}
