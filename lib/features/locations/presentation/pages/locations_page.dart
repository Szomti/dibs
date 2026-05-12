import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../categories/presentation/providers/categories_provider.dart';
import '../../domain/entities/location.dart';
import '../../locations.dart';
import '../providers/locations_repository_provider.dart';

class LocationsPage extends ConsumerStatefulWidget {
  final int categoryId;

  const LocationsPage({required this.categoryId, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LocationsPageState();
}

class _LocationsPageState extends ConsumerState<LocationsPage> {
  late final _pagingController = PagingController<int, Location>(
    getNextPageKey: (state) =>
        state.lastPageIsEmpty ? null : state.nextIntPageKey,
    fetchPage: (pageKey) async => ref
        .read(locationsRepositoryProvider)
        .getLocations(categoryId: widget.categoryId, page: pageKey),
  );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final category = ref.watch(categoryProvider(widget.categoryId));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category?.name ?? 'Locations',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: PagingListener(
        controller: _pagingController,
        builder: (context, state, fetchNextPage) {
          return PagedListView<int, Location>(
            state: state,
            fetchNextPage: fetchNextPage,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, item, index) {
                return LocationTile(
                  categoryId: widget.categoryId,
                  location: item,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
