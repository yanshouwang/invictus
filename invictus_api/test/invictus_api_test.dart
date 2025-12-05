import 'package:flutter_test/flutter_test.dart';
import 'package:invictus_api/invictus_api.dart';
import 'package:invictus_api/invictus_api_platform_interface.dart';
import 'package:invictus_api/invictus_api_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockInvictusApiPlatform
    with MockPlatformInterfaceMixin
    implements InvictusApiPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final InvictusApiPlatform initialPlatform = InvictusApiPlatform.instance;

  test('$MethodChannelInvictusApi is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelInvictusApi>());
  });

  test('getPlatformVersion', () async {
    InvictusApi invictusApiPlugin = InvictusApi();
    MockInvictusApiPlatform fakePlatform = MockInvictusApiPlatform();
    InvictusApiPlatform.instance = fakePlatform;

    expect(await invictusApiPlugin.getPlatformVersion(), '42');
  });
}
