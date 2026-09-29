enum SyncParams$AudioAdjustMode {
  /// System will determine best handling of audio for playback rate adjustments.
  ///
  /// Used by default. This will make audio play faster or slower as required by the sync source without changing its pitch; however, system may fall back to some other method (e.g. change the pitch, or mute the audio) if time stretching is no longer supported for the playback rate.
  default$,

  /// Time stretch audio when playback rate must be adjusted.
  ///
  /// This will make audio play faster or slower as required by the sync source without changing its pitch, as long as it is supported for the playback rate.
  stretch,

  /// Resample audio when playback rate must be adjusted.
  ///
  /// This will make audio play faster or slower as required by the sync source by changing its pitch (making it lower to play slower, and higher to play faster.)
  resample,
}

enum SyncParams$SyncSource {
  /// Use the default sync source (default). If media has video, the sync renders to a surface that directly renders to a display, and tolerance is non zero (e.g. not less than 0.001) vsync source is used for clock source. Otherwise, if media has audio, audio track is used. Finally, if media has no audio, system clock is used.
  default$,

  /// Use system monotonic clock for sync source.
  systemClock,

  /// Use audio track for sync source. This requires audio data and an audio track.
  audio,
}

/// Structure for common A/V sync params. Used by MediaSync {link MediaSync#getSyncParams()} and {link MediaSync#setSyncParams(SyncParams)} to control A/V sync behavior.
abstract interface class SyncParams {
  /// Retrieves the audio adjust mode.
  SyncParams$AudioAdjustMode get audioAdjustMode;

  /// Sets the audio adjust mode.
  set audioAdjustMode(SyncParams$AudioAdjustMode value);

  /// Retrieves the video frame rate hint.
  double get frameRate;

  /// Sets the video frame rate hint to be used. By default the frame rate is unspecified.
  set frameRate(double value);

  /// Retrieves the sync source.
  SyncParams$SyncSource get syncSource;

  /// Sets the sync source.
  set syncSource(SyncParams$SyncSource value);

  /// Retrieves the tolerance factor.
  double get tolerance;

  /// Sets the tolerance. The default tolerance is platform specific, but is never more than 1/24.
  set tolerance(double value);

  /// Allows defaults to be returned for properties not set. Otherwise a IllegalArgumentException exception is raised when getting those properties which have defaults but have never been set.
  SyncParams allowDefaults();
}
