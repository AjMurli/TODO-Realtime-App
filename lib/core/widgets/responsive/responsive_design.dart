part of '../widgets_imports.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({super.key, required this.desktop, required this.tablet, required this.mobile});

  final Widget desktop;
  final Widget tablet;
  final Widget mobile;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if(constraints.maxWidth >= Sizes.desktopScreenSize) {
          return desktop;
        }else if(constraints.maxWidth < Sizes.desktopScreenSize && constraints.maxWidth >= Sizes.tabletScreenSize) {
          return tablet;
        }else{
          return mobile;
        }
      },
    );
  }
}
