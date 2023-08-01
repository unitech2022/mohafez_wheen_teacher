part of 'table_cubit.dart';

class TableState extends Equatable {
  final RequestState? getTablesState;
  final TableResponse? tablesResponse;

  final List<TableModel> tables;
  final RequestState? addMeetState;
  final String? day, fromHour, toHour;
  final String? date;
  final String? currentCategory;
  final RequestState? updateStatusState;
  const TableState({
    this.addMeetState,
    this.day,
    this.fromHour,
    this.toHour,
    this.date,
    this.getTablesState,
    this.tablesResponse,
   
    this.currentCategory,
    this.tables = const [],
    this.updateStatusState,
  });

  TableState copyWith(
      {final RequestState? addMeetState,
      final String? day,
      fromHour,
      toHour,
      final String? date,
      final RequestState? getTablesState,
      final String? currentCategory,
      final List<TableModel>? tables,
      final RequestState? updateStatusState,
       final Map<int, int>? statuses,
      final TableResponse? tablesResponse}) {
    return TableState(
      addMeetState: addMeetState ?? this.addMeetState,
      day: day ?? this.day,
      fromHour: fromHour ?? this.fromHour,
      toHour: toHour ?? this.toHour,
      date: date ?? this.date,
      getTablesState: getTablesState ?? this.getTablesState,
      tablesResponse: tablesResponse ?? this.tablesResponse,
      currentCategory: currentCategory ?? this.currentCategory,
      tables: tables ?? this.tables,
      updateStatusState: updateStatusState ?? this.updateStatusState,
       
    );
  }

  @override
  List<Object?> get props => [
        addMeetState,
        day,
        fromHour,
        toHour,
        date,
        getTablesState,
        tablesResponse,
        currentCategory,
        tables,
        updateStatusState,
      
      ];
}
