import 'package:invictus_api/src/io.dart';
import 'package:invictus_api/src/net.dart' as net;
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

enum MediaPlayer$TrackInfo$MediaTrackType {
  /// TODO
  unknown,

  /// TODO
  video,

  /// TODO
  audio,

  /// TODO
  timedtext,

  /// TODO
  subtitle,

  /// TODO
  metadata,
}

enum MediaPlayer$VideoScalingMode {
  /// Specifies a video scaling mode. The content is stretched to the surface rendering area. When the surface has the same aspect ratio as the content, the aspect ratio of the content is maintained; otherwise, the aspect ratio of the content is not maintained when video is being rendered. Unlike VIDEO_SCALING_MODE_SCALE_TO_FIT_WITH_CROPPING, there is no content cropping with this video scaling mode.
  scaleToFit,

  /// Specifies a video scaling mode. The content is scaled, maintaining its aspect ratio. The whole surface area is always used. When the aspect ratio of the content is the same as the surface, no content is cropped; otherwise, content is cropped to fit the surface.
  scaleToFitWithCropping,
}

/// MediaPlayer class can be used to control playback of audio/video files and streams.
///
/// MediaPlayer is not thread-safe. Creation of and all access to player instances should be on the same thread. If registering callbacks, the thread must have a Looper.
abstract interface class MediaPlayer {
  /// Default constructor.
  ///
  /// Consider using one of the create() methods for synchronously instantiating a MediaPlayer from a Uri or resource.
  ///
  /// You must call release() when you are finished using the instantiated instance. Doing so frees any resources you have previously acquired.
  factory MediaPlayer() => MediaPlayerChannel.instance.create();

  /// Convenience method to create a MediaPlayer for a given Uri. On success, prepare() will already have been called and must not be called again.
  ///
  /// You must call release() when you are finished using the created instance. Doing so frees any resources you have previously acquired.
  ///
  /// Note that since prepare() is called automatically in this method, you cannot change the audio session ID (see setAudioSessionId(int)) or audio attributes (see setAudioAttributes(AudioAttributes) of the new MediaPlayer.
  factory MediaPlayer.uri(net.Uri uri) =>
      MediaPlayerChannel.instance.createWithUri(uri);

  /// Same factory method as create(Context,Uri,SurfaceHolder) but that lets you specify the audio attributes and session ID to be used by the new MediaPlayer instance.
  factory MediaPlayer.uriAttributesSessionId(
    net.Uri uri,
    AudioAttributes audioAttributes,
    int audioSessionId,
  ) => MediaPlayerChannel.instance.createWithUriAttributesSessionId(
    uri,
    audioAttributes,
    audioSessionId,
  );

  /// Convenience method to create a MediaPlayer for a given resource id. On success, prepare() will already have been called and must not be called again.
  ///
  /// You must call release() when you are finished using the created instance. Doing so frees any resources you have previously acquired.
  ///
  /// Note that since prepare() is called automatically in this method, you cannot change the audio session ID (see setAudioSessionId(int)) or audio attributes (see setAudioAttributes(AudioAttributes) of the new MediaPlayer.
  factory MediaPlayer.resId(int resId) =>
      MediaPlayerChannel.instance.createWithResId(resId);

  /// Same factory method as create(Context,int) but that lets you specify the audio attributes and session ID to be used by the new MediaPlayer instance.
  factory MediaPlayer.resIdAttributesSessionId(
    int resId,
    AudioAttributes audioAttributes,
    int audioSessionId,
  ) => MediaPlayerChannel.instance.createWithResIdAttributesSessionId(
    resId,
    audioAttributes,
    audioSessionId,
  );

  /// Returns the audio session ID.
  int get audioSessionId;

  /// Sets the audio session ID.
  set audioSessionId(int sessionId);

  /// Gets the current playback position.
  int get currentPosition;

  // MediaPlayer$DrmInfo get drmInfo;

  /// Gets the duration of the file.
  ///
  /// the duration in milliseconds, if no duration is available (for example, if streaming live content), -1 is returned.
  int get duration;

  // PersistableBundle get metrics;

  /// Gets the playback params, containing the current playback rate.
  PlaybackParams get playbackParams;

  /// Sets playback rate using PlaybackParams. The object sets its internal PlaybackParams to the input, except that the object remembers previous speed when input speed is zero. This allows the object to resume at previous speed when start() is called. Calling it before the object is prepared does not change the object state. After the object is prepared, calling it with zero speed is equivalent to calling pause(). After the object is prepared, calling it with non-zero speed is equivalent to calling start().
  set playbackParams(PlaybackParams params);

  /// Gets the A/V sync mode.
  SyncParams get syncParams;

  /// Sets A/V sync mode.
  set syncParams(SyncParams params);

  /// Get current playback position as a MediaTimestamp.
  ///
  /// The MediaTimestamp represents how the media time correlates to the system time in a linear fashion using an anchor and a clock rate. During regular playback, the media time moves fairly constantly (though the anchor frame may be rebased to a current system time, the linear correlation stays steady). Therefore, this method does not need to be called often.
  ///
  /// To help users get current playback position, this method always anchors the timestamp to the current system time, so MediaTimestamp.getAnchorMediaTimeUs can be used as current playback position.
  MediaTimestamp? get timestamp;

  /// Returns an array of track information.
  List<MediaPlayer$TrackInfo> get trackInfo;

  /// Returns the height of the video.
  int get videoHeight;

  /// Returns the width of the video.
  int get videoWidth;

  /// Checks whether the MediaPlayer is looping or non-looping.
  bool get isLooping;

  /// Sets the player to be looping or non-looping.
  set isLooping(bool value);

  /// Checks whether the MediaPlayer is playing.
  bool get isPlaying;

  /// Sets the audio attributes for this MediaPlayer. See AudioAttributes for how to build and configure an instance of this class. You must call this method before prepare() or prepareAsync() in order for the audio attributes to become effective thereafter.
  set audioAttributes(AudioAttributes value);

  /// Sets the audio stream type for this MediaPlayer. See AudioManager for a list of stream types. Must call this method before prepare() or prepareAsync() in order for the target stream type to become effective thereafter.
  @Deprecated(
    'Deprecated in API level 26, use setAudioAttributes(AudioAttributes)',
  )
  set audioStreamType(int value);

  /// Sets the send level of the player to the attached auxiliary effect. See attachAuxEffect(int). The level value range is 0 to 1.0.
  ///
  /// By default the send level is 0, so even if an effect is attached to the player this method must be called for the effect to be applied.
  ///
  /// Note that the passed level value is a raw scalar. UI controls should be scaled logarithmically: the gain applied by audio framework ranges from -72dB to 0dB, so an appropriate conversion from linear UI input x to level is: x == 0 -> level = 0 0 < x <= R -> level = 10^(72*(x-R)/20/R)
  set auxEffectSendLevel(double value);

  // set display(SurfaceHolder value);

  /// Set the MediaPlayer to start when this MediaPlayer finishes playback (i.e. reaches the end of the stream). The media framework will attempt to transition from this player to the next as seamlessly as possible. The next player can be set at any time before completion, but shall be after setDataSource has been called successfully. The next player must be prepared by the app, and the application should not call start() on it. The next MediaPlayer must be different from 'this'. An exception will be thrown if next == this. The application may call setNextMediaPlayer(null) to indicate no next player should be started at the end of playback. If the current player is looping, it will keep looping and the next player will not be started.
  set nextMediaPlayer(MediaPlayer value);

  /// Control whether we should use the attached SurfaceHolder to keep the screen on while video playback is occurring. This is the preferred method over setWakeMode where possible, since it doesn't require that the application have permission for low-level wake lock access.
  set screenOnWhilePlaying(bool value);

  // set surface(Surface value);

  /// Sets video scaling mode. To make the target video scaling mode effective during playback, this method must be called after data source is set. If not called, the default video scaling mode is VIDEO_SCALING_MODE_SCALE_TO_FIT.
  set videoScalingMode(MediaPlayer$VideoScalingMode value);

  /// Set the low-level power management behavior for this MediaPlayer. This can be used when the MediaPlayer is not playing through a SurfaceHolder set with setDisplay(SurfaceHolder) and thus can use the high-level setScreenOnWhilePlaying(boolean) feature.
  ///
  /// This function has the MediaPlayer access the low-level power manager service to control the device's power usage while playing is occurring. The parameter is a combination of android.os.PowerManager wake flags. Use of this method requires android.Manifest.permission#WAKE_LOCK permission. By default, no attempt is made to keep the device awake during playback.
  set wakeMode(int value);

  /// Adds an external timed text source file (Uri). Currently supported format is SubRip with the file extension .srt, case insensitive. Note that a single external timed text source may contain multiple tracks in it. One can find the total number of available tracks using getTrackInfo() to see what additional tracks become available after this method call.
  void addTimedTextSource(net.Uri uri, String mimeType);

  /// Adds an external timed text source file (FileDescriptor). It is the caller's responsibility to close the file descriptor. It is safe to do so as soon as this call returns. Currently supported format is SubRip. Note that a single external timed text source may contain multiple tracks in it. One can find the total number of available tracks using getTrackInfo() to see what additional tracks become available after this method call.
  void addTimedTextSource(FileDescriptor fd, String mimeType);

  /// Adds an external timed text file (FileDescriptor). It is the caller's responsibility to close the file descriptor. It is safe to do so as soon as this call returns. Currently supported format is SubRip. Note that a single external timed text source may contain multiple tracks in it. One can find the total number of available tracks using getTrackInfo() to see what additional tracks become available after this method call.
  void addTimedTextSource(
    FileDescriptor fd,
    int offset,
    int length,
    String mimeType,
  );

  /// Adds an external timed text source file. Currently supported format is SubRip with the file extension .srt, case insensitive. Note that a single external timed text source may contain multiple tracks in it. One can find the total number of available tracks using getTrackInfo() to see what additional tracks become available after this method call.
  void addTimedTextSource(String path, String mimeType);

  /// Attaches an auxiliary effect to the player. A typical auxiliary effect is a reverberation effect which can be applied on any sound source that directs a certain amount of its energy to this effect. This amount is defined by setAuxEffectSendLevel(). See setAuxEffectSendLevel(float).
  ///
  /// After creating an auxiliary effect (e.g. android.media.audiofx.EnvironmentalReverb), retrieve its ID with android.media.audiofx.AudioEffect#getId() and use it when calling this method to attach the player to the effect.
  ///
  /// To detach the effect from the player, call this method with a null effect id.
  ///
  /// This method must be called after one of the overloaded setDataSource methods.
  void attachAuxEffect(int effectId);

  // void clearOnMediaTimeDiscontinuityListener();
  // void clearOnSubtitleDataListener();

  /// Deselect a track.
  ///
  /// Currently, the track must be a timed text track and no audio or video tracks can be deselected. If the timed text track identified by index has not been selected before, it throws an exception.
  void deselectTrack(int index);

  // String getDrmPropertyString(String propertyName);
  // MediaDrm$KeyRequest getKeyRequest(
  //   Uint8List? keySetId,
  //   Uint8List? initData,
  //   String? mimeType,
  //   int keyType,
  //   Map<String, String>? optionalParameters,
  // );

  /// Returns the index of the audio, video, or subtitle track currently selected for playback, The return value is an index into the array returned by getTrackInfo(), and can be used in calls to selectTrack(int) or deselectTrack(int).
  int getSelectedTrack(MediaPlayer$TrackInfo$MediaTrackType trackType);

  /// Pauses playback. Call start() to resume.
  void pause();

  /// Prepares the player for playback, synchronously. After setting the datasource and the display surface, you need to either call prepare() or prepareAsync(). For files, it is OK to call prepare(), which blocks until MediaPlayer is ready for playback.
  void prepare();

  /// Prepares the player for playback, asynchronously. After setting the datasource and the display surface, you need to either call prepare() or prepareAsync(). For streams, you should call prepareAsync(), which returns immediately, rather than blocking until enough data has been buffered.
  void prepareAsync();

  // void prepareDrm(UUID uuid);
  // Uint8List provideKeyResponse(Uint8List? keySetId, Uint8List response);

  /// Releases resources associated with this MediaPlayer object.
  ///
  /// You must call this method once the instance is no longer required.
  void release();

  // void releaseDrm();

  /// Resets the MediaPlayer to its uninitialized state. After calling this method, you will have to initialize it again by setting the data source and calling prepare().
  void reset();

  // void restoreKeys(Uint8List keySetId);

  /// Seeks to specified time position. Same as seekTo(long,int) with mode = SEEK_PREVIOUS_SYNC.
  void seekTo(int msec);
  // void seekTo(int msec, MediaPlayer$Seek mode);

  /// Selects a track.
  ///
  /// If a MediaPlayer is in invalid state, it throws an IllegalStateException exception. If a MediaPlayer is in Started state, the selected track is presented immediately. If a MediaPlayer is not in Started state, it just marks the track to be played.
  ///
  /// In any valid state, if it is called multiple times on the same type of track (ie. Video, Audio, Timed Text), the most recent one will be chosen.
  ///
  /// The first audio and video tracks are selected by default if available, even though this method is not called. However, no timed text track will be selected until this function is called.
  ///
  /// Currently, only timed text, subtitle or audio tracks can be selected via this method. In addition, the support for selecting an audio track at runtime is pretty limited in that an audio track can only be selected in the Prepared state.
  void selectTrack(int index);

  /// Sets the data source as a content Uri.
  ///
  /// Note that the cross domain redirection is allowed by default, but that can be changed with key/value pairs through the headers parameter with "android-allow-cross-domain-redirect" as the key and "0" or "1" as the value to disallow or allow cross domain redirection.
  void setDataSourceWithUri(net.Uri uri, {Map<String, String>? headers});

  /// Sets the data source (AssetFileDescriptor) to use. It is the caller's responsibility to close the file descriptor. It is safe to do so as soon as this call returns.
  void setDataSourceWithAssetFileDescriptor(AssetFileDescriptor afd);

  /// Sets the data source (MediaDataSource) to use.
  void setDataSource(MediaDataSource dataSource);

  /// Sets the data source (FileDescriptor) to use. It is the caller's responsibility to close the file descriptor. It is safe to do so as soon as this call returns.
  void setDataSourceWithFileDescriptor(FileDescriptor fd);

  /// Sets the data source (FileDescriptor) to use. The FileDescriptor must be seekable (N.B. a LocalSocket is not seekable). It is the caller's responsibility to close the file descriptor. It is safe to do so as soon as this call returns.
  void setDataSourceWithFileDescriptorOffsetLength(
    FileDescriptor fd,
    int offset,
    int length,
  );

  /// Sets the data source (file-path or http/rtsp URL) to use.
  ///
  /// When path refers to a local file, the file may actually be opened by a process other than the calling application. This implies that the pathname should be an absolute path (as any other process runs with unspecified current working directory), and that the pathname should reference a world-readable file. As an alternative, the application could first open the file for reading, and then use the file descriptor form setDataSource(FileDescriptor).
  void setDataSourceWithPath(String path);

  // void setDrmPropertyString(String propertyName, String value);

  /// Register a callback to be invoked when the status of a network stream's buffer has changed.
  void setOnBufferingUpdateListener(
    MediaPlayer$OnBufferingUpdateListener listener,
  );

  /// Register a callback to be invoked when the end of a media source has been reached during playback.
  void setOnCompletionListener(MediaPlayer$OnCompletionListener listener);

  // void setOnDrmConfigHelper(MediaPlayer$OnDrmConfigHelper listener);
  // void setOnDrmInfoListener(MediaPlayer$OnDrmInfoListener listener);
  // void setOnDrmPreparedListener(MediaPlayer$OnDrmPreparedListener listener);

  /// Register a callback to be invoked when an error has happened during an asynchronous operation.
  void setOnErrorListener(MediaPlayer$OnErrorListener listener);

  /// Register a callback to be invoked when an info/warning is available.
  void setOnInfoListener(MediaPlayer$OnInfoListener listener);

  // void setOnMediaTimeDiscontinuityListener(
  //   MediaPlayer$OnMediaTimeDiscontinuityListener listener,
  // );

  /// Register a callback to be invoked when the media source is ready for playback.
  void setOnPreparedListener(MediaPlayer$OnPreparedListener listener);

  /// Register a callback to be invoked when a seek operation has been completed.
  void setOnSeekCompleteListener(MediaPlayer$OnSeekCompleteListener listener);

  // void setOnSubtitleDataListener(MediaPlayer$OnSubtitleDataListener listener);

  /// Register a callback to be invoked when a selected track has timed metadata available.
  ///
  /// Currently only HTTP live streaming data URI's embedded with timed ID3 tags generates TimedMetaData.
  void setOnTimedMetaDataAvailableListener(
    MediaPlayer$OnTimedMetaDataAvailableListener listener,
  );

  /// Register a callback to be invoked when a timed text is available for display.
  void setOnTimedTextListener(MediaPlayer$OnTimedTextListener listener);

  /// Register a callback to be invoked when the video size is known or updated.
  void setOnVideoSizeChangedListener(
    MediaPlayer$OnVideoSizeChangedListener listener,
  );

  /// Sets the volume on this player. This API is recommended for balancing the output of audio streams within an application. Unless you are writing an application to control user settings, this API should be used in preference to AudioManager.setStreamVolume(int,int,int) which sets the volume of ALL streams of a particular type. Note that the passed volume values are raw scalars in range 0.0 to 1.0. UI controls should be scaled logarithmically.
  void setVolume(double leftVolume, double rightVolume);

  /// Starts or resumes playback. If playback had previously been paused, playback will continue from where it was paused. If playback had been stopped, or never started before, playback will start at the beginning.
  void start();

  /// Stops playback after playback has been started or paused.
  void stop();
}

abstract base class MediaPlayerChannel extends PlatformInterface {
  /// Constructs a [MediaPlayerChannel].
  MediaPlayerChannel() : super(token: _token);

  static final Object _token = Object();

  static MediaPlayerChannel? _instance;

  /// The default instance of [MediaPlayerChannel] to use.
  static MediaPlayerChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MediaPlayerChannel] when
  /// they register themselves.
  static set instance(MediaPlayerChannel instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  MediaPlayer create();
  MediaPlayer createWithUri(net.Uri uri);
  MediaPlayer createWithUriAttributesSessionId(
    net.Uri uri,
    AudioAttributes audioAttributes,
    int audioSessionId,
  );
  MediaPlayer createWithResId(int resId);
  MediaPlayer createWithResIdAttributesSessionId(
    int resId,
    AudioAttributes audioAttributes,
    int audioSessionId,
  );
}
