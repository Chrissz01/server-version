// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_interpolation_to_compose_strings, empty_constructor_bodies

import 'package:flutter/material.dart';

import 'models/pubs.dart';

class PubCard extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  
   final Pubs pub;

  const PubCard( this.pub, {super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 100,
          minHeight: 100,
        ),
        child: Image.network(
            'http://192.168.1.72:1337' +
                pub.picture.url,
                width: 150,
                height: 220,
            fit: BoxFit.cover),
      ),
        title: Text(
          pub.name
        ),
        subtitle: Text(pub.address),
        trailing: Column(children:<Widget>[Text('Avg Price'),Text(pub.avgPrice.toString())]),
        contentPadding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    );
  } 
}