import 'package:get/get.dart';
import 'package:citelis/repository/auth_repository.dart';

class HomeSignInController extends GetxController {
  final _authRepository = Get.find<AuthRepository>();

  final error = Rx<String?>(null);

  final isLoading = RxBool(false);

  Future<void> _signIn(Future<AuthUser?> auxUser) async {
    try {
      isLoading.value = true;
      error.value = null;
      await auxUser;
    } catch (e) {
      error.value = e.toString();
    }
    isLoading.value = false;
  }

  Future<void> signInWithGoogle() =>
      _signIn(_authRepository.signInWithGoogle());
}
