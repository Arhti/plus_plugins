<p align="center">
  <a href="https://plus.fluttercommunity.dev/">
    Flutter Community Plus Plugins<br/>
  </a>
  <h1 align="center">Plus plugins</h1>
</p>

<p align="center">
  <a href="https://github.com/fluttercommunity/plus_plugins/actions?query=workflow%3Aall_plugins">
    <img src="https://github.com/fluttercommunity/plus_plugins/workflows/all_plugins/badge.svg" alt="all_plugins GitHub Workflow Status"/>
  </a>
  <a href="https://twitter.com/FlutterComm">
    <img src="https://img.shields.io/twitter/follow/FlutterComm.svg?colorA=1da1f2&colorB=&label=Follow%20on%20Twitter" alt="Follow on Twitter">
  </a>
</p>

---

PlusPlugins is a set of [Flutter plugins](https://flutter.io/platform-plugins/) that is developed based on existing [Flutter plugins](https://github.com/flutter/plugins) with extra functionalities, platforms support, and better maintenance.

[Flutter](https://flutter.dev) is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase. Flutter is used by developers and organizations around the world, and is free and open source.

> *Note*: PlusPlugins is still under development (see [roadmap](https://github.com/fluttercommunity/plus_plugins/issues/12)),

[Feedback](https://github.com/fluttercommunity/plus_plugins/issues) and [Pull Requests](https://github.com/fluttercommunity/plus_plugins/pulls) are most welcome!

## Plugins

**Table of contents:**

 - [Battery➕ (`battery_plus`)](#battery_plus)
 - [Connectivity➕ (`connectivity_plus`)](#connectivity_plus)
 - [NetworkInfo➕ (`network_info_plus`)](#network_info_plus)
 - [Device Info➕ (`device_info_plus`)](#device_info_plus)
 - [Package Info➕ (`package_info_plus`)](#package_info_plus)
 - [Sensor➕ (`sensors_plus`)](#sensors_plus)
 - [Share➕ (`share_plus`)](#share_plus)
 - [Android Alarm Manager➕ (`android_alarm_manager_plus`)](#android_alarm_manager_plus)
 - [Android Intent➕ (`android_intent_plus`)](#android_intent_plus)
---

### `battery_plus`

> ![battery_plus][battery_plus_badge_pub] [![pub points][battery_plus_badge_pub_points]][battery_plus_pub_points]

Flutter plugin for accessing information about the battery state(full, charging, discharging) on Android and iOS.

[[View Source][battery_plus_code]]

#### Platform Support

| Android | iOS | MacOS | Web | Linux | Window |
|:-------:|:---:|:-----:|:---:|:-----:|:------:|
|    ✔️    |  ✔️  |   ✔️   |  ✔️  |       |    ✔️   |

----

### `connectivity_plus`

> ![connectivity_plus][connectivity_plus_badge_pub] [![pub points][connectivity_plus_badge_pub_points]][connectivity_plus_pub_points]

Flutter plugin for discovering the state of the network (WiFi &
mobile/cellular) connectivity on Android and iOS.

[[View Source][connectivity_plus_code]]

#### Platform Support

| Android | iOS | MacOS | Web | Linux | Window |
|:-------:|:---:|:-----:|:---:|:-----:|:------:|
|    ✔️    |  ✔️  |   ✔️   |  ✔️  |   ✔️   |        |

----

### `network_info_plus`

> ![network_info_plus][network_info_plus_badge_pub] [![pub points][network_info_plus_badge_pub_points]][network_info_plus_pub_points]

TBA

[[View Source][network_info_plus_code]]

#### Platform Support

| Android | iOS | MacOS | Web | Linux | Window |
|:-------:|:---:|:-----:|:---:|:-----:|:------:|
|         |     |       |     |       |        |

----

### `device_info_plus`

> ![device_info_plus][device_info_plus_badge_pub] [![pub points][device_info_plus_badge_pub_points]][device_info_plus_pub_points]

Flutter plugin providing detailed information about the device
  (make, model, etc.), and Android or iOS version the app is running on.

[[View Source][device_info_plus_code]]

#### Platform Support

| Android | iOS | MacOS | Web | Linux | Window |
|:-------:|:---:|:-----:|:---:|:-----:|:------:|
|    ✔️    |  ✔️  |       |  ✔️  |   ✔️   |        |

----

### `package_info_plus`

> ![package_info_plus][package_info_plus_badge_pub] [![pub points][package_info_plus_badge_pub_points]][package_info_plus_pub_points]

Flutter plugin for querying information about the application
  package, such as CFBundleVersion on iOS or versionCode on Android.

[[View Source][package_info_plus_code]]

#### Platform Support

| Android | iOS | MacOS | Web | Linux | Window |
|:-------:|:---:|:-----:|:---:|:-----:|:------:|
|    ✔️    |  ✔️  |   ✔️   |  ✔️  |       |        |

----

### `sensors_plus`

> ![sensors_plus][sensors_plus_badge_pub] [![pub points][sensors_plus_badge_pub_points]][sensors_plus_pub_points]

Flutter plugin for accessing accelerometer and gyroscope sensors.

[[View Source][sensors_plus_code]]

#### Platform Support

| Android | iOS | MacOS | Web | Linux | Window |
|:-------:|:---:|:-----:|:---:|:-----:|:------:|
|    ✔️    |  ✔️  |       |  ✔️  |       |        |

----

### `share_plus`

> ![share_plus][share_plus_badge_pub] [![pub points][share_plus_badge_pub_points]][share_plus_pub_points]

Flutter plugin for sharing content via the platform share UI, using the ACTION_SEND intent on Android and UIActivityViewController on iOS.

[[View Source][share_plus_code]]

#### Platform Support

| Android | iOS | MacOS | Web | Linux | Window |
|:-------:|:---:|:-----:|:---:|:-----:|:------:|
|    ✔️    |  ✔️  |       |     |   ✔️   |    ✔️   |

----

### `android_alarm_manager_plus`

> ![android_alarm_manager_plus][android_alarm_manager_plus_badge_pub] [![pub points][android_alarm_manager_plus_badge_pub_points]][android_alarm_manager_plus_pub_points]

Flutter plugin for accessing the Android AlarmManager service, and running Dart code in the background when alarms fire.

[[View Source][android_alarm_manager_plus_code]]

#### Platform Support

| Android | 
|:-------:|
|    ✔️    | 

----

### `android_intent_plus`

> ![android_intent_plus][android_intent_plus_badge_pub] [![pub points][android_intent_plus_badge_pub_points]][android_intent_plus_pub_points]

Flutter plugin for launching Android Intents. Not supported on iOS.

[[View Source][android_intent_plus_code]]

#### Platform Support

| Android |
|:-------:|
|    ✔️    |

----

## Issues

Please file PlusPlugins specific issues, bugs, or feature requests in our [issue tracker](https://github.com/fluttercommunity/plus_plugins/issues/new).

Plugin issues that are not specific to PlusPlugins can be filed in the [Flutter issue tracker](https://github.com/flutter/flutter/issues/new).

## Contributing

If you wish to contribute a change to any of the existing plugins in this repo,
please review our [contribution guide](https://github.com/fluttercommunity/plus_plugins/blob/master/CONTRIBUTING.md)
and open a [pull request](https://github.com/fluttercommunity/plus_plugins/pulls).

## Status

![Status: Experimental](https://img.shields.io/badge/Status-Experimental-blue)

This repository is maintained by FlutterCommunity authors. Issues here are answered by maintainers and other community members on GitHub on a best-effort basis.

[battery_plus]: https://pub.dev/packages/battery_plus
[battery_plus_code]: https://github.com/fluttercommunity/plus_plugins/tree/main/packages/battery_plus
[battery_plus_pub_points]: https://pub.dev/packages/battery_plus/score
[battery_plus_badge_pub_points]: https://badges.bar/battery_plus/pub%20points
[battery_plus_badge_pub]: https://img.shields.io/pub/v/battery_plus.svg

[connectivity_plus]: https://pub.dev/packages/connectivity_plus
[connectivity_plus_code]: https://github.com/fluttercommunity/plus_plugins/tree/main/packages/connectivity_plus
[connectivity_plus_pub_points]: https://pub.dev/packages/connectivity_plus/score
[connectivity_plus_badge_pub_points]: https://badges.bar/connectivity_plus/pub%20points
[connectivity_plus_badge_pub]: https://img.shields.io/pub/v/connectivity_plus.svg

[network_plus]: https://pub.dev/packages/network_plus
[network_plus_code]: https://github.com/fluttercommunity/plus_plugins/tree/main/packages/network_plus
[network_plus_pub_points]: https://pub.dev/packages/network_plus/score
[network_plus_badge_pub_points]: https://badges.bar/network_plus/pub%20points
[network_plus_badge_pub]: https://img.shields.io/pub/v/network_plus.svg

[android_alarm_manager_plus]: https://pub.dev/packages/android_alarm_manager_plus
[android_alarm_manager_plus_code]: https://github.com/fluttercommunity/plus_plugins/tree/main/packages/android_alarm_manager_plus
[android_alarm_manager_plus_pub_points]: https://pub.dev/packages/android_alarm_manager_plus/score
[android_alarm_manager_plus_badge_pub_points]: https://badges.bar/android_alarm_manager_plus/pub%20points
[android_alarm_manager_plus_badge_pub]: https://img.shields.io/pub/v/android_alarm_manager_plus.svg

[android_intent_plus]: https://pub.dev/packages/android_intent_plus
[android_intent_plus_code]: https://github.com/fluttercommunity/plus_plugins/tree/main/packages/android_intent_plus
[android_intent_plus_pub_points]: https://pub.dev/packages/android_intent_plus/score
[android_intent_plus_badge_pub_points]: https://badges.bar/android_intent_plus/pub%20points
[android_intent_plus_badge_pub]: https://img.shields.io/pub/v/android_intent_plus.svg

[device_info_plus]: https://pub.dev/packages/device_info_plus
[device_info_plus_code]: https://github.com/fluttercommunity/plus_plugins/tree/main/packages/device_info_plus
[device_info_plus_pub_points]: https://pub.dev/packages/device_info_plus/score
[device_info_plus_badge_pub_points]: https://badges.bar/device_info_plus/pub%20points
[device_info_plus_badge_pub]: https://img.shields.io/pub/v/device_info_plus.svg

[package_info_plus]: https://pub.dev/packages/package_info_plus
[package_info_plus_code]: https://github.com/fluttercommunity/plus_plugins/tree/main/packages/package_info_plus
[package_info_plus_pub_points]: https://pub.dev/packages/package_info_plus/score
[package_info_plus_badge_pub_points]: https://badges.bar/package_info_plus/pub%20points
[package_info_plus_badge_pub]: https://img.shields.io/pub/v/package_info_plus.svg

[sensors_plus]: https://pub.dev/packages/sensors_plus
[sensors_plus_code]: https://github.com/fluttercommunity/plus_plugins/tree/main/packages/sensors_plus
[sensors_plus_pub_points]: https://pub.dev/packages/sensors_plus/score
[sensors_plus_badge_pub_points]: https://badges.bar/sensors_plus/pub%20points
[sensors_plus_badge_pub]: https://img.shields.io/pub/v/sensors_plus.svg

[share_plus]: https://pub.dev/packages/share_plus
[share_plus_code]: https://github.com/fluttercommunity/plus_plugins/tree/main/packages/share_plus
[share_plus_pub_points]: https://pub.dev/packages/share_plus/score
[share_plus_badge_pub_points]: https://badges.bar/share_plus/pub%20points
[share_plus_badge_pub]: https://img.shields.io/pub/v/share_plus.svg
