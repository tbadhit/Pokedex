import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({super.key});

  final TextEditingController searchC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
                height: 40,
                decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
                child: Center(
          child: TextField(
            style: const TextStyle(color: Colors.black),
            controller: searchC,
            cursorColor: Colors.grey,
            decoration: const InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
                icon: Icon(
                  Icons.search,
                  color: Colors.red,
                )),
            onChanged: (value) {
              
            },
          ),
                ),
              ),
        ),
        const SizedBox(
          width: 20,
        ),
        const SizedBox(
          height: 50,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text("#", style: TextStyle(color: Colors.red),),
          ),
        ),
      ],
    );
  }
}
