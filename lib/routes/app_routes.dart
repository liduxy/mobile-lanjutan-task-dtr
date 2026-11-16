import 'package:get/get.dart';
import '../views/login_page.dart';
import '../views/register_page.dart';
import '../views/dashboard_page.dart';
import '../binding/dashboard.dart'; // Import binding-nya
import '../binding/dashboard_binding.dart'; // Import binding-nya

class AppRoutes {
  static const login = '/login';
  static const register = '/register';
  static const dashboard = '/dashboard';

  static final pages = [
    GetPage(
      name: login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: register,
      page: () => const RegisterPage(),
    ),
    GetPage(
      name: dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(), // Tambahkan baris ini
    ),
  ];
}