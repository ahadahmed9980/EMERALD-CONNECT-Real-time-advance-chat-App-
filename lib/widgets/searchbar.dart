import 'package:emberald/utils/appcolors.dart';
import 'package:flutter/material.dart';

class dynamicSearchBar extends StatelessWidget {
final TextEditingController searchcontroller;
  final String hinttext;

  const dynamicSearchBar({
    super.key,
    required this.hinttext,
    required this.searchcontroller,
  });

  @override
  Widget build(BuildContext context) {
  
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      child: TextField(
        controller: searchcontroller,
        maxLines: 1,
        cursorColor: Colors.black,
        cursorHeight: 20,

        style: const TextStyle(fontSize: 16, color: Colors.black),

        decoration: InputDecoration(
           prefixIcon: Icon(Icons.search_sharp,color: AppColors.textSecondary),
          hintText: hinttext,
          filled: true,
          fillColor: Colors.white,

          hintStyle: textTheme.labelSmall,

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.grey),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.grey, width: 2),
          ),
        ),
      ),
    );
  }
}
