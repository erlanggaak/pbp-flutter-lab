import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/mywatchlist.dart';

List<MyWatchList> watchlistCache = [];

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
      MyWatchList movie = MyWatchList.fromJson(d);
      listMyWatchList.add(movie);
      watchlistCache.add(movie);
    }
  }

  return listMyWatchList;
}

Future<List<MyWatchList>> fetchWatchListWithPK(int pk) async {
  var url = Uri.parse('https://tugas2dafi.herokuapp.com/mywatchlist/json/$pk');
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