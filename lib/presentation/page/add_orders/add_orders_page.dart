import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/page/add_orders/cubit/add_orders_cubit.dart';
import 'package:just_ready/presentation/page/add_orders/cubit/add_orders_state.dart';
import 'package:just_ready/presentation/widgets/buttons/jr_button.dart';
import 'package:just_ready/presentation/widgets/text_fields/jr_text_field.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/utils/logger.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../utils/hooks/use_once.dart';

class AddOrdersPage extends HookWidget {
  const AddOrdersPage({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<AddOrdersCubit>();
    final state = useBlocBuilder(cubit);
    useOnce(cubit.init);

    const String noteFormControlName = 'note';
    FormGroup buildForm() => fb.group(<String, Object>{
          noteFormControlName: FormControl<String>(),
        });

    return ReactiveFormBuilder(
      form: buildForm,
      builder: (_, form, __) => Scaffold(
        backgroundColor: context.colors.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Dimens.l),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimens.m),
                  child: JrText(
                    'AWybierz',
                    style: context.typography.header1,
                  ),
                ),
                const SizedBox(height: Dimens.xs),
                JrTextField(
                  labelText: Strings.of(context).notes,
                  formControlName: noteFormControlName,
                  form: form,
                  validationMessages: {
                    ValidationMessage.required: (_) => Strings.of(context).addOrders,
                  },
                  maxLines: null,
                  minLines: 4,
                  enabled: state is! AddOrdersStateLoading,
                  // onChanged: (_) => _onChange(form, isSignInButtonActive),
                  autocorrect: false,
                  showClearFiledButton: true,
                ),
                const SizedBox(height: Dimens.l),
                JrButton(
                  onPressed: () {
                    cubit.addOrder();
                    logger.i('Button Pressed');
                  },
                  title: Strings.of(context).addOrderPageAddOrder,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onChange(
    FormGroup form,
    ValueNotifier<bool> isSignInButtonActive,
  ) =>
      isSignInButtonActive.value = form.valid;
}
