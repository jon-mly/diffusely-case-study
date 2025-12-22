import 'package:employees_app/presentation/style/fonts.dart';
import 'package:employees_app/presentation/style/radius.dart';
import 'package:employees_app/presentation/style/sizes.dart';
import 'package:employees_app/presentation/style/spacings.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.destructive = false,
  });

  final String text;
  final VoidCallback onPressed;
  final bool destructive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.buttonHeight,
      decoration: BoxDecoration(
        color: destructive
            ? Theme.of(context).colorScheme.error
            : Theme.of(context).colorScheme.primary,
        borderRadius: AppRadius.buttonBorderRadius,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: AppRadius.buttonBorderRadius,
          child: Padding(
            padding: .symmetric(horizontal: AppSpacing.m),
            child: Center(
              child: Text(
                text,
                style: AppFonts.h2.copyWith(
                  color: destructive
                      ? Theme.of(context).colorScheme.onError
                      : Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
