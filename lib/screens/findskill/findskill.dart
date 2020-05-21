import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weworkflutter/screens/crew/crewprofile.dart';

class FindSkillScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Find Skills"),
      ),
      body: new SkillList(),
      bottomNavigationBar: BottomAppBar(
        child: new TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15.0),
            hintText: 'Filter Crewmembers',
          ),
        ),
      ),
    );
  }
}

class SkillList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth fAuth = FirebaseAuth.instance;
    final StorageReference fStorageRef = FirebaseStorage().ref().child("ID Photos");
    final Firestore fStore = Firestore.instance;
    final filtercontroller = TextEditingController();
    
    String filter = '';
    return new Material(
      child: new Column(
        children: <Widget>[
          Padding(
            padding: new EdgeInsets.only(top: 20.0),
          ),
          TextField(
            controller: filtercontroller,
            decoration: new InputDecoration(
                labelText: "Filter Crewmembers"
            ),
            
          ),
          StreamBuilder(
            stream: fStore.collection('users').where('UserType', isEqualTo: 'crewmember').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
              if (!snapshot.hasData) return new Text('Loading...');
              return new ListView(
                children: snapshot.data.documents.map((document){
                  return new ListTile(
                      title: new Text(document['FirstName']+' '+document['LastName']),
                      subtitle: new Text('Skills: '+document['Skills'].toString()),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => crewprofile()),
                        );
                      }
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}




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

return new StreamBuilder(
stream: fStore.collection('users').where('UserType', isEqualTo: 'crewmember').snapshots(),
builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
if (!snapshot.hasData) return new Text('Loading...');
return new ListView(
children: snapshot.data.documents.map((document){
return new ListTile(
title: new Text(document['FirstName']+' '+document['LastName']),
subtitle: new Text('Skills: '+document['Skills'].toString()),
trailing: Icon(Icons.keyboard_arrow_right),
onTap: () {
Navigator.push(
context,
MaterialPageRoute(builder: (context) => crewprofile()),
);
}
);
}).toList(),
);
},
);