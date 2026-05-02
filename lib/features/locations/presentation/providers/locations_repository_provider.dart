import 'package:dibs/core/network/dio_provider.dart';
import 'package:dibs/features/locations/data/datasource/locations_local_datasource.dart';
import 'package:dibs/features/locations/data/datasource/locations_remote_datasource.dart';
import 'package:dibs/features/locations/data/repositories/locations_repository_impl.dart';
import 'package:dibs/features/locations/domain/repositories/locations_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final locationsRepositoryProvider = Provider<LocationsRepository>(
  (ref) => LocationsRepositoryImpl(
    localDatasource: LocationsLocalDatasource(),
    remoteDatasource: LocationsRemoteDatasource(ref.watch(dioProvider)),
  ),
);
