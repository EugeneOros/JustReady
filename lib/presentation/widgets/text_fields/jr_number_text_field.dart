import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/extensions/build_context_extension.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:reactive_forms/reactive_forms.dart';

const _iconConstraints = BoxConstraints(maxWidth: Dimens.xxxl, maxHeight: Dimens.xxxl);

class JrNumberTextField extends HookWidget {
  final String formControlName;
  final FormGroup form;
  final Map<String, ValidationMessageFunction>? validationMessages;
  final Function(FormControl)? onChanged;
  final Function(FormControl)? onTap;
  final Function(FormControl)? onSubmit;
  final bool enabled;
  final TextEditingController? controller;

  const JrNumberTextField({
    super.key,
    required this.formControlName,
    required this.form,
    this.validationMessages,
    this.onChanged,
    this.onSubmit,
    this.onTap,
    this.enabled = true,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();

    final isFieldTouched = useState(false);

    useEffect(
      () {
        focusNode.addListener(() {
          if (!isFieldTouched.value && focusNode.hasFocus && controller != null && controller!.text.isNotEmpty) {
            isFieldTouched.value = true;
            form.control(formControlName).markAsTouched();
          }
        });
        return null;
      },
      [],
    );

    return ReactiveTextField(
      textAlignVertical: TextAlignVertical.center,
      autofocus: false,
      readOnly: !enabled,
      focusNode: focusNode,
      keyboardType: TextInputType.number,
      formControlName: formControlName,
      validationMessages: validationMessages,
      textInputAction: TextInputAction.next,
      maxLines: 1,
      textAlign: TextAlign.center,
      controller: controller,
      style: context.typography.input.copyWith(
        color: form.control(formControlName).hasErrors ? context.colors.error : context.colors.dark,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: context.colors.transparent,
        labelText: '',
        labelStyle: context.typography.input,
        alignLabelWithHint: true,
        floatingLabelStyle: context.typography.input,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.all(Dimens.zero),
        focusedBorder: _getBorder(color: context.colors.transparent, width: Dimens.zero),
        border: _getBorder(color: context.colors.transparent),
        errorBorder: _getBorder(color: context.colors.transparent, width: Dimens.zero),
        focusedErrorBorder: _getBorder(color: context.colors.transparent, width: Dimens.zero),
        enabledBorder: _getBorder(color: context.colors.transparent),
        disabledBorder: _getBorder(color: context.colors.transparent),
        errorStyle: context.typography.input.copyWith(fontSize: Dimens.zero),
        prefixIconConstraints: _iconConstraints,
        suffixIconConstraints: _iconConstraints,
      ),
      onTap: (formControl) => onTap?.call(formControl),
      onChanged: (formControl) => onChanged?.call(formControl),
      onSubmitted: onSubmit,
    );
  }

  OutlineInputBorder _getBorder({required Color color, double width = Dimens.zero}) => OutlineInputBorder(
        borderSide: BorderSide(color: color, width: width),
        borderRadius: BorderRadius.circular(Dimens.s),
      );
}
