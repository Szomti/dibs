import 'package:dibs/features/locations/domain/entities/location.dart';
import 'package:dibs/features/locations/locations.dart';
import 'package:dibs/features/locations/presentation/providers/locations_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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
    return Scaffold(
      appBar: AppBar(title: const Text('Locations')),
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
