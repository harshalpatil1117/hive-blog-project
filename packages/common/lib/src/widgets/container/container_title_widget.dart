import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ContainerTitleWidget extends StatelessWidget {
  const ContainerTitleWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Padding(
      padding: padding.symmetric(
        vertical: Dimensions.smaller,
        horizontal: Dimensions.smaller,
      ),
      child: Container(
        width: double.infinity,
        color: theme.hiveColorsExtensions.secondary,
        padding: padding.symmetric(
          vertical: Dimensions.smaller,
          horizontal: Dimensions.smallest,
        ),
        child: Text(
          title,
          style: theme.textTheme.headlineSmall?.copyWith(
            color: hiveColorsExtensions.primary,
          ),
        ),
      ),
    );
  }
}
