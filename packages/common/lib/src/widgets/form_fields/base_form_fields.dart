import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef FormValidator = String? Function(String?);



class BaseFormField extends StatefulWidget {
  const BaseFormField({
    super.key,
    required this.label,
    this.controller,
    required this.enabled,
    required this.validation,
    required this.isPasswordField,
    required this.isNumber,
    required this.hintText,
    this.needAsteriskSign,
    this.maxLength,
  });

  final String label;
  final bool enabled;
  final TextEditingController? controller;
  final String? Function(String?) validation;
  final bool isPasswordField;
  final bool isNumber;
  final bool? needAsteriskSign;
  final String hintText;
  final int? maxLength;

  @override
  State<BaseFormField> createState() => _BaseFormFieldState();
}

class _BaseFormFieldState extends State<BaseFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
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
        Space(Dimensions.smallest),
        TextFormField(
          keyboardType: widget.isNumber ? TextInputType.number : TextInputType.text,
          textInputAction: TextInputAction.done,
          controller: widget.controller,
          enabled: widget.enabled,
          maxLength: widget.maxLength != null ? widget.maxLength : null,
          style: theme.textTheme.labelLarge!.copyWith(
            color: theme.hiveColorsExtensions.onBackground,
          ),
          validator: widget.validation,
          obscureText: widget.isPasswordField ? obscureText : false,
          decoration: FormFieldDecoration.decoration(
            context,
            widget.isPasswordField,
            obscureText,
            _setVisibility,
            widget.hintText,
          ),
        ),
      ],
    );
  }

  _setVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}

class SelectAddressFormField extends StatefulWidget {
  SelectAddressFormField(
      {super.key,
      required this.label,
      required this.onChanged,
      required this.options,
      required this.value});

  final String label;
  String value;
  final Function(String) onChanged;
  final List<String> options;

  @override
  State<SelectAddressFormField> createState() => _SelectFormFieldState();
}

class _SelectFormFieldState extends State<SelectAddressFormField> {
  @override
  Widget build(BuildContext context) {
    return BaseDropDownFormField(
      label: widget.label,
      options: widget.options,
      value: widget.value,
      onChanged: (newValue) {
        _dropDownOnChanged(newValue);
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please select an option';
        }
        return null; // Return null if there's no error
      },
    );
  }

  void _dropDownOnChanged(String? newValue) {
    setState(
      () {
        widget.value = newValue!;
        widget.onChanged(widget.value);
      },
    );
  }
}

class BaseDropDownFormField extends StatefulWidget {
  const BaseDropDownFormField({
    super.key,
    required this.label,
    this.hintText = 'Select',
    this.options = const [],

    required this.value,
    required this.onChanged,
    required this.validator,
    this.needAsteriskSign,

  });

  final String label;
  final String hintText;
  final List<String> options;

  final String value;
  final void Function(String?) onChanged;
  final String? Function(String?) validator;
  final bool? needAsteriskSign;

  @override
  State<BaseDropDownFormField> createState() => BaseDropDownFormFieldState();
}

class BaseDropDownFormFieldState extends State<BaseDropDownFormField> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
        Space(Dimensions.smaller),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            filled: true,
            fillColor: theme.hiveColorsExtensions.background,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: theme.hiveColorsExtensions.background,
              ),
              borderRadius: BorderRadius.circular(
                Dimensions.of(context).radii.medium,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: theme.hiveColorsExtensions.primary,
              ),
              borderRadius: BorderRadius.circular(
                Dimensions.of(context).radii.medium,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: theme.hiveColorsExtensions.error,
              ),
              borderRadius: BorderRadius.circular(
                Dimensions.of(context).radii.medium,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: theme.hiveColorsExtensions.error,
              ),
              borderRadius: BorderRadius.circular(
                Dimensions.of(context).radii.small,
              ),
            ),
          ),
          iconEnabledColor: theme.hiveColorsExtensions.onBackground,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value: widget.value,
          onChanged: (String? newValue) {
            widget.onChanged(newValue);
          },
          isExpanded: true,
          validator: widget.validator,
          items: widget.options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Space(Dimensions.smaller),
      ],
    );
  }
}

class DropDownWithSearch extends StatefulWidget {
  DropDownWithSearch({
    Key? key,
    required this.label,
    this.hintText = 'Select Customers',
    this.options = const [],
    this.initialSelect,
    required this.onChanged,
    required this.validator,
    this.needAsteriskSign,
    required this.isEnabled,
  }) : super(key: key);

  final String label;
  final String hintText;
  final List<String> options;
  final void Function(List<String>?) onChanged;
  final String? Function(List<String>?) validator;
  final bool? needAsteriskSign;
  final bool isEnabled;
  final List<String>? initialSelect;

  @override
  State<DropDownWithSearch> createState() => DropDownWithSearchState();
}

class DropDownWithSearchState extends State<DropDownWithSearch> {
  List<String>? selectedOptions;
  final GlobalKey<DropDownWithSearchState> dropdownKey = GlobalKey<DropDownWithSearchState>();
  void clearSelection() {
    setState(() {
      selectedOptions = [];
    });
    widget.onChanged(selectedOptions);
    print("called");
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: widget.label,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.textTheme.bodyLarge?.color,
                ),
              ),
              widget.needAsteriskSign ?? false
                  ? TextSpan(
                text: ' *',
                style: TextStyle(
                  color: Colors.red, // Asterisk color in red
                ),
              )
                  : TextSpan(),
            ],
          ),
        ),
        Space(Dimensions.small),
        CustomDropdown<String>.multiSelectSearch(
          initialItems: widget.initialSelect,
          enabled: widget.isEnabled,
          hintText: widget.hintText,
          items: widget.options,
          onListChanged: (value) {
            setState(() {
              selectedOptions = value;
            });
            widget.onChanged(value);
          },
          listValidator: widget.validator,
        ),
        Space(Dimensions.small),
      ],
    );
  }
}




class FormFieldDecoration {
  static InputDecoration decoration(BuildContext context, bool isPassword,
      bool obscureText, VoidCallback? callback, String hintTextValue) {
    return InputDecoration(
      hintText: hintTextValue,
      suffixIcon: isPassword
          ? IconButton(
        onPressed: () => callback!(),
        icon: obscureText
            ? Icon(Icons.visibility_off,color: Theme.of(context).hiveColorsExtensions.primary,)
            : Icon(Icons.visibility,color: Theme.of(context).hiveColorsExtensions.primary,),
      )
          : null,
      fillColor: Theme.of(context).hiveColorsExtensions.background,
      filled: true,
      hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
        color:
        Theme.of(context).hiveColorsExtensions.onBackground,
        fontWeight: FontWeight.w400,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(
          color: Theme.of(context).hiveColorsExtensions.secondary,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(
          color: Theme.of(context).hiveColorsExtensions.error,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(
          color: Theme.of(context).hiveColorsExtensions.primary,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(
          color: Theme.of(context).hiveColorsExtensions.error,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(
          color: Theme.of(context).hiveColorsExtensions.border,
        ),
      ),
    );
  }
}
