import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UserDetails extends StatefulWidget {
  int userId;
  int id;
  String title;
  String body;
  UserDetails({super.key,required this.userId,required this.id, required this.title,required this.body});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('User Details'),),
    
     body: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Container(color: Colors.grey[100], height: double.infinity,width: double.infinity,child: Column(children:
        [Text(widget.userId.toString(),style: TextStyle(fontSize: 25,fontStyle: FontStyle.italic)),Text(widget.title,style: TextStyle(fontSize: 25,fontStyle: FontStyle.italic),),Text(widget.body)],),),
     ));
  }
}