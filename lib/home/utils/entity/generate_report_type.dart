import 'package:equatable/equatable.dart';

sealed class GenerateReportType extends Equatable {
  @override
  List<Object?> get props => [];
}

class GenerateReportForNRows extends GenerateReportType {
  GenerateReportForNRows({
    required this.numberOfRows,
  });

  final int numberOfRows;

  @override
  List<Object?> get props => super.props..add(numberOfRows);
}

class GenerateReportForSelectedRows extends GenerateReportType {}
