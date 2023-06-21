// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repository_impl/auth_repository_impl.dart' as _i6;
import '../../data/repository_impl/device_repository_impl.dart' as _i9;
import '../../domain/repositories/auth_repository.dart' as _i5;
import '../../domain/repositories/device_screen_repository.dart' as _i8;
import '../../domain/usecase/auth_usecase.dart' as _i7;
import '../../domain/usecase/device_screen_usecase.dart' as _i10;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i5.AuthRepository>(
      () => _i6.AuthRepositoryImpl(FirebaseAuth.instance));
  gh.factory<_i7.AuthUseCase>(() => _i7.AuthUseCase(gh<_i5.AuthRepository>()));
  gh.factory<_i8.DeviceScreenRepository>(
      () => _i9.DeviceScreenRepositoryImpl());
  gh.factory<_i10.DeviceScreenUseCase>(
      () => _i10.DeviceScreenUseCase(gh<_i8.DeviceScreenRepository>()));
  return getIt;
}
