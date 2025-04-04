import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import '../services/localization_service.dart';
import '../providers/scan_history_provider.dart';
import '../models/scan_result.dart';
import '../utils/url_utils.dart';
import 'result_screen.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen>
    with SingleTickerProviderStateMixin {
  MobileScannerController? _scannerController;
  bool _hasScanned = false;
  bool _isInitialized = false;
  String _errorMessage = '';
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _initializeScanner();
  }

  Future<void> _initializeScanner() async {
    try {
      _scannerController = MobileScannerController(
        detectionSpeed: DetectionSpeed.normal,
        facing: CameraFacing.back,
        torchEnabled: false,
      );

      setState(() {
        _isInitialized = true;
        _errorMessage = '';
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'فشل في تهيئة الكاميرا: $e';
        _isInitialized = false;
      });
      print('Scanner initialization error: $e');
    }
  }

  @override
  void dispose() {
    _scannerController?.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (_hasScanned) return;
    if (capture.barcodes.isEmpty) return;

    final code = capture.barcodes.first.rawValue ?? '';

    if (code.isEmpty) return;

    setState(() {
      _hasScanned = true;
    });

    final isUrl = UrlUtils.isUrl(code);

    final scanResult = ScanResult(
      content: code,
      timestamp: DateTime.now(),
      isUrl: isUrl,
    );

    Provider.of<ScanHistoryProvider>(context, listen: false)
        .addScan(scanResult);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          result: scanResult,
        ),
      ),
    ).then((_) {
      if (mounted) {
        setState(() {
          _hasScanned = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final localization = LocalizationService.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localization.translate('scanQrCode')),
        centerTitle: true,
        backgroundColor: theme.colorScheme.inversePrimary,
      ),
      body: _buildBody(theme, localization),
    );
  }

  Widget _buildBody(ThemeData theme, LocalizationService localization) {
    if (_errorMessage.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 60,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              _errorMessage,
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _initializeScanner,
              icon: const Icon(Icons.refresh),
              label: Text(localization.translate('retry')),
            ),
          ],
        ),
      );
    }

    if (!_isInitialized) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'جاري تهيئة الكاميرا...',
              style: theme.textTheme.titleMedium,
            ),
          ],
        ),
      );
    }

    return Stack(
      children: [
        MobileScanner(
          controller: _scannerController!,
          onDetect: _onDetect,
          errorBuilder: (context, error, child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 60,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'خطأ في الكاميرا: ${error.errorCode == MobileScannerErrorCode.permissionDenied ? localization.translate('cameraPermission') : error.errorDetails}',
                    style: theme.textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: _initializeScanner,
                    icon: const Icon(Icons.refresh),
                    label: Text(localization.translate('retry')),
                  ),
                ],
              ),
            );
          },
        ),
        Center(
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              border: Border.all(
                color: theme.colorScheme.primary,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Opacity(
              opacity: 0.5,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          theme.colorScheme.primary.withOpacity(0.0),
                          theme.colorScheme.primary
                              .withOpacity(0.5 * _animationController.value),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  _scannerController?.toggleTorch();
                },
                tooltip: 'Toggle Flash',
                child: ValueListenableBuilder(
                  valueListenable: _scannerController?.torchState ??
                      ValueNotifier(TorchState.off),
                  builder: (context, state, child) {
                    switch (state as TorchState) {
                      case TorchState.on:
                        return const Icon(Icons.flash_on);
                      case TorchState.off:
                        return const Icon(Icons.flash_off);
                    }
                  },
                ),
              ),
              const SizedBox(width: 20),
              FloatingActionButton(
                onPressed: () {
                  _scannerController?.switchCamera();
                },
                tooltip: 'Switch Camera',
                child: const Icon(Icons.cameraswitch),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
