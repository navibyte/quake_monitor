# Mobile - blocs, widgets and pages for the Quake Monitor app

The project contains [Flutter](https://flutter.dev/) specific BLoCs (state 
management), widgets, pages and UI related utilities for the Quake Monitor 
app monitoring earthquakes.

This is a [Flutter](https://flutter.dev/) code project named `mobile` under the 
[quake_monitor](https://github.com/navibyte/quake_monitor) repository. The
repository contains also other Dart and Flutter projects.

## Dependencies

Other projects on this repository:
* [../api](../api) for gRPC stub and API client helpers to access gRPC service for earthquakes
* [../core](../core) for domain models, data providers, repositories, i18 and other shared utilities

External [Dart](https://dart.dev/) or [Flutter](https://flutter.dev/) packages:
* [flutter_bloc](https://pub.dev/packages/flutter_bloc) 
* [circular_bottom_navigation](https://pub.dev/packages/circular_bottom_navigation) 
* [fixnum](https://pub.dev/packages/fixnum)
* [intl](https://pub.dev/packages/intl)  

Please see `pubscec.yaml` for more details and versions used.

## Code

Flutter specific Dart code locates in `mobile/lib` with sub folders:
* `blocs` - state management as BLoC pattern both for earthquakes and settings 
* `pages` - page widgets used on the app
* `utils` - some utility functions
* `widgets` - widgets for UI components like earthquake information card or a simple world map

Also following code files directly under `mobile/lib` are important:
* `main.dart` - normal main() function that launches this Flutter app   
* `conf.dart` - in order to data providers for external data source to function correctly URL addresses or credentials must be filled here  

**Important** : as noted above please check `conf.dart` and fill empty 
configurations on your clone.

## Authors

This project is authored by **[Navibyte](https://navibyte.com)**.

## License

This project is licensed under the MIT License - see the [LICENSE](../LICENSE).

The project contains also code snippets or adapted code originating from the
[flutter_weather](https://github.com/felangel/bloc/tree/master/examples/flutter_weather) sample app by [Felix Angelov](https://twitter.com/felangelov). 
See [LICENSE](../LICENSE_BLOC)
