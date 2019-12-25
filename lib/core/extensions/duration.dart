extension DurationBuilder on int {
  Duration toDays() {
    return Duration(days: this);
  }

  Duration toHours() {
    return Duration(hours: this);
  }

  Duration toMinutes() {
    return Duration(minutes: this);
  }

  Duration toSeconds() {
    return Duration(seconds: this);
  }

  Duration toMilliseconds() {
    return Duration(milliseconds: this);
  }

  Duration toMicroseconds() {
    return Duration(microseconds: this);
  }
}