import 'package:flutter/material.dart';
class Custombutton {

  static Widget custom({
    required BuildContext context,
    required String text,
    required VoidCallback onPressed,
    bool isLoading = false, 
  }){
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: size.height * 0.07,
      width: size.height * 0.4,
      child: ElevatedButton(
        onPressed:isLoading?null:onPressed ,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
        ),
        child: isLoading
            ? SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              )
            : Text(
                text,
                style: textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
      ),
    );

  }
  static Widget imageboxes({required BuildContext context, required String image}) {
  final size = MediaQuery.of(context).size;
  return Container(
    padding: const EdgeInsets.all(5.0),
    alignment: Alignment.center,
    height: size.height * 0.07,
    width: 70,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25), // 15% opacity
          blurRadius: 10,
          spreadRadius: 2,
          offset: const Offset(0, 4),
        ),
      ],
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),

    child: Image.asset(image),
  );
}

}


