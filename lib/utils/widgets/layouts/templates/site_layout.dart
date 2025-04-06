part of '../../widgets_imports.dart';

class SiteTemplate extends StatelessWidget {
  const SiteTemplate({super.key, this.desktop, this.tablet, this.mobile, this.userLayout = true});

  final Widget? desktop;
  final Widget? tablet;
  final Widget? mobile;
  final bool userLayout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveWidget(
          desktop: userLayout ? DesktopLayout(body: desktop) : desktop ?? Container(),
          tablet: userLayout ? TabletLayout(body: tablet ?? desktop) : tablet ?? desktop ?? Container(),
          mobile: userLayout ? MobileLayout(body: mobile ?? desktop) : mobile ?? desktop ?? Container(),
      ),
    );
  }
}
