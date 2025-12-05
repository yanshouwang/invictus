import 'package:flutter_test/flutter_test.dart';
import 'package:invictus_android/invictus_android.dart';
import 'package:invictus_android/invictus_android_platform_interface.dart';
import 'package:invictus_android/invictus_android_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockInvictusAndroidPlatform
    with MockPlatformInterfaceMixin
    implements InvictusAndroidPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final InvictusAndroidPlatform initialPlatform = InvictusAndroidPlatform.instance;

  test('$MethodChannelInvictusAndroid is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelInvictusAndroid>());
  });

  test('getPlatformVersion', () async {
    InvictusAndroid invictusAndroidPlugin = InvictusAndroid();
    MockInvictusAndroidPlatform fakePlatform = MockInvictusAndroidPlatform();
    InvictusAndroidPlatform.instance = fakePlatform;

    expect(await invictusAndroidPlugin.getPlatformVersion(), '42');
  });
}
