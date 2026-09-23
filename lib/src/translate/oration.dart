const emptyOration = Oration('');

class Oration {
  final String message;
  final List<String> parts;

  const new(this.message, [this.parts = const []]);

  @override
  String toString() {
    if (parts.isEmpty) return message;

    final buffer = StringBuffer();
    var partIndex = 0;

    for (var i = 0; i < message.length; i++) {
      final codeUnit = message.codeUnitAt(i);

      if (codeUnit == 0x25 && partIndex < parts.length) {
        buffer.write(parts[partIndex++]);
      } else {
        buffer.writeCharCode(codeUnit);
      }
    }

    return buffer.toString();
  }
}
