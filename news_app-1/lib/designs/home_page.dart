import 'package:flutter/material.dart';

import 'package:news_paper_app/api_classes/api_service.dart';

import 'package:news_paper_app/api_classes/article_model.dart';

import 'package:news_paper_app/designs/news_view_page.dart';

import 'model_class.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Daily News',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          backgroundColor: Colors.black,
          toolbarHeight: 80,
          centerTitle: true,
        ),
        body: FutureBuilder<List<Article>>(
            future: client.getArticle(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    var articles = snapshot.data![index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => News(
                                article: articles,
                              ),
                            ));
                      },
                      child: Card(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(snapshot
                                        .data![index].urlToImage
                                        .toString()),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                  height: 150,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data![index].title
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          snapshot.data![index].publishedAt
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            }));
  }

  List news = [
    NewsList(
        img:
            'https://media.istockphoto.com/id/1197831888/vector/male-hand-holding-megaphone-with-breaking-news-speech-bubble-loudspeaker-banner-for-business.jpg?s=612x612&w=0&k=20&c=4CvdND_C8H3AxDMlEAZ8j9oagSvlmMcNHlrVoqoc9KQ=',
        headline: 'Breaking news Breaking news Breaking news Breaking news',
        time: "2023-02-02T21:05:00Z")
  ];
}
