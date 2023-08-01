import 'dart:convert';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohafez_elwaheen_teacher/core/api_constatns.dart';
import 'package:mohafez_elwaheen_teacher/core/app_model.dart';
import 'package:mohafez_elwaheen_teacher/persintaion/ui/tabels_screen/tabels_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import '../../core/enums.dart';
import 'package:http/http.dart' as http;

import '../../core/helpers/helper_functions.dart';
import '../../models/table_model.dart';
import '../../models/teacher_model.dart';
part 'table_state.dart';

class TableCubit extends Cubit<TableState> {
  TableCubit() : super(const TableState());
  static TableCubit get(context) => BlocProvider.of<TableCubit>(context);
  final Map<int, int> statuses = {};
  changeSelectData(type, value) {
    if (type == 1) {
      emit(state.copyWith(date: value));
    } else if (type == 2) {
      emit(state.copyWith(day: value));
    } else if (type == 3) {
      emit(state.copyWith(fromHour: value));
    } else {
      emit(state.copyWith(toHour: value));
    }
  }

  Future addMeet({context, from, to, day, date, link, note}) async {
    emit(state.copyWith(addMeetState: RequestState.loading));
    var request = http.MultipartRequest(
        'POST', Uri.parse('${ApiConstants.baseUrl}/table/add-table'));
    request.fields.addAll({
      'UserId': currentUser.id!,
      'FromHours': from,
      'ToHours': to,
      'Link': link,
      'Note': note,
      'Today': day,
      'DateToday': date
    });

    http.StreamedResponse response = await request.send();

    if (kDebugMode) {
      print("${response.statusCode}===========> addMeet");
    }
    if (response.statusCode == 200) {
      pushPageTransition(
          context: context,
          page: const TablesScreen(),
          type: PageTransitionType.rightToLeft);
      showTopMessage(
          context: context,
          customBar: const CustomSnackBar.success(
            backgroundColor: Colors.green,
            message: "تم الانشاء بنجاح",
            textStyle: TextStyle(
                fontFamily: "font", fontSize: 16, color: Colors.white),
          ));

      emit(state.copyWith(addMeetState: RequestState.loaded));
    } else {
      emit(state.copyWith(addMeetState: RequestState.error));
    }
  }

  Future getTables({context, type = 0}) async {
    if (type == 0) emit(state.copyWith(getTablesState: RequestState.loading));
    var request = http.MultipartRequest(
        'GET',
        Uri.parse(
            '${ApiConstants.baseUrl}/table/get-tables?teacherId=${currentUser.id}'));

    http.StreamedResponse response = await request.send();

    if (kDebugMode) {
      print("${response.statusCode}==============> getTables");
    }
    if (response.statusCode == 200) {
      String jsonDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonDataString);
      TableResponse tableModel = TableResponse.fromJson(jsonData);
      // Map<int, int> mapStatus = {};
      tableModel.teachers!.forEach((element) {
        if (element.status == 0) {
          statuses.addAll({element.id!: element.id!});
        }
      });
      if (type == 0) {
        emit(state.copyWith(
            getTablesState: RequestState.loaded,
            tablesResponse: tableModel,
            tables: tableModel.teachers));
      }
    } else {
      if (type == 0) emit(state.copyWith(getTablesState: RequestState.error));
    }
  }

  String? currentCategory;
  changeDropDate({value}) {
    emit(state.copyWith(currentCategory: value));
  }

  List<TableModel> tables = [];
  filterList({value, list}) {
    tables = [];
    tables = list.where((i) => i.dateToday!.split("T")[0] == value).toList();

    emit(state.copyWith(tables: tables));
  }


  changeSwishValue(tableId) {
    statuses.containsValue(tableId)
        ? statuses.remove(tableId)
        : statuses.addAll({tableId: tableId});
  }

  Future updateStatusTable({tableId, status, context}) async {
    changeSwishValue(tableId);
    emit(state.copyWith(updateStatusState: RequestState.loading));
    var request = http.MultipartRequest(
        'POST', Uri.parse('${ApiConstants.baseUrl}/table/change-status-table'));
    request.fields
        .addAll({'status': status.toString(), 'tableId': tableId.toString()});

    http.StreamedResponse response = await request.send();
    if (kDebugMode) {
      print("${response.statusCode} ============>updateStatusTable");
    }
    if (response.statusCode == 200) {
      getTables(context: context, type: 1);
      emit(state.copyWith(updateStatusState: RequestState.loaded));
    } else {
      emit(state.copyWith(updateStatusState: RequestState.error));
    }
  }
}
