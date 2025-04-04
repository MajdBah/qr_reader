import 'package:flutter/material.dart';
import 'package:new_qr_reader/services/localization_service.dart';

class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = LocalizationService.of(context);
    final theme = Theme.of(context);
    final isEnglish = localization.locale.languageCode == 'en';

    return Scaffold(
      appBar: AppBar(
        title: Text(localization.translate('termsOfUseTitle')),
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
          'Terms of Use',
          style: theme.textTheme.headlineMedium,
        ),
        const SizedBox(height: 16),
        Text(
          'Introduction',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'These Terms of Use govern your use of the QR Scanner application provided by us. By using the QR Scanner app, you agree to these terms. If you disagree with any part of the terms, you may not use our application.',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text(
          'License',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'We grant you a limited, non-exclusive, non-transferable, revocable license to use the QR Scanner app for your personal, non-commercial purposes. You may not:',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '• Copy, modify, or distribute the application for any purpose.',
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                '• Attempt to decompile or reverse engineer any part of the QR Scanner app.',
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                '• Remove any copyright or other proprietary notations from the application.',
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                '• Transfer the application to another person or "mirror" it on any other server.',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'User Content',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'Our QR Scanner app allows you to scan QR codes and save them locally. You are solely responsible for any content that you access, save, or share through our application. By using our service, you warrant that:',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '• You will not use the app to access, save, or share any illegal, harmful, threatening, or objectionable material.',
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                '• You will not use the app to engage in any activity that interferes with or disrupts the services provided by the application.',
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                '• You are fully responsible for the content you access through QR codes.',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Camera and Storage Permissions',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'The QR Scanner app requires camera permission to scan QR codes and storage permission to save your scan history. By using this app, you grant us the necessary permissions to provide these services. You can revoke these permissions at any time through your device settings.',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text(
          'Third-Party Content',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'Our app may lead you to third-party websites or applications when you scan certain QR codes. We have no control over the content, privacy policies, or practices of any third-party websites or services. You acknowledge and agree that we shall not be responsible or liable for any damage or loss caused by or in connection with use of or reliance on any such content, goods, or services available on or through any such websites or services.',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text(
          'Disclaimer',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'The QR Scanner app is provided "as is" and "as available" without any warranties, either express or implied. We do not warrant that the app will be error-free or uninterrupted. We cannot guarantee that the app will be secure or free from bugs or viruses.',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text(
          'Limitation of Liability',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'In no event shall we be liable for any indirect, incidental, special, consequential or punitive damages, including but not limited to loss of profits, data, use, goodwill, or other intangible losses, resulting from your access to or use of or inability to access or use the application.',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text(
          'Changes to These Terms',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'We may update our Terms of Use from time to time. We will notify you of any changes by posting the new Terms on this page and updating the "Last Updated" date. You are advised to review these Terms periodically for any changes.',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text(
          'Contact Us',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'If you have any questions about these Terms of Use, please contact us at support@qrscanner.app',
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
          'شروط الاستخدام',
          style: theme.textTheme.headlineMedium,
        ),
        const SizedBox(height: 16),
        Text(
          'مقدمة',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'تحكم شروط الاستخدام هذه استخدامك لتطبيق ماسح رمز الاستجابة السريعة الذي نقدمه. باستخدام تطبيق ماسح رمز الاستجابة السريعة، فإنك توافق على هذه الشروط. إذا كنت لا توافق على أي جزء من الشروط، فقد لا تستخدم تطبيقنا.',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text(
          'الترخيص',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'نمنحك ترخيصًا محدودًا وغير حصري وغير قابل للتحويل وقابل للإلغاء لاستخدام تطبيق ماسح رمز الاستجابة السريعة لأغراضك الشخصية غير التجارية. لا يجوز لك:',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '• نسخ أو تعديل أو توزيع التطبيق لأي غرض.',
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                '• محاولة فك تجميع أو إعادة هندسة أي جزء من تطبيق ماسح رمز الاستجابة السريعة.',
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                '• إزالة أي حقوق طبع ونشر أو أي إشعارات ملكية أخرى من التطبيق.',
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                '• نقل التطبيق إلى شخص آخر أو "نسخه" على أي خادم آخر.',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'محتوى المستخدم',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'يتيح لك تطبيق ماسح رمز الاستجابة السريعة مسح رموز الاستجابة السريعة وحفظها محليًا. أنت وحدك المسؤول عن أي محتوى تصل إليه أو تحفظه أو تشاركه من خلال تطبيقنا. باستخدام خدمتنا، فإنك تضمن أنك:',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '• لن تستخدم التطبيق للوصول إلى أي مواد غير قانونية أو ضارة أو تهديدية أو غير مرغوب فيها أو حفظها أو مشاركتها.',
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                '• لن تستخدم التطبيق للمشاركة في أي نشاط يتداخل مع الخدمات التي يقدمها التطبيق أو يعطلها.',
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                '• أنت مسؤول تمامًا عن المحتوى الذي تصل إليه من خلال رموز الاستجابة السريعة.',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'أذونات الكاميرا والتخزين',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'يتطلب تطبيق ماسح رمز الاستجابة السريعة إذن الكاميرا لمسح رموز الاستجابة السريعة وإذن التخزين لحفظ سجل المسح الخاص بك. باستخدام هذا التطبيق، فإنك تمنحنا الأذونات اللازمة لتقديم هذه الخدمات. يمكنك إلغاء هذه الأذونات في أي وقت من خلال إعدادات جهازك.',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text(
          'محتوى الطرف الثالث',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'قد يؤدي تطبيقنا إلى مواقع ويب أو تطبيقات تابعة لجهات خارجية عند مسح رموز الاستجابة السريعة المعينة. ليس لدينا سيطرة على المحتوى أو سياسات الخصوصية أو ممارسات أي مواقع ويب أو خدمات تابعة لجهات خارجية. أنت تقر وتوافق على أننا لن نكون مسؤولين أو ملزمين عن أي ضرر أو خسارة ناتجة عن أو فيما يتعلق باستخدام أو الاعتماد على أي محتوى أو سلع أو خدمات متاحة على أو من خلال أي مواقع ويب أو خدمات من هذا القبيل.',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text(
          'إخلاء المسؤولية',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'يتم توفير تطبيق ماسح رمز الاستجابة السريعة "كما هو" و"كما هو متاح" دون أي ضمانات، سواء كانت صريحة أو ضمنية. نحن لا نضمن أن التطبيق سيكون خاليًا من الأخطاء أو دون انقطاع. لا يمكننا ضمان أن التطبيق سيكون آمنًا أو خاليًا من الأخطاء أو الفيروسات.',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text(
          'حدود المسؤولية',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'لن نكون مسؤولين بأي حال من الأحوال عن أي أضرار غير مباشرة أو عرضية أو خاصة أو تبعية أو عقابية، بما في ذلك على سبيل المثال لا الحصر فقدان الأرباح أو البيانات أو الاستخدام أو النية الحسنة أو غيرها من الخسائر غير الملموسة، الناتجة عن وصولك إلى أو استخدامك أو عدم قدرتك على الوصول إلى التطبيق أو استخدامه.',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text(
          'التغييرات في هذه الشروط',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'قد نقوم بتحديث شروط الاستخدام الخاصة بنا من وقت لآخر. سنخطرك بأي تغييرات من خلال نشر الشروط الجديدة على هذه الصفحة وتحديث تاريخ "آخر تحديث". ننصحك بمراجعة هذه الشروط بشكل دوري لأي تغييرات.',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        Text(
          'اتصل بنا',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'إذا كان لديك أي أسئلة حول شروط الاستخدام هذه، يرجى الاتصال بنا على support@qrscanner.app',
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
