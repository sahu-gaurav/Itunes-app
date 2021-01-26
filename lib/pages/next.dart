import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class DetailScreen extends StatelessWidget {
  final String url;
  final String name;
  final String artist;
  
   final String type;
  final String song;

  DetailScreen(this.url,this.name,this.artist,this.type,this.song);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Music Detail'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10,),
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(url,height: 100,width: 100,fit: BoxFit.contain,),
            ),
            SizedBox(height: 20,),
            Card(
              child: Container(
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(name,style: TextStyle(fontSize: 20)),
                    SizedBox(height: 20,),
                    Text(artist,style: TextStyle(fontSize: 20)),
                    SizedBox(height: 20,),
                    Text(type,style: TextStyle(fontSize: 20)),
                    SizedBox(height: 20,),
                    InkWell(child: Text('Play song',style: TextStyle(fontSize: 25 ,color: Colors.blue),),
                    onTap: ()=>launch(song),)
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
