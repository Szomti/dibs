import 'package:country_flags/country_flags.dart';
import 'package:dibs/core/constants/app_dimensions.dart' as dims;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

// TODO: Actual screen with data from server
class LocationsPage extends ConsumerWidget {
  final places = const [
    'ETI - Lab C1',
    'ETI - Lab C2',
    'ETI - Lab D',
    'ETI - Lab E',
    'WMECH - Lab M1',
    'WMECH - Lab M2',
    'CNT - Nano Lab',
    'GUT Library - Computer Room',
  ];
  final int categoryId;

  const LocationsPage({required this.categoryId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Locations')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _createLocation(0),
                  _createLocation(1),
                  _createLocation(2),
                  _createLocation(3),
                  _createLocation(4),
                  _createLocation(5),
                  _createLocation(6),
                  _createLocation(7),
                  const SizedBox(height: dims.sizeSm),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createLocation(int index) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: dims.sizeMd,
        vertical: dims.sizeSm,
      ),
      child: Padding(
        padding: const EdgeInsets.all(dims.sizeMd),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          places[index],
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: dims.sizeXs),
                  Row(
                    children: [
                      CountryFlag.fromCountryCode(
                        'PL',
                        theme: const ImageTheme(
                          height: 20,
                          width: 20,
                          shape: Circle(),
                        ),
                      ),
                      const SizedBox(width: dims.sizeSm),
                      const Expanded(
                        child: Text('Poland', style: TextStyle(fontSize: 14)),
                      ),
                    ],
                  ),
                  const SizedBox(height: dims.sizeXs),
                  const Row(
                    children: [
                      Icon(Symbols.location_on, size: 20),
                      SizedBox(width: dims.sizeSm),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'ul. Gabriela Narutowicza 11/12',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '80-233 Gdańsk',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: dims.sizeLg),
          ],
        ),
      ),
    );
  }
}
