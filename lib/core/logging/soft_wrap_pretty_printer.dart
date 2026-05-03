import 'package:logger/logger.dart';

class SoftWrapPrettyPrinter extends PrettyPrinter {
  static const int _noEmojisLineLengthPadding = 2;
  static const int _emojisLineLengthPadding = 4;
  static final RegExp _anyNewLine = RegExp(r'\r?\n|\r');
  static final RegExp _anyWhiteSpace = RegExp(r'\s');
  final int lineThreshold;

  SoftWrapPrettyPrinter({
    super.stackTraceBeginIndex,
    super.methodCount,
    super.errorMethodCount,
    super.lineLength,
    super.colors,
    super.printEmojis,
    super.dateTimeFormat,
    super.excludeBox,
    super.noBoxingByDefault,
    super.excludePaths,
    super.levelColors,
    super.levelEmojis,
    int? lineThreshold,
  }) : lineThreshold =
           lineThreshold ??
           lineLength -
               (printEmojis
                   ? _emojisLineLengthPadding
                   : _noEmojisLineLengthPadding);

  @override
  List<String> log(LogEvent event) {
    final StringBuffer finalLines = StringBuffer();
    final String fullMessage = stringifyMessage(event.message);
    final List<String> lines = fullMessage.split(_anyNewLine);
    for (final line in lines) {
      final List<String> words = line.split(_anyWhiteSpace);
      final StringBuffer buffer = StringBuffer();
      for (final word in words) {
        if (buffer.isEmpty) {
          buffer.write(word);
        } else if (buffer.length + 1 + word.length <= lineThreshold) {
          buffer
            ..write(' ')
            ..write(word);
        } else {
          appendLine(finalLines, buffer);
          buffer.clear();
          buffer.write(word);
        }
      }
      if (buffer.isNotEmpty) appendLine(finalLines, buffer);
    }
    return super.log(
      LogEvent(
        event.level,
        finalLines.toString(),
        time: event.time,
        error: event.error,
        stackTrace: event.stackTrace,
      ),
    );
  }

  void appendLine(StringBuffer output, StringBuffer line) {
    if (output.isNotEmpty) output.write('\n');
    output.write(line);
  }
}
