import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/scan_result.dart';
import '../providers/scan_history_provider.dart';
import '../services/localization_service.dart';
import '../utils/url_utils.dart';
import 'result_screen.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = LocalizationService.of(context);
    final historyProvider = Provider.of<ScanHistoryProvider>(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localization.translate('scanHistory')),
        centerTitle: true,
        backgroundColor: theme.colorScheme.inversePrimary,
        actions: [
          if (historyProvider.history.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep),
              tooltip: localization.translate('clearHistory'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(localization.translate('clearHistory')),
                      content:
                          Text(localization.translate('clearHistoryConfirm')),
                      actions: [
                        TextButton(
                          child: Text(localization.translate('cancel')),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text(localization.translate('clear')),
                          onPressed: () {
                            historyProvider.clearHistory();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
        ],
      ),
      body: historyProvider.history.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.history,
                    size: 80,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    localization.translate('noHistory'),
                    style: theme.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    localization.translate('scanQrToSeeHistory'),
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: historyProvider.history.length,
              itemBuilder: (context, index) {
                final item = historyProvider.history[index];
                return Dismissible(
                  key: Key(
                      'history-item-${item.timestamp.millisecondsSinceEpoch}'),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 16),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    historyProvider.removeScan(index);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(localization.translate('itemRemoved')),
                        action: SnackBarAction(
                          label: localization.translate('undo'),
                          onPressed: () {},
                        ),
                      ),
                    );
                  },
                  child: _buildHistoryItem(context, item),
                );
              },
            ),
    );
  }

  Widget _buildHistoryItem(BuildContext context, ScanResult item) {
    final theme = Theme.of(context);

    IconData iconData = Icons.text_snippet;
    if (item.isWebUrl) {
      iconData = Icons.link;
    } else if (item.isUrl) {
      iconData = Icons.qr_code;
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
          child: Icon(
            iconData,
            color: theme.colorScheme.primary,
          ),
        ),
        title: Text(
          item.content,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          _formatDate(item.timestamp),
          style: theme.textTheme.bodySmall,
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(result: item),
            ),
          );
        },
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}
