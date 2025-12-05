import 'package:flutter_test/flutter_test.dart';
import 'package:invictus/invictus.dart';
import 'package:invictus/invictus_platform_interface.dart';
import 'package:invictus/invictus_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockInvictusPlatform
    with MockPlatformInterfaceMixin
    implements InvictusPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final InvictusPlatform initialPlatform = InvictusPlatform.instance;

  test('$MethodChannelInvictus is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelInvictus>());
  });

  test('getPlatformVersion', () async {
    Invictus invictusPlugin = Invictus();
    MockInvictusPlatform fakePlatform = MockInvictusPlatform();
    InvictusPlatform.instance = fakePlatform;

    expect(await invictusPlugin.getPlatformVersion(), '42');
  });
}
