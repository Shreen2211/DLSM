import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../ViewModel/Utils/colorCustom.dart';

class InputCustom extends StatefulWidget {
  final String? inputName;
  final int? mini;
  final int? maxL;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? iconSuffix;
  final String? Function(String?)? validator;
  final void Function()? onPressed;

  const InputCustom(
      {required this.keyboardType,
      this.mini,
      this.iconSuffix,
      this.maxL,
      required this.inputName,
      this.onPressed,
      this.obscureText,
      this.controller,
      this.suffixIcon,
      this.prefixIcon,
      this.validator,
      super.key});

  @override
  State<InputCustom> createState() => _InputCustomState();
}

class _InputCustomState extends State<InputCustom> {
  bool tapped = false;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(() {
      setState(() {
        tapped = focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DottedBorder(
          strokeWidth: 1,
          color: tapped ? ColorCustom.red : Colors.black,
          dashPattern: const [3, 2],
          child: TextFormField(
            validator: widget.validator,
            controller: widget.controller,
            cursorColor: ColorCustom.red,
            maxLines: widget.maxL ?? 1,
            minLines: widget.mini ?? 1,
            obscureText: widget.obscureText ?? false,
            focusNode: focusNode,
            readOnly: false,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              hintText: "${widget.inputName}",
              hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
              suffixIcon:widget.suffixIcon?? Visibility(
                visible: widget.iconSuffix!=null,
                child: IconButton(
                  onPressed: widget.onPressed,
                  icon: widget.iconSuffix??const Icon(Icons.abc),
                  color: tapped ? ColorCustom.red : Colors.grey,
                ),
              ),
              prefixIcon: widget.prefixIcon,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
