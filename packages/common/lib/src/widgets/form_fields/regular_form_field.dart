import 'package:common/common.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/services.dart';


class RegularTextFormField extends StatefulWidget {
  final bool? enabled;
  final String label;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?) validation;
  final Function(String?)? onChange;
  final Function()? onEditingComplete;
  final GlobalKey<FormFieldState>? fieldKey;
  final bool? needLabel;
  final bool? isNumber;
  final int? maxLine;
  final int? maxLength;

  final bool? isPassword;
  final Widget? rightWidget;
  final bool? isSearchField;
  final bool? needAsteriskSign;

  final List<TextInputFormatter>? inputFormatters;


  const RegularTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.onChange,
    this.onEditingComplete,
    required this.validation,
    this.fieldKey,
    this.enabled,
    this.needLabel,
    this.isNumber,
    this.maxLine,
    this.maxLength,
    this.isPassword,
    this.rightWidget,
    this.isSearchField,
    this.needAsteriskSign,
    this.inputFormatters,
  });

  @override
  State<RegularTextFormField> createState() => _RegularTextFormFieldState();
}

class _RegularTextFormFieldState extends State<RegularTextFormField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    if (!_focusNode.hasFocus) {
      widget.onEditingComplete?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.needLabel ?? false
            ? Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: RichText(
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
              ),
              // Text(
              //   widget.label,
              //   style: theme.textTheme.titleLarge?.copyWith(
              //     color: theme.hiveColorsExtensions.onBackground,
              //   ),
              // ),
              widget.rightWidget ?? SizedBox.shrink(),
            ],
          ),
        )
            : SizedBox.shrink(),
        GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: TextFormField(
            inputFormatters: widget.inputFormatters,
            maxLength: widget.maxLength,
           // focusNode: _focusNode,
            keyboardType: widget.isNumber ?? false
                ? TextInputType.numberWithOptions(decimal: true)
                : TextInputType.text,
            textInputAction: TextInputAction.done,
            onChanged: widget.onChange,
            onEditingComplete: widget.onEditingComplete,
            controller: widget.controller,
            validator: widget.validation,
            enabled: widget.enabled,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w400,
            ),
            obscureText: widget.isPassword != null || widget.isPassword == true ? true : false,
            decoration: InputDecoration(
              fillColor:  widget.enabled == false ? theme.hiveColorsExtensions.background.withOpacity(0.4) : theme.hiveColorsExtensions.background,
              filled: true,
              hintText: widget.hintText,
              hintStyle: theme.textTheme.titleMedium?.copyWith(
                color:
                theme.hiveColorsExtensions.onBackground,
                fontWeight: FontWeight.w400,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: theme.hiveColorsExtensions.border,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: theme.hiveColorsExtensions.error,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: theme.hiveColorsExtensions.primary,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: theme.hiveColorsExtensions.error,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: theme.hiveColorsExtensions.border,
                ),
              ),
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10.r),
              //   borderSide: BorderSide(
              //     color: theme.hiveColorsExtensions.border,
              //   ),
              // ),
            ),
          ),),
       ],
    );
  }
}

class SingleTextFormField extends StatelessWidget {
  const SingleTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.onChange,
    required this.validation,
    this.fieldKey,
    this.enabled,
  });

  final bool? enabled;
  final String hintText;
  final TextEditingController controller;
  final Function(String?) validation;
  final Function(String?)? onChange;
  final GlobalKey<FormFieldState>? fieldKey;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      textInputAction: TextInputAction.next,
      onChanged: onChange,
      controller: controller,
      enabled: enabled,
      validator: (value) => validation(value),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: theme.textTheme.headlineSmall?.copyWith(
          color: theme.hiveColorsExtensions.onBackground.withOpacity(0.4),
          fontWeight: FontWeight.w700,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            color: theme.hiveColorsExtensions.border,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: theme.hiveColorsExtensions.error,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: theme.hiveColorsExtensions.primary,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: theme.hiveColorsExtensions.error,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: theme.hiveColorsExtensions.border,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: theme.hiveColorsExtensions.border,
          ),
        ),
      ),
    );
  }
}


class DescriptionTextBox extends StatefulWidget {
  final bool? enabled;
  final String label;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?) validation;
  final Function(String?)? onChange;
  final Function()? onEditingComplete;
  final GlobalKey<FormFieldState>? fieldKey;
  final bool? needLabel;
  final int? maxLength;
  final bool? needAsteriskSign;

  const DescriptionTextBox({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.onChange,
    this.onEditingComplete,
    required this.validation,
    this.fieldKey,
    this.enabled,
    this.needLabel,
    this.maxLength,
    this.needAsteriskSign,
  });

  @override
  State<DescriptionTextBox> createState() => _DescriptionTextBoxState();
}

class _DescriptionTextBoxState extends State<DescriptionTextBox> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.needLabel ?? false
            ? Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: RichText(
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
              ),
            ],
          ),
        )
            : SizedBox.shrink(),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 200,
          ),
          child: IntrinsicHeight(
            child: SingleChildScrollView(
              child: TextFormField(
                maxLines: null,
                minLines: 6,
                maxLength: widget.maxLength,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                onChanged: widget.onChange,
                onEditingComplete: widget.onEditingComplete,
                controller: widget.controller,
                validator: widget.validation,
                enabled: widget.enabled,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  fillColor:  widget.enabled == false ? theme.hiveColorsExtensions.background.withOpacity(0.4) : theme.hiveColorsExtensions.background,
                  filled: true,
                  hintText: widget.hintText,
                  hintStyle: theme.textTheme.titleMedium?.copyWith(
                    color:
                    theme.hiveColorsExtensions.onBackground,
                    fontWeight: FontWeight.w400,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: theme.hiveColorsExtensions.border,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: theme.hiveColorsExtensions.error,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: theme.hiveColorsExtensions.primary,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: theme.hiveColorsExtensions.error,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: theme.hiveColorsExtensions.border,
                    ),
                  ),
                ),
              ),),
          ),
        ),
      ],
    );
  }
}

