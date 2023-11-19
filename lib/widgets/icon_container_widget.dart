import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/const/app_icons.dart';
import 'package:test_project/const/color_constants.dart';

class IconContainerWidget extends StatelessWidget {
  const IconContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: ColorConstants.iconBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SvgPicture.asset(
        AppIcons.openLockIcons,
        color: ColorConstants.iconColor,
        width: 18,
        height: 18,
      ),
    );
  }
}

class CustomTextInputWidget extends StatelessWidget {
  const CustomTextInputWidget({
    required this.controller,
    required this.labelText,
    required this.keyboardType,
    required this.textInputAction,
    required this.validator,
    required this.onChanged,
    super.key,
  });

  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const IconContainerWidget(),
        const SizedBox(width: 30),
        Expanded(
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onSaved: (value) {
              controller.text = value!;
            },
            onChanged: onChanged,
            validator: validator,
            textInputAction: textInputAction,
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: const TextStyle(fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}
