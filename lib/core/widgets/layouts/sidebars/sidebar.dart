part of '../../widgets_imports.dart';

class MySideBar extends StatelessWidget {
  const MySideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(right: BorderSide(color: AppColors.grey, width: 1))
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(AppAssets.appLogo, width: 100, height: 100, fit: BoxFit.cover),
              const SizedBox(height: Sizes.spaceBtwSections),

              Padding(
                padding: const EdgeInsets.all(Sizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("MENU", style: Theme.of(context).textTheme.bodySmall!.apply(letterSpacingDelta: 1.2)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
