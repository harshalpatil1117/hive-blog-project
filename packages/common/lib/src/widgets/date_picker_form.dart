import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelectionForm extends StatefulWidget {
  const DateSelectionForm({
    super.key,
    required this.onDateSelected,
    required this.hintText,
    this.needLabel,
    this.validation,
    this.needAsteriskSign,
    this.dateController,
    this.firstDate,
    this.lastDate,
    required this.label,
  });

  final Function(String) onDateSelected;
  final String hintText;
  final bool? needLabel;
  final String label;
  final String? Function(String?)? validation;
  final bool? needAsteriskSign;
  final TextEditingController? dateController;
  final DateTime? firstDate;
  final DateTime? lastDate;


  @override
  State<DateSelectionForm> createState() => _DateSelectionFormState();
}

class _DateSelectionFormState extends State<DateSelectionForm> {
  DateTime? selectedDate;


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.needLabel ?? false ?  Padding(
          padding: EdgeInsets.only(bottom: 8.h),
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
            ],
          ),
        ) : SizedBox.shrink(),
        TextFormField(
          controller: widget.dateController,
          onTap: () {
            _selectDate(context);
          },
          validator: widget.validation,
          keyboardType: TextInputType.none,
          decoration: InputDecoration(
            fillColor: theme.hiveColorsExtensions.background,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: theme.hiveColorsExtensions.background,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: theme.hiveColorsExtensions.primary,
              ),
            ),
            hintText: widget.hintText,

          ),
        ),
      ],
    );
  }

  // Function to show the date picker dialog and update the selectedDate variable.
  Future<void> _selectDate(BuildContext context) async {
    DateFormat inputFormat = DateFormat('dd/MM/yyyy');

    // Parse the contractDate using the defined input format
    DateTime parsedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? parsedDate,
      firstDate: widget.firstDate ?? DateTime(2016),
      lastDate: widget.lastDate ?? DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.dateController?.text = formatDate(selectedDate!);
      });
      // Call the callback function with the formatted date.
      widget.onDateSelected(widget.dateController!.text);
    }
    else{
      setState(() {
        selectedDate = picked;
        widget.dateController?.text = formatDate(selectedDate ?? DateTime.now());
      });
      // Call the callback function with the formatted date.
      widget.onDateSelected(widget.dateController!.text);
    }
  }

  // Function to format the selected date in "yyyy/mm/dd" format.
  String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}
