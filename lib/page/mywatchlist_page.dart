import 'package:counter_7/page/mywatchlist_detail.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:counter_7/api/fetch_watch_list.dart';

class MyWatchListPage extends StatefulWidget {
  Future<List<MyWatchList>> watchlist =
    watchlistCache.isEmpty ? fetchWatchList() : SynchronousFuture(watchlistCache);

  MyWatchListPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyWatchListPageState();
}

class _MyWatchListPageState extends State<MyWatchListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Watch List"),
        ),
        body: FutureBuilder(
            future: widget.watchlist,
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
                              MaterialPageRoute(builder: (context) => MyWatchListDetail(pk: snapshot.data[index].pk - 1,))
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          padding: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                              color: Colors.white38,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  color: snapshot.data[index].fields.watched ?
                                    Colors.green : Colors.redAccent
                              ),
                              // boxShadow: const [
                              //   BoxShadow(
                              //     //color: Colors.white,
                              //     blurRadius: 1,
                              //     offset: Offset(0, 1),
                              //   )
                              // ]
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${snapshot.data![index].fields.title}",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Checkbox(
                                checkColor: Colors.teal,
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                value: snapshot.data[index].fields.watched,
                                onChanged: (bool? value) {
                                  setState(() {
                                    snapshot.data[index].fields.watched = value;
                                  });
                                })
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
