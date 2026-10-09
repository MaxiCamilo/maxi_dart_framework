import 'package:maxi_dart_framework/maxi_dart_framework.dart';

class TableResult extends Iterable<Map<String, dynamic>> {
  final List<String> columnsName;

  final List<Map<String, dynamic>> _values;

  @override
  int get length => _values.length;

  @override
  bool get isEmpty => _values.isEmpty;

  @override
  bool get isNotEmpty => _values.isNotEmpty;

  //TableResult._({required this.columnsName, required List<Map<String, dynamic>> values}) : _values = values;

  TableResult.empty() : columnsName = [], _values = [];
  TableResult.withColumns({required this.columnsName}) : _values = [];
  TableResult.withMap({required Map<String, dynamic> values}) : columnsName = values.keys.toList(), _values = [values];

  static Result<TableResult> withColumnsAndValues({required List<String> columnsName, required List<Map<String, dynamic>> values}) => resultScopeValue(() {
    final newTable = TableResult.withColumns(columnsName: columnsName);

    for (final row in values) {
      newTable.addRow(row).$;
    }

    return newTable;
  });

  @override
  Iterator<Map<String, dynamic>> get iterator => _values.iterator;

  Result<Map<String, dynamic>> getRow(int index) {
    if (index < 0 || index >= _values.length) {
      return Result.error('The table does not contain an element positioned at %1', [index.toString()]);
    }
    return Result.value(_values[index]);
  }

  int? getColumnPositionByName({required String columnName, bool caseSensitivity = true}) {
    int i = 0;
    for (final x in columnsName) {
      if (columnName == x || (!caseSensitivity && columnName.toLowerCase() == x.toLowerCase())) {
        return i;
      }
      i += 1;
    }

    return null;
  }

  Result<List<dynamic>> getColumnByName({required String columnName, bool caseSensitivity = true}) {
    final position = getColumnPositionByName(columnName: columnName, caseSensitivity: caseSensitivity);
    if (position == null) {
      return Result.error('The table does not contain the column %1', [columnName]);
    }

    return Result.value(_values.map((row) => row[columnName]).toList());
  }

  Result<int> addRow(Map<String, dynamic> row) {
    for (final column in columnsName) {
      if (!row.containsKey(column)) {
        return Result.error('The row does not contain the column %1', [column]);
      }
    }

    _values.add(row);
    return Result.value(_values.length - 1);
  }

  Result getValueByPosition({required int positionColumn, required int positionValue}) {
    if (positionValue < 0 || positionValue >= _values.length) {
      return Result.error('The table does not contain an element positioned at %1', [positionValue.toString()]);
    }

    if (positionColumn < 0 || positionColumn >= columnsName.length) {
      return Result.error('The table does not contain a column positioned at %1', [positionColumn.toString()]);
    }

    final columnName = columnsName[positionColumn];
    final row = _values[positionValue];
    return Result.value(row[columnName]);
  }

  Result getValueByName({required String columnName, required int positionValue, bool caseSensitivity = true}) {
    final positionColumn = getColumnPositionByName(columnName: columnName, caseSensitivity: caseSensitivity);
    if (positionColumn == null) {
      return Result.error('The table does not contain the column %1', [columnName]);
    }

    return getValueByPosition(positionColumn: positionColumn, positionValue: positionValue);
  }

  void clean() {
    _values.clear();
  }

  void removeRow({required int position}) {
    if (position < 0 || position >= length) {
      return;
    }

    _values.removeAt(position);
  }

  void removeColumn({required String columnName, bool caseSensitivity = true}) {
    final position = getColumnPositionByName(columnName: columnName, caseSensitivity: caseSensitivity);
    if (position == null) {
      return;
    }

    columnsName.removeAt(position);
    for (final row in _values) {
      row.remove(columnName);
    }
  }

  Result<void> changeRow({required int position, required Map<String, dynamic> newValues, bool caseSensitivity = true, bool ignoreNonExistentColumns = true}) {
    if (position < 0 || position >= length) {
      return Result.error('The table does not contain an element positioned at %1', [position.toString()]);
    }

    final row = _values[position];
    for (final column in columnsName) {
      final key = caseSensitivity ? column : newValues.keys.firstWhere((k) => k.toLowerCase() == column.toLowerCase(), orElse: () => '');
      if (key.isNotEmpty && newValues.containsKey(key)) {
        row[column] = newValues[key];
      } else if (!ignoreNonExistentColumns) {
        return Result.error('The new values do not contain the column %1', [column]);
      }
    }

    return voidResult;
  }

  List obtainFirstColumn() {
    if (columnsName.isEmpty) {
      return [];
    }

    final firstColumnName = columnsName.first;
    return _values.map((row) => row[firstColumnName]).toList();
  }

  Result<double> obtainFirstNumber() {
    if (_values.isEmpty || _values.first.isEmpty) {
      return Result.value(0);
    }

    final value = _values.first.values.first;
    if (value is num) {
      return Result.value(value.toDouble());
    } else if (value == null) {
      return Result.value(0);
    } else {
      return Result.error('The first value in the table is not a number');
    }
  }
}
