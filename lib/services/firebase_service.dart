import 'package:firebase_core/firebase_core.dart';
import 'package:tripy_ev_stable/firebase_options.dart';
import 'package:tripy_ev_stable/services/base_service.dart';

class FirebaseService implements BaseService {
  @override
  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
