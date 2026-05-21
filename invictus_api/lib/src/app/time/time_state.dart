import 'unix_epoch_time.dart';

abstract interface class TimeState {
  UnixEpochTime get unixEpochTime;
  bool get userShouldConfirmTime;
}
