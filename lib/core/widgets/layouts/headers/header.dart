part of '../../widgets_imports.dart';

class Header extends StatelessWidget implements PreferredSizeWidget{
  const Header({super.key, this.scaffoldKey});

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.md, vertical: Sizes.sm),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(bottom: BorderSide(color: AppColors.grey, width: 1)),
      ),
      child: AppBar(
        leading: DeviceUtility.isDesktopScreen(context) ? null : IconButton(onPressed: ()=> scaffoldKey?.currentState?.openDrawer(), icon: const Icon(Iconsax.menu)),
        title: DeviceUtility.isDesktopScreen(context) ? SizedBox(
          width: 400,
          child: TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.search_normal),
              hintText: 'Search Anything...'
            ),
          ),
        ): null,
        actions: [
          // Search
          if(!DeviceUtility.isDesktopScreen(context)) IconButton(onPressed: () {}, icon: const Icon(Iconsax.search_normal)),
          IconButton(onPressed: () {}, icon: const Icon(Iconsax.notification)),
          const SizedBox(width:  Sizes.spaceBtwItems / 2 ,),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(DeviceUtility.getAppBarHeight() + 15);

}


