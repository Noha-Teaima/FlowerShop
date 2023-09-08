import 'dart:io';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());

  var locale = Locale(Platform.localeName.substring(0, 2));

  void changeLanguage() {
    if (locale == Locale("en")) {
      locale = Locale("ar");
    } else {
      locale = Locale("en");
    }
    emit(LanguageChangeLanguage());
  }
}