import 'package:amrita_ayurveda/domain/patientlist/patientlist/patientlist.dart';

abstract class IPatientlist {
  Future<Patientlist?> getPatientList();
}
