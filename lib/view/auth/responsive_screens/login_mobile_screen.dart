part of '../login_imports.dart';
class LoginMobileScreen extends StatelessWidget {
  const LoginMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.read<AuthViewModel>();

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.md),
            child: Form(
              key: context.read<AuthViewModel>().loginFormKey,
              child: Column(
                children: [
                  Image.asset(AppAssets.appLogo, width: 100),
                  Text(AppString.signUp, style: const TextStyle(fontSize: Sizes.fontSizeLg, fontWeight: FontWeight.w500)),
                  const SizedBox(height: Sizes.md),
                  customTextFormField(
                    controller: authViewModel.emailIdController,
                    labelText: AppString.enterEmailID,
                    prefixIcon: const Icon(Iconsax.message, size: 17,),
                    validator: (value) => Formatter().validateField(value, type: 'email'),
                  ),
                  const SizedBox(height: Sizes.md,),
                  customTextFormField(
                    controller: authViewModel.passwordController,
                    labelText: AppString.createPassword,
                    prefixIcon: const Icon(Iconsax.password_check, size: 17,),
                    maxLength: 6,
                    validator: (value) => Formatter().validateField(value, type: 'password'),
                  ),
                  SizedBox(
                    width: DeviceUtility.screenWidth(context) * 0.5,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(color: AppColors.grey)
                          )
                      ),
                      onPressed: () async {
                        if(authViewModel.loginFormKey.currentState!.validate()) {
                          authViewModel.registerUser(context);
                        }else{
                          log('Invalid Details');
                        }
                      },
                      icon: const Icon(Iconsax.login),
                      label: context.watch<AuthViewModel>().isLoading ? const SizedBox(
                          height: 15,
                          width: 15,
                          child: CircularProgressIndicator()
                      ) : Text(AppString.signUpNow),
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
