import 'package:flutter_test/flutter_test.dart';
import 'package:invictus_darwin/invictus_darwin.dart';
import 'package:invictus_darwin/invictus_darwin_platform_interface.dart';
import 'package:invictus_darwin/invictus_darwin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockInvictusDarwinPlatform
    with MockPlatformInterfaceMixin
    implements InvictusDarwinPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final InvictusDarwinPlatform initialPlatform = InvictusDarwinPlatform.instance;

  test('$MethodChannelInvictusDarwin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelInvictusDarwin>());
  });

  test('getPlatformVersion', () async {
    InvictusDarwin invictusDarwinPlugin = InvictusDarwin();
    MockInvictusDarwinPlatform fakePlatform = MockInvictusDarwinPlatform();
    InvictusDarwinPlatform.instance = fakePlatform;

    expect(await invictusDarwinPlugin.getPlatformVersion(), '42');
  });
}
