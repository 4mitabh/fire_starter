import 'package:fire_starter/fire_starter.dart';

class FirebasePaths {
  static final prefix = FireStarter.settings['firestore']?['prefix'] ?? '';
  static final users = '/users';
  static final metadata = '/metadata';
}
