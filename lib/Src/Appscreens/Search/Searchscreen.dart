import 'package:flutter/material.dart';
import 'package:my_app/Src/Appscreens/BottumBar/Bottumbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search")),
      bottomNavigationBar: const BottumTabBar(),
    );
  }
}
