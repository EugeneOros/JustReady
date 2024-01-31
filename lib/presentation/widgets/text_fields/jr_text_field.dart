import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/widgets/jr_svg_picture.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/styles/images.dart';
import 'package:just_ready/utils/ignore_else_state.dart';
import 'package:reactive_forms/reactive_forms.dart';

const _iconConstraints = BoxConstraints(maxWidth: Dimens.xxxl, maxHeight: Dimens.xxxl);

class JrTextField extends HookWidget {
  final String formControlName;
  final FormGroup? form;
  final String labelText;
  final String? prefixIcon;
  final bool obscureText;
  final Widget? suffixIcon;
  final Map<String, ValidationMessageFunction>? validationMessages;
  final Function(FormControl)? onChanged;
  final Function(FormControl)? onTap;
  final Function(FormControl)? onSubmit;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final bool isFloatingLabel;
  final TextAlign textAlign;
  final bool enabled;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool autocorrect;
  final bool showClearFiledButton;
  final bool selectAllOnTap;
  final Function(String?)? setErrorText;

  const JrTextField({
    super.key,
    required this.formControlName,
    this.form,
    required this.labelText,
    this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
    this.validationMessages,
    this.onChanged,
    this.onSubmit,
    this.onTap,
    this.maxLines = 1,
    this.minLines,
    this.keyboardType,
    this.isFloatingLabel = true,
    this.textAlign = TextAlign.start,
    this.enabled = true,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.autocorrect = true,
    this.showClearFiledButton = false,
    this.setErrorText,
    this.selectAllOnTap = false,
  }) : assert((showClearFiledButton && form != null) || !showClearFiledButton);

  @override
  Widget build(BuildContext context) {
    final focusNode = this.focusNode ?? useFocusNode();
    final textController = controller ?? useTextEditingController();

    final isShowingObscureText = useState(true);
    final isShowingClearButton = useState(false);
    final isFieldTouched = useState(false);
    final isFieldUntouched = useState(false);
    final errorText = useState<String?>(null);
    var hasFocus = useState(focusNode.hasFocus);

    useEffect(
      () {
        focusNode.addListener(() {
          hasFocus.value = focusNode.hasFocus;
          if (focusNode.hasFocus && !isFieldTouched.value) {
            isFieldTouched.value = true;
          } else if (!focusNode.hasFocus && isFieldTouched.value && !isFieldUntouched.value) {
            isFieldUntouched.value = true;
          }
        });
        return null;
      },
      [],
    );

    return Align(
      child: ReactiveTextField(
        autofocus: autofocus,
        readOnly: !enabled,
        focusNode: focusNode,
        keyboardType: keyboardType,
        formControlName: formControlName,
        validationMessages: validationMessages,
        // textInputAction: TextInputAction.next,
        obscureText: obscureText ? isShowingObscureText.value : obscureText,
        obscuringCharacter: '*',
        maxLines: maxLines,
        minLines: minLines,
        textAlign: textAlign,
        controller: textController,
        autocorrect: autocorrect,
        decoration: InputDecoration(
          isDense: true,
          // constraints: const BoxConstraints(minHeight: Dimens.noteTextFieldHeight, maxHeight: Dimens.noteTextFieldHeight),
          filled: true,
          fillColor: context.colors.bright,
          labelText: labelText,
          labelStyle: context.typography.body1.copyWith(color: context.colors.darkLight),
          alignLabelWithHint: true,
          floatingLabelStyle: context.typography.input.copyWith(color: context.colors.dark),
          floatingLabelBehavior: isFloatingLabel ? FloatingLabelBehavior.auto : FloatingLabelBehavior.never,
          contentPadding: const EdgeInsets.all(Dimens.xm),
          focusedBorder: _getBorder(context.colors.dark),
          border: _getBorder(context.colors.dark),
          errorBorder: _getBorder(context.colors.error),
          focusedErrorBorder: _getBorder(context.colors.error),
          enabledBorder: _getBorder(context.colors.dark),
          disabledBorder: _getBorder(context.colors.disabled),
          focusColor: context.colors.dark,
          // errorStyle: context.typography.body1,
          errorStyle: context.typography.input.copyWith(fontSize: Dimens.zero),
          prefixIcon: _buildPrefixIcon(),
          prefixIconConstraints: _iconConstraints,
          suffixIcon: _buildSuffixIcon(
            context,
            isShowingObscureText,
            isShowingClearButton,
            errorText,
          ),
          suffixIconConstraints: _iconConstraints,
        ),
        onTap: (formControl) {
          errorText.value = getErrorMessage(formControl);
          if (selectAllOnTap) textController.selectAll();
          onTap?.call(formControl);
        },
        onChanged: (formControl) {
          if (showClearFiledButton) {
            isShowingClearButton.value = (formControl.value as String?)?.isNotEmpty ?? false;
          }
          errorText.value = getErrorMessage(formControl);
          onChanged?.call(formControl);
        },
        onSubmitted: (_) => doNothing(), //onSubmit,
      ),
    );
  }

  String? getErrorMessage(FormControl formControl) {
    if (formControl.errors.isEmpty) return null;
    final errorKey = formControl.errors.keys.first;
    if (validationMessages != null && validationMessages!.containsKey(errorKey)) {
      return validationMessages![errorKey]?.call(errorKey);
    }
    return null;
  }

  OutlineInputBorder _getBorder(Color color) => OutlineInputBorder(
        borderSide: BorderSide(color: color, width: Dimens.xxxs),
        borderRadius: BorderRadius.circular(Dimens.s),
        gapPadding: Dimens.xxs,
      );

  Widget? _buildPrefixIcon() => prefixIcon != null
      ? Padding(
          padding: const EdgeInsets.all(Dimens.xm),
          child: JrSvgPicture(
            prefixIcon!,
            height: Dimens.l,
          ),
        )
      : null;

  Widget? _buildSuffixIcon(
    BuildContext context,
    ValueNotifier<bool> isShowingObscureText,
    ValueNotifier<bool> isShowingClearButton,
    ValueNotifier<String?> errorText,
  ) {
    if (suffixIcon != null) return suffixIcon;

    if (obscureText) {
      return InkWell(
        splashColor: context.colors.transparent,
        onTap: () => enabled ? isShowingObscureText.value = !isShowingObscureText.value : null,
        child: Padding(
          padding: const EdgeInsets.all(Dimens.xm),
          child: JrSvgPicture(
            isShowingObscureText.value ? IconsSvg.eye24 : IconsSvg.eyeSlash24,
            color: enabled ? context.colors.primary : context.colors.disabled,
          ),
        ),
      );
    }

    if (showClearFiledButton && isShowingClearButton.value && enabled) {
      return InkWell(
        onTap: () {
          final formControl = form?.controls[formControlName];

          if (formControl != null && formControl is FormControl) {
            isShowingClearButton.value = false;
            formControl.value = '';
            errorText.value = getErrorMessage(formControl);
            formControl.focus();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(Dimens.xm),
          child: JrSvgPicture(
            IconsSvg.close24,
          ),
        ),
      );
    }

    return null;
  }
}
