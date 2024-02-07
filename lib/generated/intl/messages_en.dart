// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(mealNumber) => "Total price (${mealNumber}) :";

  static String m1(mealName) => "Scelected - ${mealName}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addMealsToOrder": MessageLookupByLibrary.simpleMessage("Add meals"),
        "addOrders": MessageLookupByLibrary.simpleMessage("Add Orders"),
        "addToOrder": MessageLookupByLibrary.simpleMessage("Add to order"),
        "additionalInstructions":
            MessageLookupByLibrary.simpleMessage("Additional instructions"),
        "additionalInstructionsExample":
            MessageLookupByLibrary.simpleMessage("Ex: No chiken"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "dashboard": MessageLookupByLibrary.simpleMessage("Dashboard"),
        "enterMealName":
            MessageLookupByLibrary.simpleMessage("Enter meal name"),
        "enterPriceName":
            MessageLookupByLibrary.simpleMessage("Enter meal price"),
        "goToSummary": MessageLookupByLibrary.simpleMessage("Go to summary"),
        "mealNumber": MessageLookupByLibrary.simpleMessage("Meal number"),
        "meals": MessageLookupByLibrary.simpleMessage("Meals"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "newMeal": MessageLookupByLibrary.simpleMessage("New meal"),
        "notes": MessageLookupByLibrary.simpleMessage("Notes"),
        "nothingHire": MessageLookupByLibrary.simpleMessage("Nothing hire"),
        "orderDetails": MessageLookupByLibrary.simpleMessage("Order details"),
        "orderNow": MessageLookupByLibrary.simpleMessage("Order now"),
        "orderSum": m0,
        "orders": MessageLookupByLibrary.simpleMessage("Orders"),
        "price": MessageLookupByLibrary.simpleMessage("Price"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "scelectMeal": MessageLookupByLibrary.simpleMessage("Scelect meal"),
        "scelectedMeal": m1,
        "showOrderDetails":
            MessageLookupByLibrary.simpleMessage("Show order details"),
        "timeToAddSomethingTasty":
            MessageLookupByLibrary.simpleMessage("Time to add something tasty"),
        "yourOrder": MessageLookupByLibrary.simpleMessage("Your order")
      };
}
