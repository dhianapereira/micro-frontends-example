# Micro Frontends Example

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

## License

This project is licensed under the terms described in [LICENSE](LICENSE).
