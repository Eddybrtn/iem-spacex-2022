import 'package:get_it/get_it.dart';
import 'package:iem_spacex_2022/app/locator.config.dart';
import 'package:injectable/injectable.dart';

final locator = GetIt.I;

@injectableInit
void setupLocator() => $initGetIt(locator);