import 'package:clover/clover.dart';
import 'package:flutter/material.dart';
import 'package:invictus/invictus.dart';
import 'package:invictus_example/view_models.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class EthernetView extends StatefulWidget {
  const EthernetView({super.key});

  @override
  State<EthernetView> createState() => _EthernetViewState();
}

class _EthernetViewState extends State<EthernetView> {
  late final GlobalKey<FormState> _key;
  late ValueNotifier<IpConfiguration$IpAssignment?> _newIpAssignment;
  late TextEditingController _newIpAddressController;
  late TextEditingController _newPrefixLengthController;
  late TextEditingController _newGatewayController;

  @override
  void initState() {
    super.initState();
    _key = GlobalKey();
    _newIpAssignment = ValueNotifier(null);
    _newIpAddressController = TextEditingController();
    _newPrefixLengthController = TextEditingController();
    _newGatewayController = TextEditingController();
  }

  String get contentCanNotBeEmpty => 'Content can not be empty';
  String get formatError => 'Format error';

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModel.of<EthernetViewModel>(context);
    final iface = viewModel.iface;
    final config = iface == null ? null : viewModel.getConfiguration(iface);
    final ipAssignment = config?.ipAssignment;
    final staticConfig = config?.staticIpConfiguration;
    _newIpAssignment.value = ipAssignment;
    if (staticConfig == null) {
      _newIpAddressController.clear();
      _newPrefixLengthController.clear();
      _newGatewayController.clear();
    } else {
      final ipAddress = staticConfig.ipAddress.address.hostAddress;
      if (ipAddress == null) {
        _newIpAddressController.clear();
      } else {
        _newIpAddressController.text = ipAddress;
      }
      _newPrefixLengthController.text = staticConfig.ipAddress.prefixLength
          .toString();
      final gateway = staticConfig.gateway?.hostAddress;
      if (gateway == null) {
        _newGatewayController.clear();
      } else {
        _newGatewayController.text = gateway;
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Ethernet'),
        actions: [
          IconButton(
            onPressed: iface == null || config == null
                ? null
                : () {
                    final isValid = _key.currentState!.validate();
                    if (!isValid) return;
                    final newIpAssignment = _newIpAssignment.value!;
                    config.ipAssignment = newIpAssignment;
                    switch (newIpAssignment) {
                      case IpConfiguration$IpAssignment.dhcp:
                        break;
                      case IpConfiguration$IpAssignment.static:
                        final newIpAddress = _newIpAddressController.text;
                        final newPrefixLength = int.parse(
                          _newPrefixLengthController.text,
                        );
                        final gateway = _newGatewayController.text;
                        final dnsServers =
                            config.staticIpConfiguration?.dnsServers;
                        final domains = config.staticIpConfiguration?.domains;
                        config.staticIpConfiguration = StaticIpConfiguration(
                          ipAddress: LinkAddress.byAddress(
                            '$newIpAddress/$newPrefixLength',
                          ),
                          gateway: InetAddress.byName(gateway),
                          dnsServers: dnsServers,
                          domains: domains,
                        );
                        break;
                      case IpConfiguration$IpAssignment.unassigned:
                        config.staticIpConfiguration = null;
                        break;
                    }
                    viewModel.setConfiguration(iface, config);
                  },
            icon: Icon(Symbols.check),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _key,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ValueListenableBuilder(
            valueListenable: _newIpAssignment,
            builder: (context, newIpAssignment, child) {
              return Column(
                spacing: 16.0,
                children: [
                  DropdownMenuFormField(
                    enabled: iface != null,
                    validator: (value) {
                      // return value == null ? l10n.contentCanNotBeEmpty : null;
                      return value == null ? contentCanNotBeEmpty : null;
                    },
                    onSelected: (value) {
                      if (value == null) return;
                      _newIpAssignment.value = value;
                    },
                    expandedInsets: EdgeInsets.zero,
                    label: Text('Mode'),
                    dropdownMenuEntries: IpConfiguration$IpAssignment.values
                        .map(
                          (value) => DropdownMenuEntry(
                            value: value,
                            // label: l10n.translateIpAssignment(value),
                            label: value.name,
                          ),
                        )
                        .toList(),
                    initialSelection: config?.ipAssignment,
                  ),
                  if (newIpAssignment == IpConfiguration$IpAssignment.static)
                    TextFormField(
                      enabled: iface != null,
                      validator: (value) {
                        if (value == null) return contentCanNotBeEmpty;
                        return null;
                      },
                      // validator: (value) =>
                      //     value != null && ExpUtil.ipAddress.hasMatch(value)
                      //     ? null
                      //     : l10n.formatError,
                      decoration: InputDecoration(labelText: 'IP Address'),
                      controller: _newIpAddressController,
                    ),
                  if (newIpAssignment == IpConfiguration$IpAssignment.static)
                    TextFormField(
                      enabled: iface != null,
                      validator: (value) {
                        if (value == null) return contentCanNotBeEmpty;
                        final i = int.tryParse(value);
                        if (i == null || i < 0 || i > 128) return formatError;
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'Prefix Length'),
                      controller: _newPrefixLengthController,
                    ),
                  if (newIpAssignment == IpConfiguration$IpAssignment.static)
                    TextFormField(
                      enabled: iface != null,
                      validator: (value) {
                        if (value == null) return contentCanNotBeEmpty;
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'Gateway'),
                      controller: _newGatewayController,
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _newIpAssignment.dispose();
    _newIpAddressController.dispose();
    _newPrefixLengthController.dispose();
    _newGatewayController.dispose();
    super.dispose();
  }
}
