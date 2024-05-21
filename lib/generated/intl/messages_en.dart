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
        "dashbordDoneTitle": MessageLookupByLibrary.simpleMessage("Done"),
        "dashbordInProgresTitle":
            MessageLookupByLibrary.simpleMessage("In Progress"),
        "dashbordWaitingTitle": MessageLookupByLibrary.simpleMessage("Waiting"),
        "delivered": MessageLookupByLibrary.simpleMessage("Delivered"),
        "enterMealName":
            MessageLookupByLibrary.simpleMessage("Enter meal name"),
        "enterPriceName":
            MessageLookupByLibrary.simpleMessage("Enter meal price"),
        "forTwo": MessageLookupByLibrary.simpleMessage("for two"),
        "goToSummary": MessageLookupByLibrary.simpleMessage("Go to summary"),
        "inProgress": MessageLookupByLibrary.simpleMessage("In progress"),
        "mealNumber": MessageLookupByLibrary.simpleMessage("Meal number"),
        "meals": MessageLookupByLibrary.simpleMessage("Meals"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "newMeal": MessageLookupByLibrary.simpleMessage("New meal"),
        "notes": MessageLookupByLibrary.simpleMessage("Notes"),
        "nothingHire": MessageLookupByLibrary.simpleMessage("Nothing hire"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "orderDetails": MessageLookupByLibrary.simpleMessage("Order details"),
        "orderNow": MessageLookupByLibrary.simpleMessage("Order"),
        "orderSum": m0,
        "ordered": MessageLookupByLibrary.simpleMessage("To do"),
        "orders": MessageLookupByLibrary.simpleMessage("Orders"),
        "price": MessageLookupByLibrary.simpleMessage("Price"),
        "priceForTwo": MessageLookupByLibrary.simpleMessage("Price for two"),
        "ready": MessageLookupByLibrary.simpleMessage("Ready"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "scelectedMeal": m1,
        "scelectedMealAddedToOrder":
            MessageLookupByLibrary.simpleMessage("Added to order"),
        "scelectedMealReturnToOrder":
            MessageLookupByLibrary.simpleMessage("Return to order"),
        "selectMeal": MessageLookupByLibrary.simpleMessage("Scelect meal"),
        "selectMealNumber":
            MessageLookupByLibrary.simpleMessage("Scelect meal number"),
        "showOrderDetails":
            MessageLookupByLibrary.simpleMessage("Show order details"),
        "somthingWentWrong":
            MessageLookupByLibrary.simpleMessage("Ups. Somthing went wrong"),
        "statistics": MessageLookupByLibrary.simpleMessage("Statistics"),
        "timeToAddSomethingTasty":
            MessageLookupByLibrary.simpleMessage("Time to add something tasty"),
        "yourOrder": MessageLookupByLibrary.simpleMessage("Your order"),
        "yourOrderNumber": MessageLookupByLibrary.simpleMessage("Your number"),
        "yourOrderWasCreated": MessageLookupByLibrary.simpleMessage(
            "Congratulation. Your order was created")
      };
}
