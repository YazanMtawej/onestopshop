import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const OneStopShop()) , // Wrap your app
  );
}

class OneStopShop extends StatelessWidget {
  const OneStopShop({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      home: Scaffold(),
    );
  }
}