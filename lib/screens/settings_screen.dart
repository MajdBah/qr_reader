import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import '../providers/theme_provider.dart';
import '../services/localization_service.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = LocalizationService.of(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localization.translate('settings')),
        centerTitle: true,
        backgroundColor: theme.colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    localization.translate('appearance'),
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                const Divider(),
                RadioListTile<ThemeMode>(
                  title: Text(localization.translate('systemTheme')),
                  value: ThemeMode.system,
                  groupValue: themeProvider.themeMode,
                  onChanged: (value) {
                    if (value != null) {
                      themeProvider.setThemeMode(value);
                    }
                  },
                  secondary: const Icon(Icons.brightness_auto),
                ),
                RadioListTile<ThemeMode>(
                  title: Text(localization.translate('lightTheme')),
                  value: ThemeMode.light,
                  groupValue: themeProvider.themeMode,
                  onChanged: (value) {
                    if (value != null) {
                      themeProvider.setThemeMode(value);
                    }
                  },
                  secondary: const Icon(Icons.brightness_5),
                ),
                RadioListTile<ThemeMode>(
                  title: Text(localization.translate('darkTheme')),
                  value: ThemeMode.dark,
                  groupValue: themeProvider.themeMode,
                  onChanged: (value) {
                    if (value != null) {
                      themeProvider.setThemeMode(value);
                    }
                  },
                  secondary: const Icon(Icons.brightness_3),
                ),
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    localization.translate('language'),
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                const Divider(),
                RadioListTile<Locale>(
                  title: const Text('English'),
                  value: const Locale('en'),
                  groupValue: languageProvider.locale,
                  onChanged: (value) {
                    if (value != null) {
                      languageProvider.setLocale(value);
                    }
                  },
                  secondary: const CircleAvatar(
                    child: Text('🇺🇸'),
                  ),
                ),
                RadioListTile<Locale>(
                  title: const Text('العربية'),
                  value: const Locale('ar'),
                  groupValue: languageProvider.locale,
                  onChanged: (value) {
                    if (value != null) {
                      languageProvider.setLocale(value);
                    }
                  },
                  secondary: const CircleAvatar(
                    child: Text('🇸🇦'),
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    localization.translate('about'),
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                const Divider(),
                ListTile(
                  title: Text(localization.translate('appVersion')),
                  subtitle: const Text('1.0.0'),
                  leading: const Icon(Icons.info),
                ),
                ListTile(
                  title: Text(localization.translate('privacyPolicy')),
                  leading: const Icon(Icons.privacy_tip),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(localization.translate('termsOfService')),
                  leading: const Icon(Icons.description),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
