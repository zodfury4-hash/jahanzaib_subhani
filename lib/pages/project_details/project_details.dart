import 'package:flutter/material.dart';

import '../../models/project.dart';
import '../project_detail_page.dart';
import 'ai_expense_tracker_detail_page.dart';
import 'chatflow_detail_page.dart';
import 'locki_detail_page.dart';
import 'matrix_pos_detail_page.dart';
import 'notezilla_detail_page.dart';
import 'stitch_and_witch_detail_page.dart';

export 'ai_expense_tracker_detail_page.dart';
export 'chatflow_detail_page.dart';
export 'locki_detail_page.dart';
export 'matrix_pos_detail_page.dart';
export 'notezilla_detail_page.dart';
export 'stitch_and_witch_detail_page.dart';

Widget getProjectDetailPage(Project p) {
  switch (p.title) {
    case 'Ai Expense Tracker':
      return const AiExpenseTrackerDetailPage();
    case 'Stitch&Witch':
      return const StitchAndWitchDetailPage();
    case 'ChatFlow':
      return const ChatFlowDetailPage();
    case 'Locki':
      return const LockiDetailPage();
    case 'NoteZilla':
      return const NoteZillaDetailPage();
    case 'Matrix POS':
      return const MatrixPosDetailPage();
    default:
      return ProjectDetailPage(project: p);
  }
}
