import 'package:flutter/material.dart';
import 'package:new_qr_reader/services/localization_service.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = LocalizationService.of(context);
    final theme = Theme.of(context);
    final isEnglish = localization.locale.languageCode == 'en';

    return Scaffold(
      appBar: AppBar(
        title: Text(localization.translate('privacyPolicyTitle')),
        backgroundColor: theme.colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localization.translate('lastUpdated'),
                style: theme.textTheme.bodySmall,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: isEnglish
                      ? _buildEnglishContent(theme)
                      : _buildArabicContent(theme),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEnglishContent(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Privacy Policy',
          style: theme.textTheme.headlineMedium,
        ),
        const SizedBox(height: 16),
        Text(
          'Our Commitment to Privacy',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'We respect your privacy and are committed to protecting your personal data. This privacy policy explains how we handle your information when you use our QR Scanner app.',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text(
          'Information We Collect',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'The QR Scanner app collects the following information:',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '• Camera access: Required only to scan QR codes.',
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                '• QR scan history: Stored locally on your device to provide scan history functionality.',
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                '• App preferences: Such as language and theme settings.',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'How We Use Your Information',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'We use the collected information for the following purposes:',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '• To enable QR code scanning functionality.',
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                '• To provide history of your scanned QR codes.',
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                '• To save your app preferences.',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Data Storage and Security',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'All data collected by the QR Scanner app is stored locally on your device. We do not transmit, store, or process your data on external servers. Your scan history and preferences remain on your device until you choose to clear them or uninstall the app.',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text(
          'Third-Party Services',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'Our app may contain links to third-party websites when you scan certain QR codes. This privacy policy only applies to our app. Once you use such links to leave our app, you should note that we do not have any control over those websites. Therefore, we cannot be responsible for the protection and privacy of any information that you provide while visiting such sites.',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text(
          'Your Rights',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'You have the right to:',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '• Clear your scan history at any time through the app settings.',
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                '• Control camera permissions through your device settings.',
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                '• Uninstall the app to remove all locally stored data.',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Changes to This Privacy Policy',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the "Last Updated" date.',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text(
          'Contact Us',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'If you have any questions about this Privacy Policy, please contact us at support@qrscanner.app',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildArabicContent(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'سياسة الخصوصية',
          style: theme.textTheme.headlineMedium,
        ),
        const SizedBox(height: 16),
        Text(
          'التزامنا بالخصوصية',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'نحن نحترم خصوصيتك ونلتزم بحماية بياناتك الشخصية. توضح سياسة الخصوصية هذه كيفية تعاملنا مع معلوماتك عند استخدام تطبيق ماسح رمز الاستجابة السريعة.',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text(
          'المعلومات التي نجمعها',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'يجمع تطبيق ماسح رمز الاستجابة السريعة المعلومات التالية:',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '• الوصول إلى الكاميرا: مطلوب فقط لمسح رموز الاستجابة السريعة.',
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                '• سجل المسح: يتم تخزينه محليًا على جهازك لتوفير وظيفة سجل المسح.',
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                '• تفضيلات التطبيق: مثل إعدادات اللغة والمظهر.',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'كيف نستخدم معلوماتك',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'نستخدم المعلومات التي تم جمعها للأغراض التالية:',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '• لتمكين وظيفة مسح رمز الاستجابة السريعة.',
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                '• لتوفير سجل لرموز الاستجابة السريعة التي قمت بمسحها.',
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                '• لحفظ تفضيلات التطبيق الخاصة بك.',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'تخزين البيانات وأمنها',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'يتم تخزين جميع البيانات التي يجمعها تطبيق ماسح رمز الاستجابة السريعة محليًا على جهازك. نحن لا ننقل أو نخزن أو نعالج بياناتك على خوادم خارجية. يبقى سجل المسح والتفضيلات الخاصة بك على جهازك حتى تختار مسحها أو إلغاء تثبيت التطبيق.',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text(
          'خدمات الطرف الثالث',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'قد يحتوي تطبيقنا على روابط لمواقع ويب تابعة لجهات خارجية عند مسح رموز الاستجابة السريعة المعينة. تنطبق سياسة الخصوصية هذه فقط على تطبيقنا. بمجرد استخدام هذه الروابط لمغادرة تطبيقنا، يجب أن تلاحظ أنه ليس لدينا أي سيطرة على تلك المواقع. لذلك، لا يمكننا أن نكون مسؤولين عن حماية وخصوصية أي معلومات تقدمها أثناء زيارة هذه المواقع.',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text(
          'حقوقك',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'لديك الحق في:',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '• مسح سجل المسح في أي وقت من خلال إعدادات التطبيق.',
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                '• التحكم في أذونات الكاميرا من خلال إعدادات جهازك.',
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                '• إلغاء تثبيت التطبيق لإزالة جميع البيانات المخزنة محليًا.',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'التغييرات في سياسة الخصوصية هذه',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'قد نقوم بتحديث سياسة الخصوصية الخاصة بنا من وقت لآخر. سنخطرك بأي تغييرات من خلال نشر سياسة الخصوصية الجديدة على هذه الصفحة وتحديث تاريخ "آخر تحديث".',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text(
          'اتصل بنا',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'إذا كان لديك أي أسئلة حول سياسة الخصوصية هذه، يرجى الاتصال بنا على support@qrscanner.app',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
