// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:behype_test/core/dependencies/network_module.dart' as _i6;
import 'package:behype_test/data/datasource/home_datasource.dart' as _i4;
import 'package:behype_test/data/repository/home/home_repository.dart' as _i5;
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i3.Dio>(
      () => networkModule.unsplashDio(),
      instanceName: 'unsplashDio',
    );
    gh.factory<_i4.HomeDataSource>(
        () => _i4.HomeDataSource(gh<_i3.Dio>(instanceName: 'unsplashDio')));
    gh.factory<_i5.HomeRepository>(
        () => _i5.HomeRepository(gh<_i4.HomeDataSource>()));
    return this;
  }
}

class _$NetworkModule extends _i6.NetworkModule {}
