import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../data/datasource/items_remote_datasource.dart';
import '../../data/repositories/items_repository_impl.dart';
import '../../domain/repositories/items_repository.dart';

final itemsRepositoryProvider = Provider<ItemsRepository>(
  (ref) => ItemsRepositoryImpl(ItemsRemoteDatasource(ref.watch(dioProvider))),
);
