part of '../task_details_imports.dart';
class TaskDetailsMobileScreen extends StatefulWidget {
  final String taskId;
  const TaskDetailsMobileScreen({super.key, required this.taskId});

  @override
  State<TaskDetailsMobileScreen> createState() => _TaskDetailsMobileScreenState();
}

class _TaskDetailsMobileScreenState extends State<TaskDetailsMobileScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final taskViewModel = Provider.of<TaskViewModel>(context, listen: false);
      taskViewModel.fetchTaskById(widget.taskId);
    });
  }
  @override
  Widget build(BuildContext context) {
    final taskViewModel = Provider.of<TaskViewModel>(context, listen: false);

    return Form(
      key: taskViewModel.taskFormKey,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
            title: Text(AppString.editTask),
          actions: [
            IconButton(
                onPressed: ()=> shareTaskBottomSheet(context, widget.taskId,),
                icon: const Icon(Iconsax.share, color: AppColors.blue, size: 20,)
            ),

          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(Sizes.md),
          child: Column(
            children: [
              customTextFormField(
                controller: taskViewModel.taskTitleController,
                labelText: AppString.enterTaskTitle,
                prefixIcon: const Icon(Iconsax.edit_2, size: 17,),
                validator: (value) => Formatter().validateField(value, type: 'taskTitle'),
              ),
              const SizedBox(height: Sizes.md,),
              customTextFormField(
                controller: taskViewModel.taskDesController,
                labelText: AppString.enterTaskDescription,
                prefixIcon: const Icon(Iconsax.edit_2, size: 17,),
                maxLines: 5,
                validator: (value) => Formatter().validateField(value, type: 'taskDes'),
              ),
              const SizedBox(height: Sizes.md),

              Container(
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
                  icon: const Icon(Iconsax.export),
                  onPressed: () async {
                    if(taskViewModel.taskFormKey.currentState!.validate()) {
                      final updatedTask = TaskModel(
                        ownerId: taskViewModel.taskModel!.ownerId,
                        id: taskViewModel.taskModel!.id,
                        title: taskViewModel.taskTitleController.text,
                        description: taskViewModel.taskDesController.text,
                        sharedWithEmails: taskViewModel.taskModel!.sharedWithEmails,
                      );
                      await taskViewModel.updateTask(updatedTask);
                      Navigator.pop(context);
                    }else{
                      log('Invalid Details');
                    }

                  },
                  label: context.watch<TaskViewModel>().isLoading ? Container(
                    width: 15,
                    height: 15,
                    child: const CircularProgressIndicator(),
                  ) : Text(AppString.saveChanges),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}