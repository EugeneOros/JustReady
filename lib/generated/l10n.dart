// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Strings {
  Strings();

  static Strings? _current;

  static Strings get current {
    assert(_current != null,
        'No instance of Strings was loaded. Try to initialize the Strings delegate before accessing Strings.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Strings> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Strings();
      Strings._current = instance;

      return instance;
    });
  }

  static Strings of(BuildContext context) {
    final instance = Strings.maybeOf(context);
    assert(instance != null,
        'No instance of Strings present in the widget tree. Did you add Strings.delegate in localizationsDelegates?');
    return instance!;
  }

  static Strings? maybeOf(BuildContext context) {
    return Localizations.of<Strings>(context, Strings);
  }

  /// `Orders`
  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `Add Orders`
  String get addOrders {
    return Intl.message(
      'Add Orders',
      name: 'addOrders',
      desc: '',
      args: [],
    );
  }

  /// `Meals`
  String get meals {
    return Intl.message(
      'Meals',
      name: 'meals',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message(
      'Dashboard',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Meal number`
  String get mealNumber {
    return Intl.message(
      'Meal number',
      name: 'mealNumber',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Enter meal name`
  String get enterMealName {
    return Intl.message(
      'Enter meal name',
      name: 'enterMealName',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Enter meal price`
  String get enterPriceName {
    return Intl.message(
      'Enter meal price',
      name: 'enterPriceName',
      desc: '',
      args: [],
    );
  }

  /// `New meal`
  String get newMeal {
    return Intl.message(
      'New meal',
      name: 'newMeal',
      desc: '',
      args: [],
    );
  }

  /// `Order details`
  String get orderDetails {
    return Intl.message(
      'Order details',
      name: 'orderDetails',
      desc: '',
      args: [],
    );
  }

  /// `Add to order`
  String get addToOrder {
    return Intl.message(
      'Add to order',
      name: 'addToOrder',
      desc: '',
      args: [],
    );
  }

  /// `Show order details`
  String get showOrderDetails {
    return Intl.message(
      'Show order details',
      name: 'showOrderDetails',
      desc: '',
      args: [],
    );
  }

  /// `Scelected - {mealName}`
  String scelectedMeal(Object mealName) {
    return Intl.message(
      'Scelected - $mealName',
      name: 'scelectedMeal',
      desc: '',
      args: [mealName],
    );
  }

  /// `Added to order`
  String get scelectedMealAddedToOrder {
    return Intl.message(
      'Added to order',
      name: 'scelectedMealAddedToOrder',
      desc: '',
      args: [],
    );
  }

  /// `Return to order`
  String get scelectedMealReturnToOrder {
    return Intl.message(
      'Return to order',
      name: 'scelectedMealReturnToOrder',
      desc: '',
      args: [],
    );
  }

  /// `Your order`
  String get yourOrder {
    return Intl.message(
      'Your order',
      name: 'yourOrder',
      desc: '',
      args: [],
    );
  }

  /// `Add meals`
  String get addMealsToOrder {
    return Intl.message(
      'Add meals',
      name: 'addMealsToOrder',
      desc: '',
      args: [],
    );
  }

  /// `Total price ({mealNumber}) :`
  String orderSum(Object mealNumber) {
    return Intl.message(
      'Total price ($mealNumber) :',
      name: 'orderSum',
      desc: '',
      args: [mealNumber],
    );
  }

  /// `Go to summary`
  String get goToSummary {
    return Intl.message(
      'Go to summary',
      name: 'goToSummary',
      desc: '',
      args: [],
    );
  }

  /// `Nothing hire`
  String get nothingHire {
    return Intl.message(
      'Nothing hire',
      name: 'nothingHire',
      desc: '',
      args: [],
    );
  }

  /// `Time to add something tasty`
  String get timeToAddSomethingTasty {
    return Intl.message(
      'Time to add something tasty',
      name: 'timeToAddSomethingTasty',
      desc: '',
      args: [],
    );
  }

  /// `Additional instructions`
  String get additionalInstructions {
    return Intl.message(
      'Additional instructions',
      name: 'additionalInstructions',
      desc: '',
      args: [],
    );
  }

  /// `Ex: No chiken`
  String get additionalInstructionsExample {
    return Intl.message(
      'Ex: No chiken',
      name: 'additionalInstructionsExample',
      desc: '',
      args: [],
    );
  }

  /// `Your number`
  String get yourOrderNumber {
    return Intl.message(
      'Your number',
      name: 'yourOrderNumber',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Order now`
  String get orderNow {
    return Intl.message(
      'Order now',
      name: 'orderNow',
      desc: '',
      args: [],
    );
  }

  /// `Scelect meal`
  String get selectMeal {
    return Intl.message(
      'Scelect meal',
      name: 'selectMeal',
      desc: '',
      args: [],
    );
  }

  /// `Scelect meal number`
  String get selectMealNumber {
    return Intl.message(
      'Scelect meal number',
      name: 'selectMealNumber',
      desc: '',
      args: [],
    );
  }

  /// `To do`
  String get ordered {
    return Intl.message(
      'To do',
      name: 'ordered',
      desc: '',
      args: [],
    );
  }

  /// `In progress`
  String get inProgress {
    return Intl.message(
      'In progress',
      name: 'inProgress',
      desc: '',
      args: [],
    );
  }

  /// `Ready`
  String get ready {
    return Intl.message(
      'Ready',
      name: 'ready',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get delivered {
    return Intl.message(
      'Delivered',
      name: 'delivered',
      desc: '',
      args: [],
    );
  }

  /// `Waiting`
  String get dashbordWaitingTitle {
    return Intl.message(
      'Waiting',
      name: 'dashbordWaitingTitle',
      desc: '',
      args: [],
    );
  }

  /// `In Progress`
  String get dashbordInProgresTitle {
    return Intl.message(
      'In Progress',
      name: 'dashbordInProgresTitle',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get dashbordDoneTitle {
    return Intl.message(
      'Done',
      name: 'dashbordDoneTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ups. Somthing went wrong`
  String get somthingWentWrong {
    return Intl.message(
      'Ups. Somthing went wrong',
      name: 'somthingWentWrong',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Strings> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pl'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Strings> load(Locale locale) => Strings.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
