part of 'theme.dart';

final _elevatedButton = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    elevation: 2,
    padding: EdgeInsets.symmetric(vertical: 13),
    backgroundColor: _HiveColors.indigo,
    foregroundColor: _HiveColors.white,
    disabledBackgroundColor: _HiveColors.divider,
    disabledForegroundColor: _HiveColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    textStyle: const TextStyle(fontSize: 16),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  ),
);

final _outlinedButton = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    backgroundColor: _HiveColors.white,
    foregroundColor: _HiveColors.blueGrey,
    elevation: 2,
    padding: EdgeInsets.symmetric(vertical: 13),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    disabledBackgroundColor: _HiveColors.white,
    disabledForegroundColor: _HiveColors.divider,
    textStyle: const TextStyle(fontSize: 16),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  ).copyWith(
    side: MaterialStateProperty.resolveWith((states) {
      // If the button is disabled, return border side purple, otherwise grey
      if (states.contains(MaterialState.disabled)) {
        return const BorderSide(color: _HiveColors.divider);
      }
      return const BorderSide(color: _HiveColors.indigo);
    }),
  ),
);

final _textButton = TextButtonThemeData(
  style: TextButton.styleFrom(
    backgroundColor: _HiveColors.transparent,
    foregroundColor: _HiveColors.indigo,
    elevation: 2,
    padding: EdgeInsets.symmetric(vertical: 13),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    disabledBackgroundColor: _HiveColors.transparent,
    disabledForegroundColor: _HiveColors.divider,
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
    tapTargetSize: MaterialTapTargetSize.padded,
  ),
);
