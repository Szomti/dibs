import 'package:dibs/core/network/dio_provider.dart';
import 'package:dibs/features/items/data/repositories/items_repository_impl.dart';
import 'package:dibs/features/items/domain/repositories/items_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasource/items_remote_datasource.dart';

final itemsRepositoryProvider = Provider<ItemsRepository>(
  (ref) => ItemsRepositoryImpl(ItemsRemoteDatasource(ref.watch(dioProvider))),
);
