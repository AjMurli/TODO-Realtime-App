part of '../../widgets_imports.dart';

class TabletLayout extends StatelessWidget {
  TabletLayout({super.key, this.body});
  final Widget? body;

  final GlobalKey<ScaffoldState>? scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const MySideBar(),
      appBar: Header(scaffoldKey: scaffoldKey),
      body: body ?? const SizedBox.shrink(),
    );
  }
}
