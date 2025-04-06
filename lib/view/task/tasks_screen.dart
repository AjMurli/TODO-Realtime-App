part of 'tasks_screen_imports.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SiteTemplate(
      userLayout: false,
      mobile: TasksMobileScreen(),
      tablet: TasksMobileScreen(),
      desktop: TasksDesktopScreen(),
    );
  }
}
