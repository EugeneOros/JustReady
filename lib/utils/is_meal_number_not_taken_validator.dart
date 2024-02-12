import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:reactive_forms/reactive_forms.dart';

const String requiredValidationMessageKey = 'required';
const String actualValidationMessageKey = 'actual';

class IsMealNumberNotTakenValidator<T> extends Validator<int> {
  final List<Meal> meals;
  final int mealNumber;
  final String validationMessage;

  const IsMealNumberNotTakenValidator(
    this.mealNumber,
    this.meals, {
    this.validationMessage = ValidationMessage.equals,
  }) : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<int> control) =>
      control.value != mealNumber && meals.any((meal) => meal.number == control.value)
          ? <String, dynamic>{
              validationMessage: <String, dynamic>{
                requiredValidationMessageKey: null,
                actualValidationMessageKey: control.value,
              },
            }
          : null;
}
