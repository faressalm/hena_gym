import 'dart:convert';

import 'package:logger/logger.dart';

class ApplicationLogger {
  static Logger getLogger(String className) => Logger(
        printer: PrefixPrinter(
          ApplicationLogPrinter(
            className: className,  
            colors: false,
          ),
        ),
      );
}

class ApplicationLogPrinter extends LogPrinter {
  final String _className;
  final bool colors;

  ApplicationLogPrinter({required String className, this.colors = true})
      : _className = className;

  static final levelColors = {
    Level.verbose: AnsiColor.fg(AnsiColor.grey(0.5)),
    Level.debug: AnsiColor.none(),
    Level.info: AnsiColor.fg(12),
    Level.warning: AnsiColor.fg(208),
    Level.error: AnsiColor.fg(196),
    Level.wtf: AnsiColor.fg(199),
  };

  static final levelEmojis = {
    Level.verbose: 'ℹ',
    Level.debug: '🐛 ',
    Level.info: '💡 ',
    Level.warning: '⚠️ ',
    Level.error: '⛔ ',
    Level.wtf: '👾 ',
  };

  @override
  List<String> log(LogEvent event) {
    var messageStr = _stringifyMessage(event.message);
    var errorStr = event.error != null ? '  ERROR: ${event.error}' : '';
    return ['${_labelFor(event.level)} [$_className] - $messageStr$errorStr'];
  }

  String _labelFor(Level level) {
    var color = levelColors[level];
    var emoji = levelEmojis[level];

    String finalLabel = emoji!;

    return colors ? color!(finalLabel) : finalLabel;
  }

  String _stringifyMessage(dynamic message) {
    if (message is Map || message is Iterable) {
      var encoder = const JsonEncoder.withIndent(null);
      return encoder.convert(message);
    } else {
      return message.toString();
    }
  }
}
