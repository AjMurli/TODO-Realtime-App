part of 'login_imports.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SiteTemplate(
      userLayout: false,
      desktop: LoginDesktopScreen(),
      tablet: LoginMobileScreen(),
      mobile: LoginMobileScreen(),
    );
  }
}
