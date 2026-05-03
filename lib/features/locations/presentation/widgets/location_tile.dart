import 'package:country_flags/country_flags.dart';
import 'package:dibs/features/locations/domain/entities/location.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;

class LocationTile extends StatelessWidget {
  static const _countryFlagTheme = ImageTheme(
    height: 20,
    width: 20,
    shape: Circle(),
  );
  static const _cardPadding = EdgeInsets.all(dims.sizeMd);
  static const _cardMargin = EdgeInsets.symmetric(
    horizontal: dims.sizeMd,
    vertical: dims.sizeSm,
  );

  final int categoryId;
  final Location location;

  const LocationTile({
    required this.categoryId,
    required this.location,
    super.key,
  });

  String get _apartmentInfo => location.apartmentNumber != null
      ? ', Apt ${location.apartmentNumber}'
      : '';

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: _cardMargin,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.go(
          '/app/categories/$categoryId/locations/${location.id}/items',
        ),
        child: Padding(
          padding: _cardPadding,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      location.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: dims.sizeXs),
                    Row(
                      children: [
                        CountryFlag.fromCountryCode(
                          location.countryCode,
                          theme: _countryFlagTheme,
                        ),
                        const SizedBox(width: dims.sizeSm),
                        Expanded(
                          child: Text(
                            location.country,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: dims.sizeXs),
                    Row(
                      children: [
                        const Icon(Symbols.location_on, size: 20),
                        const SizedBox(width: dims.sizeSm),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                '${location.buildingNumber} ${location.street} Street$_apartmentInfo',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '${location.postalCode} ${location.city}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Symbols.arrow_forward_ios, size: dims.sizeLg),
            ],
          ),
        ),
      ),
    );
  }
}
