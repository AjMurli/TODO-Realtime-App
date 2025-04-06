part of 'task_details_imports.dart';

class TaskDetailsScreen extends StatelessWidget {
  final String taskId;
  const TaskDetailsScreen({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return SiteTemplate(
      userLayout: false,
      mobile: TaskDetailsMobileScreen(taskId: taskId),
      tablet: TaskDetailsMobileScreen(taskId: taskId),
      desktop: const TaskDetailsLaptopScreen(),
    );
  }
}
