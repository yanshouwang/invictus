import 'package:plugin_platform_interface/plugin_platform_interface.dart';

enum AudioManager$Adjust {
  /// Mute the volume. Has no effect if the stream is already muted.
  mute,

  /// Decrease the ringer volume.
  lower,

  /// Maintain the previous ringer volume. This may be useful when needing to show the volume toast without actually modifying the volume.
  same,

  /// Increase the ringer volume.
  raise,

  /// Unmute the volume. Has no effect if the stream is not muted.
  unmute,

  /// Toggle the mute state. If muted the stream will be unmuted. If not muted the stream will be muted.
  toggleMute,
}

enum AudioManager$Audiofocus {
  /// Used to indicate a transient loss of audio focus where the loser of the audio focus can lower its output volume if it wants to continue playing (also referred to as "ducking"), as the new focus owner doesn't require others to be silent.
  lossTransientCanDuck,

  /// Used to indicate a transient loss of audio focus.
  lossTransient,

  /// Used to indicate a loss of audio focus of unknown duration.
  loss,

  /// Used to indicate no audio focus has been gained or lost, or requested.
  ///
  /// Added in API level 26
  none,

  /// Used to indicate a gain of audio focus, or a request of audio focus, of unknown duration.
  gain,

  /// Used to indicate a temporary gain or request of audio focus, anticipated to last a short amount of time. Examples of temporary changes are the playback of driving directions, or an event notification.
  gainTransient,

  /// Used to indicate a temporary request of audio focus, anticipated to last a short amount of time, and where it is acceptable for other audio applications to keep playing after having lowered their output level (also referred to as "ducking"). Examples of temporary changes are the playback of driving directions where playback of music in the background is acceptable.
  gainTransientMayDuck,

  /// Used to indicate a temporary request of audio focus, anticipated to last a short amount of time, during which no other applications, or system components, should play anything. Examples of exclusive and transient audio focus requests are voice memo recording and speech recognition, during which the system shouldn't play any notifications, and media playback should have paused.
  gainTransientExclusive,
}

enum AudioManager$Flag {
  /// Show a toast containing the current volume.
  showUi,

  /// Whether to include ringer modes as possible options when changing volume. For example, if true and volume level is 0 and the volume is adjusted with ADJUST_LOWER, then the ringer mode may switch the silent or vibrate mode.
  ///
  /// By default this is on for the ring stream. If this flag is included, this behavior will be present regardless of the stream type being affected by the ringer mode.
  allowRingerModes,

  /// Whether to play a sound when changing the volume.
  ///
  /// If this is given to adjustVolume(int,int) or adjustSuggestedStreamVolume(int,int,int), it may be ignored in some cases (for example, the decided stream type is not AudioManager.STREAM_RING, or the volume is being adjusted downward).
  playSound,

  /// Removes any sounds/vibrate that may be in the queue, or are playing (related to changing volume).
  removeSoundAndVibrate,

  /// Whether to vibrate if going into the vibrate ringer mode.
  vibrate,
}

enum AudioManager$Fx {
  /// Keyboard and direction pad click sound
  keyClick,

  /// Focus has moved up
  focusNavigationUp,

  /// Focus has moved down
  focusNavigationDown,

  /// Focus has moved left
  focusNavigationLeft,

  /// Focus has moved right
  focusNavigationRight,

  /// IME standard keypress sound
  keypressStandard,

  /// IME spacebar keypress sound
  keypressSpacebar,

  /// IME delete keypress sound
  keypressDelete,

  /// IME return_keypress sound
  keypressReturn,

  /// Invalid keypress sound
  keypressInvalid,

  // back,
}

enum AduioManager$GetDevices {
  /// Specifies to the AudioManager.getDevices(int) method to include source (i.e. input) audio devices.
  inputs,

  /// Specifies to the AudioManager.getDevices(int) method to include sink (i.e. output) audio devices.
  outputs,

  /// Specifies to the AudioManager.getDevices(int) method to include both source and sink devices.
  all,
}

enum AudioManager$Mode {
  // assistantConversation,
  // callRedirect,
  // callScreening,
  // communicationRedirect,

  /// Invalid audio mode.
  invalid,

  /// Current audio mode. Used to apply audio routing to current mode.
  current,

  /// Normal audio mode: not ringing and no call established.
  normal,

  /// Ringing audio mode. An incoming is being signaled.
  ringtone,

  /// In call audio mode. A telephony call is established.
  inCall,

  /// In communication audio mode. An audio/video chat or VoIP call is established.
  inCommunication,
}

enum AudioManager$RingerMode {
  /// Ringer mode that will be silent and will vibrate. (This will cause the phone ringer to always vibrate, but the notification vibrate to only vibrate if set.)
  vibrate,

  /// Ringer mode that will be silent and will not vibrate. (This overrides the vibrate setting.)
  silent,

  /// Ringer mode that may be audible and may vibrate. It will be audible if the volume before changing out of this mode was audible. It will vibrate if the vibrate setting is on.
  normal,
}

enum AudioManager$ScoAudioState {
  /// Value for extra EXTRA_SCO_AUDIO_STATE indicating that there was an error trying to obtain the state
  ///
  /// Value: -1
  error,

  /// Value for extra EXTRA_SCO_AUDIO_STATE or EXTRA_SCO_AUDIO_PREVIOUS_STATE indicating that the SCO audio channel is not established
  ///
  /// Value: 0
  disconnected,

  /// Value for extra EXTRA_SCO_AUDIO_STATE or EXTRA_SCO_AUDIO_PREVIOUS_STATE indicating that the SCO audio channel is established
  ///
  /// Value: 1
  connected,

  /// Value for extra EXTRA_SCO_AUDIO_STATE or EXTRA_SCO_AUDIO_PREVIOUS_STATE indicating that the SCO audio channel is being established
  ///
  /// Value: 2
  connecting,
}

enum AudioManager$Stream {
  /// Used to identify the volume of audio streams for phone calls
  ///
  /// Value: 0
  voiceCall,

  /// Used to identify the volume of audio streams for system sounds
  ///
  /// Value: 1
  system,

  /// Used to identify the volume of audio streams for the phone ring
  ///
  /// Value: 2
  ring,

  /// Used to identify the volume of audio streams for music playback
  ///
  /// Value: 3
  music,

  /// Used to identify the volume of audio streams for alarms
  ///
  /// Value: 4
  alarm,

  /// Used to identify the volume of audio streams for notifications
  ///
  /// Value: 5
  notification,

  /// Used to identify the volume of audio streams for DTMF Tones
  ///
  /// Value: 8
  dtmf,

  /// Used to identify the volume of audio streams for accessibility prompts
  ///
  /// Added in API level 26
  ///
  /// Value: 10
  accessibility,

  /// Used to identify the volume of audio streams for virtual assistant
  ///
  /// Added in API level 37
  ///
  /// Value: 11
  assistant,
}

@Deprecated(
  'Deprecated in API level 15, Do not set audio routing directly, use setSpeakerphoneOn(), setBluetoothScoOn() methods instead.',
)
enum AudioManager$Route {
  /// Used for mask parameter of setRouting(int,int,int).
  ///
  /// Value: -1
  all,

  /// Routing audio output to earpiece
  ///
  /// Value: 1
  earpiece,

  /// Routing audio output to speaker
  ///
  /// Value: 2
  speaker,

  /// Value: 4
  bluetooth,

  /// Routing audio output to bluetooth SCO
  ///
  /// Value: 4
  bluetoothSco,

  /// Routing audio output to headset
  ///
  /// Value: 8
  headset,

  /// Routing audio output to bluetooth A2DP
  ///
  /// Value: 16
  bluetoothA2dp,
}

/// AudioManager provides access to volume and ringer mode control.
abstract interface class AudioManager {}

abstract base class AudioManagerChannel extends PlatformInterface {
  /// Constructs a [AudioManagerChannel].
  AudioManagerChannel() : super(token: _token);

  static final Object _token = Object();

  static AudioManagerChannel? _instance;

  /// The default instance of [AudioManagerChannel] to use.
  static AudioManagerChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AudioManagerChannel] when
  /// they register themselves.
  static set instance(AudioManagerChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
}
