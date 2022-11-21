import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/mywatchlist.dart';
import 'drawer.dart';

class MyWatchListDetail extends StatefulWidget {
  final int pk;

  const MyWatchListDetail({super.key, required this.pk});

  @override
  State<StatefulWidget> createState() => _MyWatchListDetailState();

}

class _MyWatchListDetailState extends State<MyWatchListDetail> {

  Future<List<MyWatchList>> fetchWatchListWithPK() async {
    print('https://tugas2dafi.herokuapp.com/mywatchlist/json/${widget.pk}');
    print("widget pk: ${widget.pk}");
    var url = Uri.parse('https://tugas2dafi.herokuapp.com/mywatchlist/json/${widget.pk}');
    print(url);
    print("abc");
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
          title: const Text("Detail"),
        ),
        body: FutureBuilder(
            future: fetchWatchListWithPK(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Gagal mendapatkan detail",
                        style: TextStyle(
                            color: Color(0xff59A5D8),
                            fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 2),
                              blurRadius: 1,
                              spreadRadius: 1,
                              color: Colors.grey[800]!
                          )
                        ]
                    ),
                    child: Row(
                      children: [
                        // Expanded(
                        //   flex: 4,
                        //   child: ClipRRect(
                        //       borderRadius: BorderRadius.circular(10),
                        //       child: Hero(
                        //         tag: index.toString(),
                        //         child: CustomNetworkImage(
                        //           image: movieList[index].posterPath != null
                        //               ? movieList[index].posterPath!
                        //               : '',
                        //           height: 200,
                        //           width: double.infinity,
                        //         ),
                        //       )),
                        // ),
                        // const SizedBox(
                        //   width: 15,
                        // ),
                        Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                snapshot.data[0].fields.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '${snapshot.data[0].fields.rating}',
                                    style:
                                    const TextStyle(color: Colors.yellow, fontSize: 18),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellowAccent,
                                    size: 25,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Text(
                                    'Review',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  if (!snapshot.data[0].fields.watched)
                                    const Text(
                                      'I haven\'t watch it yet',
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 16,
                                      ),
                                    ),
                                  Expanded(
                                    child: Text(
                                      '${snapshot.data[0].fields.review}',
                                      style:
                                      const TextStyle(color: Colors.white, fontSize: 16),
                                    ),
                                  ),

                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Release date: ${snapshot.data[0].fields.releaseDate.year.toString()}-${snapshot.data[0].fields.releaseDate.month.toString()}-${snapshot.data[0].fields.releaseDate.day.toString()}',
                                    style: const TextStyle(
                                      color: Colors.orangeAccent,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }
              }
            }
        )
    );
  }
}
