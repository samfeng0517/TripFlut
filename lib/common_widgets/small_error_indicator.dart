import 'package:flutter/material.dart';
import 'package:tripflut/utils/app_localizations_context.dart';

class SmallErrorIndicator extends StatelessWidget {
  const SmallErrorIndicator({
    Key? key,
    this.onTap,
  }) : super(key: key);
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16,
            bottom: 16,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.loc.error_and_tap_to_try_again,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 4,
                ),
                const Icon(
                  Icons.refresh,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      );
}
