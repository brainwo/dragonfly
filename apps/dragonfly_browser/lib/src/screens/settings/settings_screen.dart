import 'package:dragonfly/src/screens/settings/pages/general_settings.dart';
import 'package:dragonfly/src/screens/settings/pages/search_settings.dart';
import 'package:flutter/material.dart';

Future<void> showSettingsScreen(BuildContext context) async {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    constraints: const BoxConstraints.expand(),
    builder: (context) => const SettingsScreen(),
  );
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Row(
        children: [
          Flexible(
              flex: 2,
              child: Column(
                children: [
                  ListTile(
                    title: const Text("General"),
                    leading: const Icon(Icons.settings),
                    onTap: () {
                      setState(() => selectedIndex = 0);
                    },
                  ),
                  ListTile(
                    title: const Text("Search"),
                    leading: const Icon(Icons.search),
                    onTap: () {
                      setState(() => selectedIndex = 1);
                    },
                  ),
                ],
              )),
          Flexible(
            flex: 8,
            child: IndexedStack(
              index: selectedIndex,
              children: const [
                GeneralSettings(),
                SearchSettings(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
