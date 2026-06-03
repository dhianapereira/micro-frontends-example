# Creating a Micro App

This document describes the expected structure for adding a new micro app to this workspace.

A micro app owns a focused product area. It exposes its routes through the `MicroApp` contract from `foundations`, keeps its own localized strings, and declares only the dependencies it directly uses.

## Folder Structure

Create the package inside `micro_apps`:

```text
micro_apps/
  micro_app_example/
    analysis_options.yaml
    l10n.yaml
    pubspec.yaml
    lib/
      micro_app_example.dart
      src/
        configs/
          constants.dart
          micro_app.dart
        l10n/
          arb/
            app_en.arb
            app_pt.arb
          generated/
          l10n.dart
        example_page.dart
    test/
      configs/
        constants_test.dart
        micro_app_test.dart
      example_page_test.dart
```

The generated localization files live in `lib/src/l10n/generated` and are created by Flutter from the ARB files.

## Pubspec

Each micro app should declare only the packages it uses directly.

```yaml
name: micro_app_example
description: "Example micro app."
version: 0.0.1
publish_to: 'none'

environment:
  sdk: '>=3.12.0 <4.0.0'
  flutter: ">=3.44.0"

resolution: workspace

dependencies:
  flutter:
    sdk: flutter

  flutter_localizations:
    sdk: flutter
  foundations:
    path: ../../packages/foundations

dev_dependencies:
  flutter_test:
    sdk: flutter

  flutter_lints: 6.0.0
  mocktail: 1.0.5

flutter:
  generate: true
  uses-material-design: true
```

Add other packages only when the micro app uses them. For example, add `event_bus` only when the micro app emits or listens to app-level events.

## Workspace Registration

Add the new package to the root `pubspec.yaml` workspace:

```yaml
workspace:
  - base_app
  - packages/foundations
  - packages/event_bus
  - micro_apps/micro_app_home
  - micro_apps/micro_app_login
  - micro_apps/micro_app_example
```

Then add it as a dependency of `base_app`:

```yaml
dependencies:
  micro_app_example:
    path: ../micro_apps/micro_app_example
```

Finally, register it in `BaseApp.microApps`:

```dart
List<MicroApp> get microApps {
  return [
    MicroAppLogin(),
    MicroAppHome(),
    MicroAppExample(),
  ];
}
```

## Public Export

The root library should export the micro app config and its localization helper:

```dart
export 'src/configs/micro_app.dart';
export 'src/l10n/l10n.dart';
```

This lets the shell app import the micro app and register its localization delegate without reaching into private implementation folders.

## MicroApp Implementation

Implement the `MicroApp` contract from `foundations`:

```dart
import 'package:foundations/foundations.dart';
import 'package:micro_app_example/src/configs/constants.dart';
import 'package:micro_app_example/src/example_page.dart';

class MicroAppExample implements MicroApp {
  @override
  String get microAppName => Constants.microAppName;

  @override
  Map<String, WidgetBuilderArgs> get routes {
    return {
      '/example': (_, _) => const ExamplePage(),
    };
  }

  @override
  Future<void> injectionsRegister() async {}

  @override
  void Function() get registerListener => () {};
}
```

Keep route names explicit and stable. If the micro app needs setup later, use `injectionsRegister`; if it needs to react to app-level events, use `registerListener`.

## Localization

Each micro app owns its own localized strings. Keep ARB files inside the micro app:

```text
lib/src/l10n/arb/app_en.arb
lib/src/l10n/arb/app_pt.arb
```

Configure `l10n.yaml`:

```yaml
arb-dir: lib/src/l10n/arb
template-arb-file: app_en.arb
output-localization-file: micro_app_example_localizations.dart
output-class: MicroAppExampleLocalizations
output-dir: lib/src/l10n/generated
synthetic-package: false
nullable-getter: false
```

Create a context extension:

```dart
import 'package:flutter/widgets.dart';
import 'package:micro_app_example/src/l10n/generated/micro_app_example_localizations.dart';

export 'generated/micro_app_example_localizations.dart';

extension MicroAppExampleL10nX on BuildContext {
  MicroAppExampleLocalizations get l10n =>
      MicroAppExampleLocalizations.of(this);
}
```

Use it from widgets:

```dart
Text(context.l10n.exampleTitle)
```

## Shell Localization Setup

The shell app must aggregate the new micro app delegate:

```dart
localizationsDelegates: const [
  GlobalMaterialLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  MicroAppHomeLocalizations.delegate,
  MicroAppLoginLocalizations.delegate,
  MicroAppExampleLocalizations.delegate,
],
```

If the new micro app supports a new locale, update the shell `supportedLocales` too.

## Tests

Add focused tests for:

- constants, such as `microAppName`;
- route registration;
- the main page behavior;
- localized text rendering using the micro app localization delegates.

For widget tests that use l10n, wrap the page with `MaterialApp`:

```dart
await tester.pumpWidget(
  const MaterialApp(
    localizationsDelegates:
        MicroAppExampleLocalizations.localizationsDelegates,
    supportedLocales: MicroAppExampleLocalizations.supportedLocales,
    home: ExamplePage(),
  ),
);
```

## Validation

After creating the micro app, run:

```bash
melos run clean-and-bs
melos exec -c 1 --fail-fast -- flutter analyze --no-pub
melos run test:all
```

These commands confirm the package is part of the workspace, generates localization files correctly, passes analysis, and has working tests.
