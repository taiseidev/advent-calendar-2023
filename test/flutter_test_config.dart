import 'dart:async';
import 'dart:io';

import 'package:golden_toolkit/golden_toolkit.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return GoldenToolkit.runWithConfiguration(
    () async {
      await loadAppFonts();
      await testMain();
    },
    config: GoldenToolkitConfiguration(
      enableRealShadows: true,
      fileNameFactory: (name) {
        return 'goldens/$name.png';
      },
      defaultDevices: const [
        Device.phone,
        Device.iphone11,
      ],
      skipGoldenAssertion: () => !Platform.isMacOS,
    ),
  );
}
