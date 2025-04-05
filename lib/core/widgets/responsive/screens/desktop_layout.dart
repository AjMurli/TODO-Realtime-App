part of '../../widgets_imports.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, this.body});

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(child: MySideBar()),
          Expanded(
            flex: 5,
              child: Column(
                children: [
                  // header
                 const Header(),
                  // body
                  Expanded(
                    child:  body ?? const SizedBox(),
                  )
                ],
              )
          ),
        ],
      ),
    );
  }
}
