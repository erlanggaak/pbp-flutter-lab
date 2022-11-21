import 'package:flutter/material.dart';
import 'package:counter_7/page/main.dart';
import 'package:counter_7/model/budget.dart' as data;

class BudgetList extends StatefulWidget {
  const BudgetList({super.key});

  @override
  State<StatefulWidget> createState() => _BudgetListState();
}

class _BudgetListState extends State<BudgetList> {

  List<Widget> getBudgetWidget() {
    List<Widget> list = <Widget>[];
    for (var element in data.listBudget) {
      list.add(
          Padding(
            padding: const EdgeInsets.all(10),
            child: Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(5),
              shadowColor: Colors.grey,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  selectedTileColor: Colors.white38,
                  title: Text(element.title),
                  subtitle: Text("Rp${element.nominal}"),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(element.type),
                      Text("${element.date.year.toString()}-${element.date.month.toString().padLeft(2,'0')}-${element.date.day.toString().padLeft(2,'0')}",
                      style: const TextStyle(
                        color: Colors.grey,
                      )),
                    ],
                  ),
                ),
              )
            ),
          )
      );
      // list.add(Container(
      //   margin: const EdgeInsets.all(10),
      //   decoration: BoxDecoration(
      //     border: Border.all(color: Colors.grey),
      //     borderRadius: BorderRadius.circular(5),
      //   ),
      //   child: Column(
      //     children: [
      //       Text(element.title),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Flexible(child:Text(element.nominal.toString())),
      //           Flexible(child:Text(element.type)),
      //         ],
      //       )
      //     ],
      //   ),
      // ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Budget"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: ListView(
          children: getBudgetWidget(),
        )
      )
    );
  }
}
