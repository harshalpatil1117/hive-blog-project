import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeSelectionForm extends StatefulWidget {
  const TimeSelectionForm({
    Key? key,
    required this.onTimeSelected,
    required this.hintText,
    this.needLabel = false,
    this.enabled = false,
    required this.label,
    this.rightWidget,
    this.validation,
    this.needAsteriskSign,
    required this.timeController,
  }) : super(key: key);

  final Function(String) onTimeSelected;
  final String hintText;
  final bool needLabel;
  final bool enabled;
  final String label;
  final Widget? rightWidget;
  final String? Function(String?)? validation;
  final bool? needAsteriskSign;
  final TextEditingController timeController;

  @override
  _TimeSelectionFormState createState() => _TimeSelectionFormState();
}

class _TimeSelectionFormState extends State<TimeSelectionForm> {
  TimeOfDay? selectedTime;

  // @override
  // void dispose() {
  //   _timeController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.needLabel
            ? Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.label,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.hiveColorsExtensions.onBackground,
                      ),
                    ),
                    widget.needAsteriskSign ?? false ? TextSpan(
                      text: ' *',
                      style: TextStyle(
                        color: Colors.red, // Asterisk color in red
                      ),
                    ) : TextSpan(),
                  ],
                ),
              ),
              widget.rightWidget ?? const SizedBox.shrink()
            ],
          ),
        )
            : const SizedBox.shrink(),
        TextFormField(
          enabled: widget.enabled,
          controller: widget.timeController,
          onTap: () {
            _selectTime(context);
          },
          validator: widget.validation,
          keyboardType: TextInputType.none,
          decoration: InputDecoration(
            fillColor: theme.hiveColorsExtensions.background,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: theme.hiveColorsExtensions.background,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: theme.hiveColorsExtensions.background,
              ),
            ),
            hintText: widget.hintText,

          ),
        ),
      ],
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            timePickerTheme: TimePickerThemeData(
              dialTextStyle: TextStyle(
                color: Colors.green, // Change the color of AM text
              ),
              dayPeriodColor: Colors.red,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        widget.timeController.text = formatTime(selectedTime!);
      });

      widget.onTimeSelected(widget.timeController.text);
    }
    else{
      setState(() {
        selectedTime = picked;
        widget.timeController.text = formatTime(selectedTime ?? TimeOfDay.now());
      });
      // Call the callback function with the formatted date.
      widget.onTimeSelected(widget.timeController.text);
    }
  }

  String formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final selectedDateTime =
    DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final formattedTime = DateFormat('hh:mm a').format(selectedDateTime);
    return formattedTime;
  }
}



