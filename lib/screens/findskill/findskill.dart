import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weworkflutter/screens/profile/viewprofile.dart';

class FindSkillScreen extends StatefulWidget {
  @override
  _FindSkillScreenState createState() => _FindSkillScreenState();
}

class _FindSkillScreenState extends State<FindSkillScreen> {
  TextEditingController _filtercontroller = TextEditingController();

  final FirebaseAuth fAuth = FirebaseAuth.instance;
  final StorageReference fStorageRef = FirebaseStorage().ref().child("ID Photos");
  static final Firestore fStore = Firestore.instance;

  Stream<QuerySnapshot> _stream = fStore.collection('users').where('UserType', isEqualTo: 'crewmember').snapshots();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find Skills"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 12.0, bottom: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: TextFormField(
                    controller: _filtercontroller,
                    decoration: InputDecoration(
                      hintText: "Filter Skills",
                      contentPadding: EdgeInsets.all(18.0),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () => setState(() => _stream = fStore.collection('users').where('Skills', arrayContains: _filtercontroller.text.toLowerCase()).snapshots()),
              )
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(

        ),
        child: StreamBuilder(
          stream: _stream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if (!snapshot.hasData) return Text('Loading...');
            return ListView(
              children: snapshot.data.documents.map((document){
                return ListTile(
                    leading: Icon(Icons.contact_phone),
                    title: Text(document['FirstName']+' '+document['LastName']),
                    subtitle: Text('Skills: '+document['Skills'].toString().replaceAll('[','').replaceAll(']','')),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => viewprofile(document)),
                      );
                    }
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}



//class SkillList extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//
//    //final filtercontroller = TextEditingController();
//
//    Stream<QuerySnapshot> crewstream = fStore.collection('users').where('UserType', isEqualTo: 'crewmember').snapshots();
//    return new StreamBuilder(
//      stream: crewstream,
//      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
//        if (!snapshot.hasData) return new Text('Loading...');
//        return new ListView(
//          children: snapshot.data.documents.map((document){
//            return new ListTile(
//                title: new Text(document['FirstName']+' '+document['LastName']),
//                subtitle: new Text('Skills: '+document['Skills'].toString()),
//                trailing: Icon(Icons.keyboard_arrow_right),
//                onTap: () {
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(builder: (context) => crewprofile()),
//                  );
//                }
//            );
//          }).toList(),
//        );
//      },
//    );
//
//  }
//}
//
//
//
//
//class testcode extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Material(
//      child: new Column(
//        children: <Widget>[
//          new Padding(
//            padding: new EdgeInsets.only(top: 20.0),
//          ),
//          new TextField(
//            onChanged: (text){
//              crewstream = fStore.collection('users').where('Skills', arrayContains: text).snapshots();
//            },
//            decoration: new InputDecoration(
//              contentPadding: EdgeInsets.all(15.0),
//              hintText: "Filter Crewmembers",
//            ),
//          ),
//          new StreamBuilder(
//            stream: crewstream,
//            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
//              if (!snapshot.hasData) return new Text('Loading...');
//              return new ListView(
//                children: snapshot.data.documents.map((document){
//                  return new ListTile(
//                      title: new Text(document['FirstName']+' '+document['LastName']),
//                      subtitle: new Text('Skills: '+document['Skills'].toString()),
//                      trailing: Icon(Icons.keyboard_arrow_right),
//                      onTap: () {
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(builder: (context) => crewprofile()),
//                        );
//                      }
//                  );
//                }).toList(),
//              );
//            },
//          ),
//        ],
//      ),
//    );
//  }
//}
//
//



//Widget buildUserList(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//  if (snapshot.hasData) {
//    return ListView.builder(
//      itemCount: snapshot.data.documents.length,
//      itemBuilder: (context, index) {
//        DocumentSnapshot user = snapshot.data.documents[index];
//
//        return ListTile(
//          // Access the fields as defined in FireStore
//          title: Text(user.data['firstName']),
//          subtitle: Text(user.data['lastName']),
//        );
//      },
//    );
//  } else if (snapshot.connectionState == ConnectionState.done && !snapshot.hasData) {
//  // Handle no data
//  return Center(
//  child: Text("No users found."),
//  );
//  } else {
//  // Still loading
//  return CircularProgressIndicator();
//  }
//}
