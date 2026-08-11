import 'package:flutter/material.dart';

class DynamicTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? labelText;
  final String hintText;

  final IconData? prefixIcon;
  // final IconData? suffixicon;
  final bool ispassword;
  final String? Function(String?)? validator;

  final TextInputType? keyboardType;

  const DynamicTextFormField({
    super.key,
    required this.controller,
    this.labelText,
    required this.hintText,
    this.ispassword = false,
    this.prefixIcon,
    this.validator,

    // this.suffixicon,
    this.keyboardType,
  });

  @override
  State<DynamicTextFormField> createState() => _DynamicTextFormFieldState();
}

class _DynamicTextFormFieldState extends State<DynamicTextFormField> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText ?? "", style: textTheme.bodyLarge),

        const SizedBox(height: 5),

        SizedBox(
          width: double.infinity,
          child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: widget.ispassword ? isObscured : false,
            // expands: true,
            maxLines: 1,
            cursorColor: Colors.black,
            cursorHeight: 20,

            style: const TextStyle(fontSize: 16, color: Colors.black),
            validator: widget.validator,

            decoration: InputDecoration(
              hintText: widget.hintText,

              hintStyle: textTheme.bodyMedium,

              filled: true,
              fillColor: Colors.white,

              prefixIcon: widget.prefixIcon != null
                  ? Icon(widget.prefixIcon, color: Colors.black)
                  : null,

              suffixIcon: widget.ispassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isObscured = !isObscured;
                        });
                      },
                      icon: Icon(
                        isObscured
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,

                        color: Colors.grey,
                      ),
                    )
                  : null,

              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 13,
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.grey),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.grey, width: 2),
              ),

              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.red, width: 2),
              ),

              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.red, width: 2),
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.004),
      ],
    );
  }
}
