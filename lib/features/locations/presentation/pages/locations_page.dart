import 'dart:math';

import 'package:country_flags/country_flags.dart';
import 'package:dibs/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

class LocationsPage extends ConsumerStatefulWidget {
  const LocationsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LocationsPageState();
}

class _LocationsPageState extends ConsumerState<LocationsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(sizeSm),
              child: SearchBar(
                onTapOutside: (_) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
                hintText: 'Search for address',
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _createLocation(),
                    _createLocation(),
                    _createLocation(),
                    _createLocation(),
                    _createLocation(),
                    _createLocation(),
                    _createLocation(),
                    _createLocation(),
                    _createLocation(),
                    const SizedBox(height: sizeSm),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createLocation() {
    final rng = Random();
    final size = ['small', 'medium', 'large'].elementAt(rng.nextInt(3));
    final country = [
      ['Poland', 'PL'],
      ['Germany', 'DE'],
      ['Norway', 'NO'],
      ['France', 'FR'],
      ['Japan', 'JP'],
    ].elementAt(rng.nextInt(5));
    final city = [
      'Gdańsk',
      'Gdynia',
      'Warszawa',
      'Berlin',
      'Kyoto',
      'Osaka',
    ].elementAt(rng.nextInt(6));
    final street = [
      'Witomińska',
      'Władysława',
      'Marucka',
      'Niebieska',
      'Generała',
      'Warszawska',
    ].elementAt(rng.nextInt(6));
    final fNum = rng.nextInt(90) + 10;
    final sNum = rng.nextInt(900) + 100;
    final num = rng.nextInt(999) + 1;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: sizeMd, vertical: sizeSm),
      child: Padding(
        padding: const EdgeInsets.all(sizeMd),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Warehouse - $size',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: sizeXs),
                  Row(
                    children: [
                      CountryFlag.fromCountryCode(
                        country[1],
                        theme: const ImageTheme(
                          height: 20,
                          width: 20,
                          shape: Circle(),
                        ),
                      ),
                      const SizedBox(width: sizeSm),
                      Expanded(
                        child: Text(
                          country[0],
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: sizeXs),
                  Row(
                    children: [
                      const Icon(Symbols.location_on, size: 20),
                      const SizedBox(width: sizeSm),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'ul. $street $num',
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '$fNum-$sNum $city',
                                    style: const TextStyle(fontSize: 13),
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
            const Icon(Icons.arrow_forward_ios, size: sizeLg),
          ],
        ),
      ),
    );
  }
}
