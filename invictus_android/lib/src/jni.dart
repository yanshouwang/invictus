import 'dart:typed_data';
import 'dart:ui';

import 'package:invictus_android/src/jni.dart';
import 'package:jni_flutter/jni_flutter.dart';

export 'package:jni/jni.dart';

export 'jni/android/app/_package.dart';
export 'jni/android/content/_package.dart';
export 'jni/android/hardware/usb/_package.dart';
export 'jni/android/icu/util/_package.dart';
export 'jni/android/net/_package.dart';
export 'jni/android/net/wifi/_package.dart';
export 'jni/android/net/wifi/aware/_package.dart';
export 'jni/android/os/_package.dart';
export 'jni/android/provider/_package.dart';
export 'jni/androidx/core/content/_package.dart';
export 'jni/dev/zeekr/invictus_android/app/_package.dart';
export 'jni/dev/zeekr/invictus_android/app/time/_package.dart';
export 'jni/dev/zeekr/invictus_android/content/_package.dart';
export 'jni/dev/zeekr/invictus_android/internal/app/_package.dart';
export 'jni/dev/zeekr/invictus_android/net/_package.dart';
export 'jni/dev/zeekr/invictus_android/net/ethernet/_package.dart';
export 'jni/dev/zeekr/invictus_android/net/util/_package.dart';
export 'jni/dev/zeekr/invictus_android/net/wifi/_package.dart';
export 'jni/dev/zeekr/invictus_android/os/_package.dart';
export 'jni/java/io/_package.dart';
export 'jni/java/lang/_package.dart';
export 'jni/java/net/_package.dart';
export 'jni/java/util/_package.dart';
export 'jni/java/util/concurrent/_package.dart';
export 'jni/javax/net/_package.dart';

Context get context => androidApplicationContext.as(Context.type);
Activity? get activity {
  final engineId = PlatformDispatcher.instance.engineId;
  if (engineId == null) return null;
  return androidActivity(engineId)?.as(Activity.type);
}

extension Invictus$intX on int {
  JInteger get int32Api => toJInteger();
  JLong get int64Api => toJLong();
}

extension Invictus$JIntegerX on JInteger {
  int get impl => toDartInt(releaseOriginal: true);
}

extension Invictus$JLongX on JLong {
  int get impl => toDartInt(releaseOriginal: true);
}

extension Invictus$boolX on bool {
  JBoolean get api => toJBoolean();
}

extension Invictus$JBooleanX on JBoolean {
  bool get impl => toDartBool(releaseOriginal: true);
}

extension Invictus$JCharacterX on JCharacter {
  int get impl => toDartInt(releaseOriginal: true);
}

extension Invictus$StringX on String {
  JString get api => toJString();
}

extension Invictus$JStringX on JString {
  String get impl => toDartString(releaseOriginal: true);
}

extension Invictus$StringListX on List<String> {
  JArray<JString> get api => JArray.of(JString.type, map((e) => e.api));
}

extension Invictus$IntListX on List<int> {
  JLongArray get longArrayApi => JLongArray.of(this);
}

extension Invictus$Uint8ListX on Uint8List {
  JByteBuffer get byteBufferApi => toJByteBuffer();

  JByteArray get byteArrayApi => toJByteBuffer().array;
}

extension Invictus$JByteArrayX on JByteArray {
  Uint8List get impl {
    final elements = asDart();
    return Uint8List.fromList(elements);
  }
}

extension Invictus$JByteBufferX on JByteBuffer {
  Uint8List get impl => asUint8List();
}

extension Invictus$JContextX on Context {
  Handler get mainHandler {
    final mainLooper = ArgumentError.checkNotNull(
      this.mainLooper,
      'mainLooper',
    );
    return Handler.new$2(mainLooper);
  }
}

extension Invictus$MapExtensions<K extends Object, V extends Object>
    on Map<K?, V?> {
  Map<K, V> get nonNulls => Map.fromIterables(keys.nonNulls, values.nonNulls);
}
