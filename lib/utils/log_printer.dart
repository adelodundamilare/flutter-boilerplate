import 'package:logger/logger.dart';

class GrigoraLogPrinter extends LogPrinter {
  final String className;
  GrigoraLogPrinter(this.className);

  @override
  List<String> log(LogEvent event) {
    var color = PrettyPrinter.levelColors[event.level];
    var emoji = PrettyPrinter.levelEmojis[event.level];
    return [color!('$emoji $className - ${event.message}')];
  }

  // List<String*>* Function(LogEvent*)*
}

Logger getLogger(String className) {
  return Logger(printer: GrigoraLogPrinter(className));
}
