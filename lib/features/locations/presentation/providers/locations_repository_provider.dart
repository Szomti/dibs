import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../data/datasource/locations_remote_datasource.dart';
import '../../data/repositories/locations_repository_impl.dart';
import '../../domain/repositories/locations_repository.dart';

final locationsRepositoryProvider = Provider<LocationsRepository>(
  (ref) => LocationsRepositoryImpl(
    remoteDatasource: LocationsRemoteDatasource(ref.watch(dioProvider)),
  ),
);
