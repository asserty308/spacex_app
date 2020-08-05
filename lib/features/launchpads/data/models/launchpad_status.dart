part of 'launchpad.dart';

enum LaunchpadStatus {
  active, inactive, unknown, retired, lost, underConstruction
}

class LaunchpadStatusUtil {
  static LaunchpadStatus fromString(String value) {
    final Map<String, LaunchpadStatus> dict = {
      'active': LaunchpadStatus.active,
      'inactive': LaunchpadStatus.inactive,
      'unknown': LaunchpadStatus.unknown,
      'retired': LaunchpadStatus.retired,
      'lost': LaunchpadStatus.lost,
      'under construction': LaunchpadStatus.underConstruction,
    };

    return dict[value];
  }
}