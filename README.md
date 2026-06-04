# Micro Frontends Example

![Coverage](https://img.shields.io/badge/coverage-77.51%25-yellowgreen)

An example Flutter monorepo used to explore micro frontend architecture, package boundaries, Melos workflows, localizations, and shared infrastructure.

This project is intentionally small, but the structure is meant to model decisions that matter in larger Flutter codebases: each micro app owns its feature code, reusable contracts live in dedicated packages, and dependencies are declared where they are actually used.

## Project Structure

```text
base_app/
micro_apps/
  micro_app_home/
  micro_app_login/
packages/
  event_bus/
  foundations/
  navigation/
docs/
```

## Documentation

- [Architecture](docs/architecture.md)
- [Creating a Micro App](docs/creating_a_micro_app.md)
- [Foundations package](packages/foundations/README.md)
- [Event Bus package](packages/event_bus/README.md)
- [Navigation package](packages/navigation/README.md)

## Requirements

| Tool                     | Version |
| ------------------------ | ------- |
| Git                      | latest  |
| Flutter (channel stable) | 3.44.0  |
| Dart                     | 3.12.0  |
| Melos                    | 7.8.1   |

ADB is optional, but useful when running the Android app on a physical device.

## Getting Started

Clone the repository:

```bash
git clone https://github.com/dhianapereira/micro-frontends-example.git
cd micro-frontends-example
```

Install workspace dependencies:

```bash
melos run clean-and-bs
```

Run the app from the shell package:

```bash
cd base_app
flutter run
```

## Common Commands

Clean and bootstrap the workspace:

```bash
melos run clean-and-bs
```

Run all tests:

```bash
melos run test:all
```

Run static analysis:

```bash
melos exec -c 1 --fail-fast -- flutter analyze --no-pub
```

Connect an Android device over Wi-Fi:

```bash
melos run android-wifi
```

## CI

Pull requests run an optimized pipeline:

- non-runtime changes, such as docs and non-Dart scripts, skip Flutter analysis and tests;
- Melos detects affected packages with `--diff`;
- shared package changes include dependent packages with `--include-dependents`;
- static analysis runs only for affected packages;
- tests run only for affected packages that have a `test` directory.

Commits on `main` run the full test suite, generate coverage from all package
`lcov.info` files, and update the coverage badge above.

## License

This project is licensed under the terms described in [LICENSE](LICENSE).
