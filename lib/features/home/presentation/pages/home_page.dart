import 'package:dibs/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(sizeMd),
            child: Column(
              children: [
                _createLeafCard(),
                _createLeafCard(),
                _createLeafCard(),
                _createLeafCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _createLeafCard() {
    return const Skeletonizer(
      enabled: true,
      child: Card(
        margin: EdgeInsets.only(bottom: sizeMd),
        child: Padding(
          padding: EdgeInsets.all(sizeMd),
          child: Row(
            children: [
              Icon(Icons.circle, size: 42.0),
              SizedBox(width: sizeSm),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [Expanded(child: Text('----- ---- -------'))],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '----- ---- ------- ----- ------------ -- ------------- -------- ----- -------- ---- -- -------',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
