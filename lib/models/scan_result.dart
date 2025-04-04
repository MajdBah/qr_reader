class ScanResult {
  final String content;
  final DateTime timestamp;
  final bool isUrl;

  ScanResult({
    required this.content,
    required this.timestamp,
    required this.isUrl,
  });

  factory ScanResult.fromJson(Map<String, dynamic> json) {
    return ScanResult(
      content: json['content'],
      timestamp: DateTime.parse(json['timestamp']),
      isUrl: json['isUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'timestamp': timestamp.toIso8601String(),
      'isUrl': isUrl,
    };
  }

  bool get isWebUrl {
    if (!isUrl) return false;
    return content.startsWith('http://') || content.startsWith('https://');
  }
}
