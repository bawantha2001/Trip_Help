import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bookings extends StatefulWidget {
  // String placeId;
  // Bookings({required this.placeId});

  @override
  State<Bookings> createState() => _State();
}

class _State extends State<Bookings> {
  //  String placeId;
  // _State(this.placeId);

  final _placesStream =
      FirebaseFirestore.instance.collection("places").snapshots();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: StreamBuilder(
          stream: _placesStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("Connection Error");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading...");
            }

            var docs = snapshot.data!.docs;
            // return Text('${docs.length}');

            return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context,index){
                  return ListTile(
                    leading: Icon(Icons.person),
                    title: Text(docs[index]['name']),
                    subtitle:Text('${docs[index]['location']}') ,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                    selectedTileColor: Colors.blue,
                  );
                  ;
                });
          },
        ),
      ),
    );
  }
}
