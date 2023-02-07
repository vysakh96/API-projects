import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

class NewsApi extends StatefulWidget {
  const NewsApi({Key? key}) : super(key: key);

  @override
  State<NewsApi> createState() => _NewsApiState();
}

class _NewsApiState extends State<NewsApi> {
  String? stringResponse;
  Map? mapResponse;
  // Map? dataResponse;
  List? listResponse;

  Future apiCall() async {
    http.Response response;
    response = await http.get((Uri.parse(
        'https://newsapi.org/v2/everything?q=tesla&from=2023-01-06&sortBy=publishedAt&apiKey=25ffee44024c4f8b9c9940fcb59fe773')));
    if (response.statusCode == 200) {
      setState(() {
        // stringResponse = response.body;
        mapResponse = jsonDecode(response.body);
        listResponse = mapResponse!['articles'];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiCall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Daily News',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Image(
                      image: NetworkImage(
                          listResponse![index]['urlToImage'].toString())),
                  // Container(
                  //   height: 300,
                  //   width: double.maxFinite,
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //       image: NetworkImage(listResponse![index]['urlToImage'].toString()),
                  //       fit: BoxFit.fill
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            listResponse![index]['publishedAt'].toString(),
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 80),
                            child: Text(
                              listResponse![index]['author'].toString(),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: Text(
                      listResponse![index]['title'].toString(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      listResponse![index]['content'].toString(),
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      listResponse![index]['description'].toString(),
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Divider(),
                  ),
                ],
              ),
            );
          },
          itemCount: listResponse == null ? 0 : listResponse!.length,
        )
        // Center(
        //   child: Container(
        //     height: double.maxFinite,
        //     width: double.maxFinite,
        //     color: Colors.blue,
        //     child: Center(child: listResponse == null?
        //         Text('Data is loading'):
        //     Text(listResponse![1].toString(),style: TextStyle(color: Colors.white,fontSize: 15),)),
        //   ),
        // )
        );
  }
}
