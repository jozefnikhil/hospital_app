import 'package:amrita_treatment/domain/register%20patient/treatmentlist/treatmentlist.dart';

abstract class ITreatmentlist {
  Future<Treatmentlist?> getTreatmentlist();
}
