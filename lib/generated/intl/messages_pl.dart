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
        "dashbordDoneTitle": MessageLookupByLibrary.simpleMessage("Do odbioru"),
        "dashbordInProgresTitle":
            MessageLookupByLibrary.simpleMessage("Już się szykuje"),
        "dashbordWaitingTitle":
            MessageLookupByLibrary.simpleMessage("W oczekiwaniu"),
        "delivered": MessageLookupByLibrary.simpleMessage("Dostarczone"),
        "enterMealName":
            MessageLookupByLibrary.simpleMessage("Wprowadź nazwe dania"),
        "enterPriceName":
            MessageLookupByLibrary.simpleMessage("Wprowadź cene dania"),
        "forTwo": MessageLookupByLibrary.simpleMessage("za dwa"),
        "goToSummary":
            MessageLookupByLibrary.simpleMessage("Przejdź do podsumowania"),
        "inProgress": MessageLookupByLibrary.simpleMessage("W trakcie"),
        "mealNumber": MessageLookupByLibrary.simpleMessage("Numer dania"),
        "meals": MessageLookupByLibrary.simpleMessage("Dania"),
        "name": MessageLookupByLibrary.simpleMessage("Nazwa"),
        "newMeal": MessageLookupByLibrary.simpleMessage("Nowe danie"),
        "notes": MessageLookupByLibrary.simpleMessage("Uwagi"),
        "nothingHire": MessageLookupByLibrary.simpleMessage("Nic tu niema"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "orderDetails":
            MessageLookupByLibrary.simpleMessage("Szczegóły zamówienia"),
        "orderNow": MessageLookupByLibrary.simpleMessage("Zamów"),
        "orderSum": m0,
        "ordered": MessageLookupByLibrary.simpleMessage("Do zrobienia"),
        "orders": MessageLookupByLibrary.simpleMessage("Zamówienia"),
        "price": MessageLookupByLibrary.simpleMessage("Cena"),
        "priceForTwo": MessageLookupByLibrary.simpleMessage("Cena za dwa"),
        "ready": MessageLookupByLibrary.simpleMessage("Gotowe"),
        "save": MessageLookupByLibrary.simpleMessage("Zapisz"),
        "scelectedMeal": m1,
        "scelectedMealAddedToOrder":
            MessageLookupByLibrary.simpleMessage("Dodano do zamówienia"),
        "scelectedMealReturnToOrder":
            MessageLookupByLibrary.simpleMessage("Wróć do zamówienia"),
        "selectMeal": MessageLookupByLibrary.simpleMessage("Wybierz dania"),
        "selectMealNumber":
            MessageLookupByLibrary.simpleMessage("Wybierz numer dania"),
        "showOrderDetails":
            MessageLookupByLibrary.simpleMessage("Pokaż szczegóły zamówienia"),
        "somthingWentWrong":
            MessageLookupByLibrary.simpleMessage("Ups. Coś poszło nie tak"),
        "timeToAddSomethingTasty":
            MessageLookupByLibrary.simpleMessage("Czas dodać coś smacznego"),
        "yourOrder": MessageLookupByLibrary.simpleMessage("Twoje zamówienie"),
        "yourOrderNumber": MessageLookupByLibrary.simpleMessage("Twój numer"),
        "yourOrderWasCreated": MessageLookupByLibrary.simpleMessage(
            "Gratulacje. Zamówienie zostało złożone")
      };
}
