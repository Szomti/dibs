import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../locations/presentation/providers/locations_repository_provider.dart';
import '../../domain/entities/item.dart';
import '../../items.dart';
import '../providers/items_repository_provider.dart';

class ItemsPage extends ConsumerStatefulWidget {
  final int categoryId;
  final int locationId;

  const ItemsPage({
    required this.categoryId,
    required this.locationId,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ItemsPageState();
}

class _ItemsPageState extends ConsumerState<ItemsPage> {
  late final _pagingController = PagingController<int, Item>(
    getNextPageKey: (state) =>
        state.lastPageIsEmpty ? null : state.nextIntPageKey,
    fetchPage: (int pageKey) => ref
        .read(itemsRepositoryProvider)
        .getItems(
          categoryId: widget.categoryId,
          locationId: widget.locationId,
          page: pageKey,
        ),
  );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Make family provider
    final location = ref
        .watch(locationsRepositoryProvider)
        .getByIdOrNull(widget.locationId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          location?.name ?? 'Items',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: PagingListener(
        controller: _pagingController,
        builder: (context, state, fetchNextPage) {
          return PagedListView<int, Item>(
            state: state,
            fetchNextPage: fetchNextPage,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, item, index) {
                return ItemTile(
                  categoryId: widget.categoryId,
                  locationId: widget.locationId,
                  item: item,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
