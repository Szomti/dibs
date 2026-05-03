import 'package:dibs/features/items/domain/entities/item.dart';
import 'package:dibs/features/items/presentation/providers/items_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../items.dart';

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
    return Scaffold(
      appBar: AppBar(title: const Text('Items')),
      body: PagingListener(
        controller: _pagingController,
        builder: (context, state, fetchNextPage) {
          return PagedListView<int, Item>(
            state: state,
            fetchNextPage: fetchNextPage,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, item, index) {
                return ItemTile(item);
              },
            ),
          );
        },
      ),
    );
  }
}
