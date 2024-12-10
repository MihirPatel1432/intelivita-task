import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AppButton extends StatelessWidget {
  final Color? bgColor;
  final String text;
  final EdgeInsets? padding;
  final VoidCallback onTap;

  const AppButton(
      {super.key,
      this.bgColor,
      required this.text,
      this.padding,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: padding ?? const EdgeInsets.all(10),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    bgColor ?? context.theme.colorScheme.primary),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0))),
              ),
              onPressed: () => onTap.call(),
              child: Text(
                text,
                style: context.theme.textTheme.titleLarge
                    ?.copyWith(color: Colors.white),
              ),
            ),
          )),
    );
  }
}
