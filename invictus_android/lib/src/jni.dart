import 'dart:typed_data';

import 'package:invictus_android/src/jni.dart';

export 'package:jni/jni.dart';

export 'jni/android/app/_package.dart';
export 'jni/android/content/_package.dart';
export 'jni/android/hardware/usb/_package.dart';
export 'jni/android/icu/util/_package.dart';
export 'jni/android/net/_package.dart';
export 'jni/android/net/wifi/_package.dart';
export 'jni/android/net/wifi/aware/_package.dart';
export 'jni/android/os/_package.dart';
export 'jni/androidx/core/content/_package.dart';
export 'jni/dev/zeekr/invictus_android/app/_package.dart';
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

Context get context => Jni.androidApplicationContext.as(Context.type);

extension Invictus$intX on int {
  JInteger get api => toJInteger();
}

extension Invictus$JIntegerX on JInteger {
  int get impl => intValue(releaseOriginal: true);
}

extension Invictus$StringX on String {
  JString get api => toJString();
}

extension Invictus$JStringX on JString {
  String get impl => toDartString(releaseOriginal: true);
}

extension Invictus$Uint8ListX on Uint8List {
  JByteBuffer get byteBufferApi => toJByteBuffer();

  JByteArray get byteArrayApi => toJByteBuffer().array;
}

extension Invictus$JByteArrayX on JByteArray {
  Uint8List get impl => JByteBuffer.wrap(this).impl;
}

extension Invictus$JByteBufferX on JByteBuffer {
  Uint8List get impl => asUint8List();
}

extension Invictus$JContextX on Context {
  JString get packageName {
    final packageNameOrNull = getPackageName();
    return ArgumentError.checkNotNull(packageNameOrNull, 'packageName');
  }

  Executor get mainExecutor => ContextCompat.getMainExecutor(this);
  Handler get mainHandler => getMainHandler();
  Looper get mainLooper {
    final mainLooperOrNull = getMainLooper();
    return ArgumentError.checkNotNull(mainLooperOrNull, 'mainLooper');
  }

  Handler getMainHandler() => Handler.new$2(mainLooper);
}

extension Invictus$JIntentX on Intent {
  JString? get action => getAction();
}
