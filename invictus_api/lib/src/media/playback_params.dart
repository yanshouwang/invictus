enum PlaybackParams$AudioFallbackMode { default$, mute, fail }

/// Structure for common playback params. Used by AudioTrack AudioTrack.getPlaybackParams() and AudioTrack.setPlaybackParams(PlaybackParams) to control playback behavior.
abstract interface class PlaybackParams {
  /// Retrieves the audio fallback mode.
  PlaybackParams$AudioFallbackMode get audioFallbackMode;

  /// Sets the audio fallback mode.
  set audioFallbackMode(PlaybackParams$AudioFallbackMode value);

  /// Retrieves the pitch factor.
  double get pitch;

  /// Sets the pitch factor.
  set pitch(double value);

  /// Retrieves the speed factor.
  double get speed;

  /// Sets the speed factor.
  set speed(double value);

  /// Allows defaults to be returned for properties not set. Otherwise a IllegalArgumentException exception is raised when getting those properties which have defaults but have never been set.
  PlaybackParams allowDefaults();
}
