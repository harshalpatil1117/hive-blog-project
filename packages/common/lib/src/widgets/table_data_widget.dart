import 'package:common/common.dart';
import 'package:flutter/material.dart';

class TableDataWidget extends StatelessWidget {
  const TableDataWidget({
    super.key,
    required this.data,
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return TableCell(
      child: Padding(
        padding: padding.symmetric(
          horizontal: Dimensions.smaller,
          vertical: Dimensions.smaller,
        ),
        child: Text(data,style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w400
        ),),
      ),
    );
  }
}
