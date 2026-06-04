import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'audio_manager.dart';

enum AudioAttributes$ContentType {
  /// Content type value to use when the content type is unknown, or other than the ones defined.
  unknown,

  /// Content type value to use when the content type is speech.
  speech,

  /// Content type value to use when the content type is music.
  music,

  /// Content type value to use when the content type is the audio typically accompanying a movie or TV program, containing a mix of dialogue, music and sound effects.
  movie,

  /// Content type value to use when the content type is a sound used to accompany a user action, such as a beep or sound effect expressing a key click, or event, such as the type of a sound for a bonus being received in a game. These sounds are mostly synthesized or short Foley sounds.
  sonification,
}

enum AudioAttributes$Flag {
  /// Flag defining a behavior where the audibility of the sound will be ensured by the system. To ensure sound audibility, the system only uses built-in speakers or wired headphones and specifically excludes wireless audio devices.
  ///
  /// Note this flag should only be used for sounds subject to regulatory behaviors in some countries, such as for camera shutter sound, and not for routing behaviors.
  audibilityEnforced,

  /// Flag requesting the use of an output stream supporting hardware A/V synchronization.
  hwAvSync,
  // lowLatency,
}

enum AudioAttributes$Usage {
  /// Usage value to use when the usage is unknown.
  unknown,

  /// Usage value to use when the usage is media, such as music, or movie soundtracks.
  media,

  /// Usage value to use when the usage is voice communications, such as telephony or VoIP.
  voiceCommunication,

  /// Usage value to use when the usage is in-call signalling, such as with a "busy" beep, or DTMF tones.
  voiceCommunicationSignalling,

  /// Usage value to use when the usage is an alarm (e.g. wake-up alarm).
  alarm,

  /// Usage value to use when the usage is notification. See other notification usages for more specialized uses.
  notification,

  /// Usage value to use when the usage is telephony ringtone.
  notificationRingtone,

  /// Usage value to use when the usage is a request to enter/end a communication, such as a VoIP communication or video-conference.
  @Deprecated(
    'Deprecated in API level 33, Use USAGE_NOTIFICATION which is handled the same way as this usage by the audio framework',
  )
  notificationCommunicationRequest,

  /// Usage value to use when the usage is notification for an "instant" communication such as a chat, or SMS.
  @Deprecated(
    'Deprecated in API level 33, Use USAGE_NOTIFICATION which is handled the same way as this usage by the audio framework',
  )
  notificationCommunicationInstant,

  /// Usage value to use when the usage is notification for a non-immediate type of communication such as e-mail.
  @Deprecated(
    'Deprecated in API level 33, Use USAGE_NOTIFICATION which is handled the same way as this usage by the audio framework',
  )
  notificationCommunicationDelayed,

  /// Usage value to use when the usage is to attract the user's attention, such as a reminder or low battery warning.
  notificationEvent,

  /// Usage value to use when the usage is for accessibility, such as with a screen reader.
  assistanceAccessibility,

  /// Usage value to use when the usage is driving or navigation directions.
  assistanceNavigationGuidance,

  /// Usage value to use when the usage is sonification, such as with user interface sounds.
  assistanceSonification,

  /// Usage value to use when the usage is for game audio.
  game,

  /// Usage value to use for audio responses to user queries, audio instructions or help utterances.
  assistant,
}

/// A class to encapsulate a collection of attributes describing information about an audio stream.
abstract interface class AudioAttributes {
  // bool get areHapticChannelsMuted;
  // bool get allowedCapturePolicy;

  /// Return the content type.
  AudioAttributes$ContentType get contentType;

  /// Return the flags.
  Set<AudioAttributes$Flag> get flags;

  // int get spatializationBehavior;

  /// Return the usage.
  AudioAttributes$Usage get usage;

  // int get volumeControlStream;
  // bool get isContentSpatialized;
}

/// Builder class for AudioAttributes objects.
abstract interface class AudioAttributes$Builder {
  /// Constructs a new Builder with the defaults. By default, usage and content type are respectively AudioAttributes.USAGE_UNKNOWN and AudioAttributes.CONTENT_TYPE_UNKNOWN, and flags are 0. It is recommended to configure the usage (with setUsage(int)) or deriving attributes from a legacy stream type (with setLegacyStreamType(int)) before calling build() to override any default playback behavior in terms of routing and volume management.
  factory AudioAttributes$Builder() =>
      AudioAttributesChannel.instance.createBuilder();

  /// Constructs a new Builder from a given AudioAttributes
  factory AudioAttributes$Builder.audioAttributes(AudioAttributes aa) =>
      AudioAttributesChannel.instance.createBuilderWithAudioAttributes(aa);

  // AudioAttributes$Builder setAllowedCapturePolicy(int capturePolicy);

  /// Sets the attribute describing the content type of the audio signal, such as speech, or music.
  AudioAttributes$Builder setContentType(
    AudioAttributes$ContentType contentType,
  );

  /// Sets the combination of flags. This is a bitwise OR with the existing flags.
  AudioAttributes$Builder setFlags(Set<AudioAttributes$Flag> flags);

  // AudioAttributes$Builder setHapticChannelsMuted(bool muted);
  // AudioAttributes$Builder setIsContentSpatialized(bool isContentSpatialized);

  /// Sets attributes as inferred from the legacy stream types. Warning: do not use this method in combination with setting any other attributes such as usage, content type, flags or haptic control, as this method will overwrite (the more accurate) information describing the use case previously set in the Builder. In general, avoid using it and prefer setting usage and content type directly with setUsage(int) and setContentType(int).
  ///
  /// Use this method when building an AudioAttributes instance to initialize some of the attributes by information derived from a legacy stream type.
  AudioAttributes$Builder setLegacyStreamType(AudioManager$Stream streamType);

  // AudioAttributes$Builder setSpatializationBehavior(int sb);

  /// Sets the attribute describing what is the intended use of the audio signal, such as alarm or ringtone.
  AudioAttributes$Builder setUsage(AudioAttributes$Usage usage);

  /// Combines all of the attributes that have been set and return a new AudioAttributes object.
  AudioAttributes build();
}

abstract base class AudioAttributesChannel extends PlatformInterface {
  /// Constructs a [AudioAttributesChannel].
  AudioAttributesChannel() : super(token: _token);

  static final Object _token = Object();

  static AudioAttributesChannel? _instance;

  /// The default instance of [AudioAttributesChannel] to use.
  static AudioAttributesChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AudioAttributesChannel] when
  /// they register themselves.
  static set instance(AudioAttributesChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  AudioAttributes$Builder createBuilder();
  AudioAttributes$Builder createBuilderWithAudioAttributes(AudioAttributes aa);
}
