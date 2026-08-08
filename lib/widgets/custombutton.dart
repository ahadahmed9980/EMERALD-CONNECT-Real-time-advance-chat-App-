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
                  color: Theme.of(context).colorScheme.primary,
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

}


