import 'package:fiberguardbharat/news/bar%20graph/bar_graph.dart';
import 'package:flutter/material.dart';

class HomeNewsPage extends StatefulWidget {
  const HomeNewsPage({super.key});

  State<HomeNewsPage> createState() => _HomeNewsState();
}

class _HomeNewsState extends State<HomeNewsPage> {
  List<double> weeklySummary = [
    4.40,
    2.50,
    42.42,
    10.50,
    100.20,
    89.99,
    99.10,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Center(
        child: SizedBox(
          height: 200,
          child: MyBarGraph(
            weeklySummary: weeklySummary,
          ),
        ),
      ),
    );
  }
}
