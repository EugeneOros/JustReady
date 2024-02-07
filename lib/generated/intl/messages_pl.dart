// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pl locale. All the
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
  String get localeName => 'pl';

  static String m0(mealNumber) => "Suma (${mealNumber}) :";

  static String m1(mealName) => "Wybrano - ${mealName}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addMealsToOrder": MessageLookupByLibrary.simpleMessage("Dodaj dania"),
        "addOrders": MessageLookupByLibrary.simpleMessage("Zamów"),
        "addToOrder":
            MessageLookupByLibrary.simpleMessage("Dodaj do zamówienia"),
        "additionalInstructions":
            MessageLookupByLibrary.simpleMessage("Dodatkowe instrukcje"),
        "additionalInstructionsExample":
            MessageLookupByLibrary.simpleMessage("N.p.: Bez kurczaka"),
        "cancel": MessageLookupByLibrary.simpleMessage("Anuluj"),
        "dashboard": MessageLookupByLibrary.simpleMessage("Panel"),
        "enterMealName":
            MessageLookupByLibrary.simpleMessage("Wprowadź nazwe dania"),
        "enterPriceName":
            MessageLookupByLibrary.simpleMessage("Wprowadź cene dania"),
        "goToSummary":
            MessageLookupByLibrary.simpleMessage("Przejdź do podsumowania"),
        "mealNumber": MessageLookupByLibrary.simpleMessage("Numer dania"),
        "meals": MessageLookupByLibrary.simpleMessage("Dania"),
        "name": MessageLookupByLibrary.simpleMessage("Nazwa"),
        "newMeal": MessageLookupByLibrary.simpleMessage("Nowe danie"),
        "notes": MessageLookupByLibrary.simpleMessage("Uwagi"),
        "nothingHire": MessageLookupByLibrary.simpleMessage("Nic tu niema"),
        "orderDetails":
            MessageLookupByLibrary.simpleMessage("Szczegóły zamówienia"),
        "orderNow": MessageLookupByLibrary.simpleMessage("Zamów teraz"),
        "orderSum": m0,
        "orders": MessageLookupByLibrary.simpleMessage("Zamówienia"),
        "price": MessageLookupByLibrary.simpleMessage("Cena"),
        "save": MessageLookupByLibrary.simpleMessage("Zapisz"),
        "scelectMeal": MessageLookupByLibrary.simpleMessage("Wybierz dania"),
        "scelectedMeal": m1,
        "showOrderDetails":
            MessageLookupByLibrary.simpleMessage("Pokaż szczegóły zamówienia"),
        "timeToAddSomethingTasty":
            MessageLookupByLibrary.simpleMessage("Czas dodać coś smacznego"),
        "yourOrder": MessageLookupByLibrary.simpleMessage("Twoje zamówienie")
      };
}
