part of '../login_imports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), (){
      if(AuthRepository().isUserLoggedIn()) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const TasksScreen()));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Image.asset(
          AppAssets.appLogo,
          width: DeviceUtility.screenWidth(context) * 0.7,
        ),
      ),
    );
  }
}
