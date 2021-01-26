import 'package:flutter/material.dart';
import 'package:news_demo_livestream/models/Info.dart';
import '../pages/next.dart';
import 'package:news_demo_livestream/services/api_manager.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Model> _Model;

  @override
  void initState() {
    _Model = API_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Itunes'),
      ),
      body: Container(
        child: FutureBuilder<Model>(
          future: _Model,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.articles.length,
                  itemBuilder: (context, index) {
                    var article = snapshot.data.articles[index];

                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(
                          article.urlToImage,
                          article.trackName,
                          article.artist,
                          
                          article.genre,
                          article.song,
                        )));
                      },
                      child: Container(
                        height: 100,
                        width: 200,
                        margin: const EdgeInsets.all(8),
                        child: Row(
                          children: <Widget>[
                            Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.network(
                                    article.urlToImage,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            SizedBox(width: 16),
                            Container(
                              width: 300,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Name: ${article.trackName}',
                                      softWrap: true,
                                      style: TextStyle(fontSize: 20)),
                                  
                                  Text(
                                    'Artist: ${article.artist}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  
                                  Text(
                                    'Genre: ${article.genre}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            } else
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
