import 'package:amrita_treatment/domain/register%20patient/branchlist/branchlist.dart';

abstract class IBranchlist {
  Future<Branchlist?> getBranchList();
}
