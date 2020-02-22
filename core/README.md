# Core - models and data access layers for the Quake Monitor

The project contains platform independent domain models, data providers (API
clients), repositories, i18 and other shared utilities for the Quake Monitor 
app monitoring earthquakes.

This is a [Dart](https://dart.dev/) code project named `core` under the 
[quake_monitor](https://github.com/navibyte/quake_monitor) repository. The
repository contains also other Dart and Flutter projects.

## Dependencies

Other projects on this repository:
* [../api](../api) for gRPC stub and API client helpers to access gRPC service for earthquakes

External [Dart](https://dart.dev/) packages:
* [equatable](https://pub.dev/packages/equatable) 
* [fixnum](https://pub.dev/packages/fixnum)
* [intl](https://pub.dev/packages/intl)  

Please see `pubscec.yaml` for more details and versions used.

## Code

Dart code locates in `core/lib/src` with sub folders:
* `i18n` - some datetime formatters
* `models` - the domain model for earthquakes and basic geographic structures
* `providers` - data providers for accessing earthquakes and places searches
* `repositories` - the `EarthquakeRepository` is meant to be used by UI layers (or BLoCs) to query data defined by the domain model and it wraps data providers above to implement data access
* `utils` - some utility classes

For data *providers* there are multiple implementations with following 
inheritance hierarchy:
* `EarthquakeProvider` - absctract base class for earthquake data providers
  * `EarthquakeProviderGeoJSON` - accesses earthquakes from the GeoJSON service of USGS.
  * `EarthquakeProviderGRPC` - accesses earthquakes from the QuakeService (gRPC) using gRPC stubs and API client helpers implemented on the [api](../api) project
* `LocationProvider` - absctract base class for location providers
  * `LocationProviderGeoNames` - accesses place searches from the [GeoNames.org](https://www.geonames.org/) (please note a registered username is needed to use that service)
  * `LocationProviderMetaWeather` accesses place searches from the [Meta Weather](https://www.metaweather.com/)

When `EarthquakeRepository` is intialized on the actual app it is configured
with references to an `EarthquakeProvider` implementation and a 
`LocationProvider` implementation.

## Authors

This project is authored by **[Navibyte](https://navibyte.com)**.

## License

This project is licensed under the MIT License - see the [LICENSE](../LICENSE).

The project contains also code snippets or adapted code originating from the
[flutter_weather](https://github.com/felangel/bloc/tree/master/examples/flutter_weather) sample app by [Felix Angelov](https://twitter.com/felangelov). 
See [LICENSE](../LICENSE_BLOC)


