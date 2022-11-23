import 'package:flutter/material.dart';
import 'package:counter_7/api/fetch_watch_list.dart';

class MyWatchListDetail extends StatefulWidget {
  final int pk;

  const MyWatchListDetail({super.key, required this.pk});

  @override
  State<StatefulWidget> createState() => _MyWatchListDetailState();

}

class _MyWatchListDetailState extends State<MyWatchListDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Detail"),
        ),
        body: Container(
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
                      watchlistCache[widget.pk].fields.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    watchlistCache[widget.pk].fields.watched ?
                    const Text(
                      "(watched)",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                      ),
                    ) : const Text(
                      "(haven't watch)",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 14,
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
                          '${watchlistCache[widget.pk].fields.rating}',
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
                        Expanded(
                          child: Text(
                            watchlistCache[widget.pk].fields.review,
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
                          'Release date: ${watchlistCache[widget.pk].fields.releaseDate.year.toString()}-${watchlistCache[widget.pk].fields.releaseDate.month.toString()}-${watchlistCache[widget.pk].fields.releaseDate.day.toString()}',
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
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 45, right: 45, bottom: 35),
          child: TextButton(
            style: TextButton.styleFrom(
              minimumSize: const Size.fromHeight(40),
              foregroundColor: Colors.white,
              backgroundColor: Colors.teal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            child: const Text("Back"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
    );
  }
}
