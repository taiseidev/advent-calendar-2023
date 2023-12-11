import 'package:advent_calendar_2023/ui/weather_screen.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../test_utils.dart';

void main() {
  testGoldens(
    'Weather Screen Test',
    (tester) async {
      final builder = DeviceBuilder()
        ..addScenario(
          widget: const WeatherScreen(),
        );

      await tester.pumpDeviceBuilder(
        builder,
        wrapper: (child) => TestUtils.buildTestMaterialApp(child),
      );

      await screenMatchesGolden(tester, 'weather_screen_test');
    },
  );

  testGoldens(
    'Weather Screen Item Test',
    (tester) async {
      final builder = GoldenBuilder.grid(
        columns: 2,
        widthToHeightRatio: 1,
      )
        ..addScenario(
          'Sunny',
          const WeatherScreenItem(weather: Weather.sunny),
        )
        ..addScenario(
          'Cloudy',
          const WeatherScreenItem(weather: Weather.cloudy),
        )
        ..addScenario(
          'Raining',
          const WeatherScreenItem(weather: Weather.rain),
        )
        ..addScenario(
          'Snow',
          const WeatherScreenItem(weather: Weather.snow),
        );

      await tester.pumpWidgetBuilder(
        builder.build(),
        wrapper: (child) => TestUtils.buildTestMaterialApp(child),
      );
      await screenMatchesGolden(
        tester,
        'weather_types_grid',
        autoHeight: true,
      );
    },
  );
}
