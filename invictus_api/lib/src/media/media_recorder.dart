import 'package:invictus_api/src/io.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// Defines the audio encoding. These constants are used with MediaRecorder.setAudioEncoder(int).
enum MediaRecorder$AudioEncoder {
  ///
  default$,

  /// AMR (Narrowband) audio codec
  amrNb,

  /// AMR (Wideband) audio codec
  amrWb,

  /// AAC Low Complexity (AAC-LC) audio codec
  aac,

  /// High Efficiency AAC (HE-AAC) audio codec
  heAac,

  /// Enhanced Low Delay AAC (AAC-ELD) audio codec
  aacEld,

  /// Ogg Vorbis audio codec (Support is optional)
  vorbis,

  /// Opus audio codec
  // opus,
}

/// Defines the audio source. An audio source defines both a default physical source of audio signal, and a recording configuration. These constants are for instance used in MediaRecorder.setAudioSource(int) or AudioRecord.Builder.setAudioSource(int).
enum MediaRecorder$AudioSource {
  /// Default audio source *
  default$,

  /// Microphone audio source
  mic,

  /// Voice call uplink (Tx) audio source.
  ///
  /// Capturing from VOICE_UPLINK source requires the android.Manifest.permission#CAPTURE_AUDIO_OUTPUT permission. This permission is reserved for use by system components and is not available to third-party applications.
  voiceUplink,

  /// Voice call downlink (Rx) audio source.
  ///
  /// Capturing from VOICE_DOWNLINK source requires the android.Manifest.permission#CAPTURE_AUDIO_OUTPUT permission. This permission is reserved for use by system components and is not available to third-party applications.
  voiceDownlink,

  /// Voice call uplink + downlink audio source
  ///
  /// Capturing from VOICE_CALL source requires the android.Manifest.permission#CAPTURE_AUDIO_OUTPUT permission. This permission is reserved for use by system components and is not available to third-party applications.
  voiceCall,

  /// Microphone audio source tuned for video recording, with the same orientation as the camera if available.
  camcorder,

  /// Microphone audio source tuned for voice recognition.
  voiceRecognition,

  /// Microphone audio source tuned for voice communications such as VoIP. It will for instance take advantage of echo cancellation or automatic gain control if available.
  voiceCommunication,

  /// Audio source for a submix of audio streams to be presented remotely.
  ///
  /// An application can use this audio source to capture a mix of audio streams that should be transmitted to a remote receiver such as a Wifi display. While recording is active, these audio streams are redirected to the remote submix instead of being played on the device speaker or headset.
  ///
  /// Certain streams are excluded from the remote submix, including AudioManager.STREAM_RING, AudioManager.STREAM_ALARM, and AudioManager.STREAM_NOTIFICATION. These streams will continue to be presented locally as usual.
  ///
  /// Capturing the remote submix audio requires the android.Manifest.permission#CAPTURE_AUDIO_OUTPUT permission. This permission is reserved for use by system components and is not available to third-party applications.
  remoteSubmix,

  /// Microphone audio source tuned for unprocessed (raw) sound if available, behaves like DEFAULT otherwise.
  unprocessed,

  /// Source for capturing audio meant to be processed in real time and played back for live performance (e.g karaoke).
  ///
  /// The capture path will minimize latency and coupling with playback path.
  // voicePerformance,
}

/// Defines the output format. These constants are used with MediaRecorder.setOutputFormat(int).
enum MediaRecorder$OutputFormat {
  ///
  default$,

  /// 3GPP media file format
  threeGpp,

  /// MPEG4 media file format
  mpeg4,

  /// AMR NB file format
  amrNb,

  /// AMR WB file format
  amrWb,

  /// AAC ADTS file format
  aacAdts,

  /// H.264/AAC data encapsulated in MPEG2/TS
  // mpeg2Ts,

  /// VP8/VORBIS data in a WEBM container
  webm,

  /// Opus data in a Ogg container
  // ogg,
}

/// Defines the video encoding. These constants are used with MediaRecorder.setVideoEncoder(int).
enum MediaRecorder$VideoEncoder {
  /// Default video codec
  default$,

  /// H.263 video codec
  h263,

  /// H.264 video codec
  h264,

  /// MPEG-4 SP video codec
  mpeg4Sp,

  /// VP8 video codec
  vp8,

  /// HEVC/H.265 video codec
  hevc,

  /// VP9 video codec
  vp9,

  /// Default video codec
  // dolbyVision,

  /// AV1 video codec
  // av1,

  /// APV video codec
  // apv,
}

/// TODO
enum MediaRecorder$Error {
  /// Unspecified media recorder error.
  unknown,

  /// Media server died. In this case, the application must release the MediaRecorder object and instantiate a new one.
  serverDied,
}

/// TODO
enum MediaRecorder$Info {
  /// Unspecified media recorder info.
  unknown,

  /// A maximum duration had been setup and has now been reached.
  maxDurationReached,

  /// A maximum filesize had been setup and has now been reached. Note: This event will not be sent if application already set next output file through #setNextOutputFile.
  maxFilesizeReached,

  /// A maximum filesize had been setup and current recorded file size has reached 90% of the limit. This is sent once per file upon reaching/passing the 90% limit. To continue the recording, applicaiton should use #setNextOutputFile to set the next output file. Otherwise, recording will stop when reaching maximum file size.
  // maxFilesizeApproaching,

  /// A maximum filesize had been reached and MediaRecorder has switched output to a new file set by application #setNextOutputFile. For best practice, application should use this event to keep track of whether the file previously set has been used or not.
  // nextOutputFileStarted,
}

/// Used to record audio and video.
///
/// A common case of using MediaRecorder to record audio works as follows:
///
/// ```
/// MediaRecorder recorder = new MediaRecorder(context);
/// recorder.setAudioSource(MediaRecorder.AudioSource.MIC);
/// recorder.setOutputFormat(MediaRecorder.OutputFormat.THREE_GPP);
/// recorder.setAudioEncoder(MediaRecorder.AudioEncoder.AMR_NB);
/// recorder.setOutputFile(PATH_NAME);
/// recorder.prepare();
/// recorder.start();   // Recording is now started
/// ...
/// recorder.stop();
/// recorder.reset();   // You can reuse the object by going back to setAudioSource() step
/// recorder.release(); // Now the object cannot be reused
/// ```
abstract interface class MediaRecorder {
  /// Gets the maximum value for audio sources.
  static int get audioSourceMax => MediaRecorderChannel.instance.audioSourceMax;

  factory MediaRecorder() => MediaRecorderChannel.instance.create();

  // List<MicrophoneInfo> get activeMicrophones;
  // AudioRecordingConfiguration? get audioRecordingConfiguration;
  // LogSessionId get logSessionId;
  // set logSessionId(LogSessionId value);

  /// Returns the maximum absolute amplitude that was sampled since the last call to this method. Call this only after the setAudioSource().
  int get maxAmplitude;
  // PersistableBundle get metrics;
  // Surface get surface;
  // bool get isPrivacySensitive;
  // set isPrivacySensitive(bool value);

  /// Sets the number of audio channels for recording. Call this method before prepare(). Prepare() may perform additional checks on the parameter to make sure whether the specified number of audio channels are applicable.
  set audioChannels(int value);

  /// Sets the audio encoder to be used for recording. If this method is not called, the output file will not contain an audio track. Call this after setOutputFormat() but before prepare().
  set audioEncoder(MediaRecorder$AudioEncoder value);

  /// Sets the audio encoding bit rate for recording. Call this method before prepare(). Prepare() may perform additional checks on the parameter to make sure whether the specified bit rate is applicable, and sometimes the passed bitRate will be clipped internally to ensure the audio recording can proceed smoothly based on the capabilities of the platform.
  set audioEncodingBitRate(int value);
  // set audioProfile(EncoderProfiles$AudioProfile value);

  /// Sets the audio sampling rate for recording. Call this method before prepare(). Prepare() may perform additional checks on the parameter to make sure whether the specified audio sampling rate is applicable. The sampling rate really depends on the format for the audio recording, as well as the capabilities of the platform. For instance, the sampling rate supported by AAC audio coding standard ranges from 8 to 96 kHz, the sampling rate supported by AMRNB is 8kHz, and the sampling rate supported by AMRWB is 16kHz. Please consult with the related audio coding standard for the supported audio sampling rate.
  set audioSamplingRate(int value);

  /// Sets the audio source to be used for recording. If this method is not called, the output file will not contain an audio track. The source needs to be specified before setting recording-parameters or encoders. Call this only before setOutputFormat().
  set audioSource(MediaRecorder$AudioSource value);

  // set camera(Camera value);

  /// Set video frame capture rate. This can be used to set a different video frame capture rate than the recorded video's playback rate. This method also sets the recording mode to time lapse. In time lapse video recording, only video is recorded. Audio related parameters are ignored when a time lapse recording session starts, if an application sets them.
  set captureRate(int value);

  // set inputSurface(Surface value);

  /// Sets the maximum duration (in ms) of the recording session. Call this after setOutputFormat() but before prepare(). After recording reaches the specified duration, a notification will be sent to the android.media.MediaRecorder.OnInfoListener with a "what" code of MEDIA_RECORDER_INFO_MAX_DURATION_REACHED and recording will be stopped. Stopping happens asynchronously, there is no guarantee that the recorder will have stopped by the time the listener is notified.
  ///
  /// When using MPEG-4 container (setOutputFormat(int) with OutputFormat.MPEG_4), it is recommended to set maximum duration that fits the use case. Setting a larger than required duration may result in a larger than needed output file because of space reserved for MOOV box expecting large movie data in this recording session. Unused space of MOOV box is turned into FREE box in the output file.
  set maxDuration(int value);

  /// Sets the maximum filesize (in bytes) of the recording session. Call this after setOutputFormat() but before prepare(). After recording reaches the specified filesize, a notification will be sent to the android.media.MediaRecorder.OnInfoListener with a "what" code of MEDIA_RECORDER_INFO_MAX_FILESIZE_REACHED and recording will be stopped. Stopping happens asynchronously, there is no guarantee that the recorder will have stopped by the time the listener is notified.
  ///
  /// When using MPEG-4 container (setOutputFormat(int) with OutputFormat.MPEG_4), it is recommended to set maximum filesize that fits the use case. Setting a larger than required filesize may result in a larger than needed output file because of space reserved for MOOV box expecting large movie data in this recording session. Unused space of MOOV box is turned into FREE box in the output file.
  set maxFileSize(int value);

  // set nextOutputFile(File value);

  // set nextOutputFileDescriptor(FileDescriptor value);

  /// Sets the orientation hint for output video playback. This method should be called before prepare(). This method will not trigger the source video frame to rotate during video recording, but to add a composition matrix containing the rotation angle in the output video if the output format is OutputFormat.THREE_GPP or OutputFormat.MPEG_4 so that a video player can choose the proper orientation for playback. Note that some video players may choose to ignore the compostion matrix in a video during playback.
  set orientationHint(int value);

  // set outputFile(File file);

  /// Pass in the file descriptor of the file to be written. Call this after setOutputFormat() but before prepare().
  set outputFileDescriptor(FileDescriptor value);

  /// Sets the path of the output file to be produced. Call this after setOutputFormat() but before prepare().
  set outputFilePath(String value);

  /// Sets the format of the output file produced during recording. Call this after setAudioSource()/setVideoSource() but before prepare().
  ///
  /// It is recommended to always use 3GP format when using the H.263 video encoder and AMR audio encoder. Using an MPEG-4 container format may confuse some desktop players.
  set outputFormat(MediaRecorder$OutputFormat value);

  // set previewDisplay(Surface value);
  // set profile(CamcorderProfile value);

  /// Sets the video encoder to be used for recording. If this method is not called, the output file will not contain an video track. Call this after setOutputFormat() and before prepare().
  set videoEncoder(MediaRecorder$VideoEncoder value);

  /// Sets the video encoding bit rate for recording. Call this method before prepare(). Prepare() may perform additional checks on the parameter to make sure whether the specified bit rate is applicable, and sometimes the passed bitRate will be clipped internally to ensure the video recording can proceed smoothly based on the capabilities of the platform.
  ///
  /// NB: the actual bitrate and other encoding characteristics may be affected by the minimum quality floor behavior introduced in android.os.Build.VERSION_CODES#S. More detail on how and where this impacts video encoding can be found in the MediaCodec page and looking for "quality floor" (near the top of the page).
  set videoEncodingBitRate(int value);

  // set videoEncodingQuality(int value);

  /// Sets the frame rate of the video to be captured. Must be called after setVideoSource(). Call this after setOutputFormat() but before prepare().
  ///
  /// NOTE: On some devices that have auto-frame rate, this sets the maximum frame rate, not a constant frame rate. Actual frame rate will vary according to lighting conditions.
  set videoFrameRate(int value);

  // set videoProfile(EncoderProfiles$VideoProfile value);

  /// Sets the video source to be used for recording. If this method is not called, the output file will not contain an video track. The source needs to be specified before setting recording-parameters or encoders. Call this only before setOutputFormat().
  set videoSource(int value);

  /// Pauses recording. Call this after start(). You may resume recording with resume() without reconfiguration, as opposed to stop(). It does nothing if the recording is already paused. When the recording is paused and resumed, the resulting output would be as if nothing happend during paused period, immediately switching to the resumed scene.
  void pause();

  /// Prepares the recorder to begin capturing and encoding data. This method must be called after setting up the desired audio and video sources, encoders, file format, etc., but before start().
  void prepare();

  // void registerAudioRecordingCallback(
  //   AudioManager$AudioRecordingCallback callback,
  // );

  /// Releases resources associated with this MediaRecorder object. It is good practice to call this method when you're done using the MediaRecorder. In particular, whenever an Activity of an application is paused (its onPause() method is called), or stopped (its onStop() method is called), this method should be invoked to release the MediaRecorder object, unless the application has a special need to keep the object around. In addition to unnecessary resources (such as memory and instances of codecs) being held, failure to call this method immediately if a MediaRecorder object is no longer needed may also lead to continuous battery consumption for mobile devices, and recording failure for other applications if no multiple instances of the same codec are supported on a device. Even if multiple instances of the same codec are supported, some performance degradation may be expected when unnecessary multiple instances are used at the same time.
  void release();

  /// Restarts the MediaRecorder to its idle state. After calling this method, you will have to configure it again as if it had just been constructed.
  void reset();

  /// Resumes recording. Call this after start(). It does nothing if the recording is not paused.
  void resume();

  /// Set and store the geodata (latitude and longitude) in the output file. This method should be called before prepare(). The geodata is stored in udta box if the output format is OutputFormat.THREE_GPP or OutputFormat.MPEG_4, and is ignored for other output formats. The geodata is stored according to ISO-6709 standard.
  void setLocation(double latitude, double longitude);

  /// Register a callback to be invoked when an error occurs while recording.
  void setOnErrorListener(MediaRecorder$OnErrorListener listener);

  /// Register a callback to be invoked when an informational event occurs while recording.
  void setOnInfoListener(MediaRecorder$OnInfoListener listener);

  // bool setPreferredMicrophoneDirection(int direction);
  // bool setPreferredMicrophoneFieldDimension(double zoom);
  // void setVideoEncodingProfileLevel(int profile, int level);

  /// Sets the width and height of the video to be captured. Must be called after setVideoSource(). Call this after setOutputFormat() but before prepare().
  void setVideoSize(int width, int height);

  /// Begins capturing and encoding data to the file specified with setOutputFile(). Call this after prepare().
  ///
  /// Since API level 13, if applications set a camera via setCamera(Camera), the apps can use the camera after this method call. The apps do not need to lock the camera again. However, if this method fails, the apps should still lock the camera back. The apps should not start another recording session during recording.
  void start();

  /// Stops recording. Call this after start(). Once recording is stopped, you will have to configure it again as if it has just been constructed. Note that a RuntimeException is intentionally thrown to the application, if no valid audio/video data has been received when stop() is called. This happens if stop() is called immediately after start(). The failure lets the application take action accordingly to clean up the output file (delete the output file, for instance), since the output file is not properly constructed when this happens.
  void stop();

  // void unregisterAudioRecordingCallback(
  //   AudioManager$AudioRecordingCallback callback,
  // );
}

/// Interface definition for a callback to be invoked when an error occurs while recording.
abstract interface class MediaRecorder$OnErrorListener {
  factory MediaRecorder$OnErrorListener({
    required void Function(
      MediaRecorder mr,
      MediaRecorder$Error what,
      int extra,
    )
    onError,
  }) => MediaRecorderChannel.instance.createOnErrorListener(onError: onError);
}

/// Interface definition of a callback to be invoked to communicate some info and/or warning about the recording.
abstract interface class MediaRecorder$OnInfoListener {
  factory MediaRecorder$OnInfoListener({
    required void Function(MediaRecorder mr, MediaRecorder$Info what, int extra)
    onInfo,
  }) => MediaRecorderChannel.instance.createOnInfoListener(onInfo: onInfo);
}

abstract base class MediaRecorderChannel extends PlatformInterface {
  /// Constructs a [MediaRecorderChannel].
  MediaRecorderChannel() : super(token: _token);

  static final Object _token = Object();

  static MediaRecorderChannel? _instance;

  /// The default instance of [MediaRecorderChannel] to use.
  static MediaRecorderChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MediaRecorderChannel] when
  /// they register themselves.
  static set instance(MediaRecorderChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  int get audioSourceMax;

  MediaRecorder create();
  MediaRecorder$OnErrorListener createOnErrorListener({
    required void Function(
      MediaRecorder mr,
      MediaRecorder$Error what,
      int extra,
    )
    onError,
  });
  MediaRecorder$OnInfoListener createOnInfoListener({
    required void Function(MediaRecorder mr, MediaRecorder$Info what, int extra)
    onInfo,
  });
}
