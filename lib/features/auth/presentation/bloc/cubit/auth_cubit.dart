import 'package:medical_app/global_widget/export.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final passwordController = TextEditingController();

  login() async {
    emit(AuthLoading());
    await Future.delayed(Duration(seconds: 4));
    emit(AuthLoginState());
  }
}
