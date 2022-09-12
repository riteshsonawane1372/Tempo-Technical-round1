import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {

  TextEditingController controller;

  SearchBar({
    required this.controller
});



  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  @override
  Widget build(BuildContext context) {

    final double heightD = MediaQuery.of(context).size.height;
    final double widthD = MediaQuery.of(context).size.width;

    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
          suffixIcon: InkWell(
              onTap: (){
                widget.controller.clear();
                setState((){});
                FocusScope.of(context).unfocus();
              },
              child: Icon(Icons.clear)),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(fontSize: widthD/27.46),
          prefixIcon: InkWell(
              onTap: (){
                FocusScope.of(context).unfocus();
              },
              child: Icon(Icons.search,color: Colors.grey,)),
          border: OutlineInputBorder(
              borderSide: BorderSide.none
          )
      ),

    );
  }
}
