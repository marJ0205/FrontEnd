import 'package:flutter/material.dart';

class SearchBahan extends StatefulWidget {
  const SearchBahan({super.key});

  @override
  State<SearchBahan> createState() => _SearchBahanState();
}

class _SearchBahanState extends State<SearchBahan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("BUAT BAHAN"),
      ),
    );
  }
}