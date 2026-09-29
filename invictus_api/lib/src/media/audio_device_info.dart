abstract interface class AudioDeviceInfo {
  // String get address;
  // List<AudioDescriptor> get audioDescriptors;
  // List<AudioProfile> get audioProfiles;
  List<int> get channelCounts;
  List<int> get channelIndexMasks;
  List<int> get channelMasks;
  // List<int> get encapsulationMetadataTypes;
  // List<int> get encapsulationModes;
  List<int> get encodings;
  int get id;
  String get productName;
  List<int> get sampleRates;
  // int get speakerLayoutChannelMask;
  int get type;
  bool get isSink;
  bool get isSource;
}
