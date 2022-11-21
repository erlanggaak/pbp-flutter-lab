import 'package:counter_7/page/mywatchlist_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/mywatchlist.dart';
import 'drawer.dart';

class MyWatchListPage extends StatefulWidget {
  const MyWatchListPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyWatchListPageState();
}

class _MyWatchListPageState extends State<MyWatchListPage> {
  Future<List<MyWatchList>> fetchWatchList() async {
    var url = Uri.parse('https://tugas2dafi.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object MyWatchList
    List<MyWatchList> listMyWatchList = [];
    for (var d in data) {
      if (d != null) {
        listMyWatchList.add(MyWatchList.fromJson(d));
      }
    }

    return listMyWatchList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Watch List"),
        ),
        body: FutureBuilder(
            future: fetchWatchList(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Watchlist kamu kosong",
                        style: TextStyle(
                            color: Color(0xff59A5D8),
                            fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index)=> InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyWatchListDetail(pk: snapshot.data[index].pk,))
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              color: Colors.white38,
                              borderRadius: BorderRadius.circular(10.0),
                              // boxShadow: const [
                              //   BoxShadow(
                              //     //color: Colors.white,
                              //     blurRadius: 1,
                              //     offset: Offset(0, 1),
                              //   )
                              // ]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${snapshot.data![index].fields.title}",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                  );
                }
              }
            }
        )
    );
  }
}
