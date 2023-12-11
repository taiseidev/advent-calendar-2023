import 'package:advent_calendar_2023/ui/golden_test_screen.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../test_utils.dart';

void main() {
  testGoldens(
    'Golden Test Screen Test',
    (tester) async {
      final builder = DeviceBuilder()
        ..addScenario(
          widget: const GoldenTestScreen(),
        );

      await tester.pumpDeviceBuilder(
        builder,
        wrapper: (child) => TestUtils.buildTestMaterialApp(child),
      );

      await screenMatchesGolden(tester, 'golden_test_screen_test');
    },
  );
}
