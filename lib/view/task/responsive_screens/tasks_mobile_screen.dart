part of '../tasks_screen_imports.dart';

class TasksMobileScreen extends StatefulWidget {
  const TasksMobileScreen({super.key});

  @override
  State<TasksMobileScreen> createState() => _TasksMobileScreenState();
}

class _TasksMobileScreenState extends State<TasksMobileScreen> {
  final TaskViewModel taskViewModel = TaskViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final taskViewModel = Provider.of<TaskViewModel>(context, listen: false);
      taskViewModel.initTaskStream(FirebaseAuth.instance.currentUser?.email ?? 'empty email');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text(AppString.appName),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => createTaskBottomSheet(context),
              icon: const Icon(Iconsax.edit)
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.md),
        child: Consumer<TaskViewModel>(
          builder: (context, taskViewModel, child) {
            if (taskViewModel.taskStream == null) {
              return const Center(child: CircularProgressIndicator());
            }

            return StreamBuilder<List<TaskModel>>(
              stream: taskViewModel.taskStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final tasks = snapshot.data!;
                  if(tasks.isEmpty) {
                    return const Center(child: Text('No tasks found. Let\'s plan your day by adding some tasks!', textAlign: TextAlign.center));
                  }
                  return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return todoCardWidget(
                        context,
                        title: task.title,
                        description: task.description,
                        taskId: task.id,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TaskDetailsScreen(taskId: task.id),
                            ),
                          );
                        },
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error loading tasks'));
                }
                return const Center(child: CircularProgressIndicator());
              },
            );
          },
        ),
      ),
    );
  }
  

}
