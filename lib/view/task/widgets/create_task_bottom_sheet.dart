part of '../tasks_screen_imports.dart';
Future createTaskBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        final provider = context.read<TaskViewModel>();

        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: Sizes.md, horizontal: Sizes.md),
            child: Form(
              key: provider.taskFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: Sizes.xl * 2.5,
                    height: Sizes.sm/1.4,
                    decoration: BoxDecoration(
                      color: AppColors.darkerGrey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppString.addTask),
                      IconButton(onPressed: ()=> Navigator.pop(context), icon: Icon(Iconsax.close_circle, color: AppColors.darkerGrey.withOpacity(0.8),)),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: Sizes.sm/5,
                    decoration: BoxDecoration(
                      color: AppColors.darkerGrey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  const SizedBox(height: Sizes.md,),
                  customTextFormField(
                    controller: provider.taskTitleController,
                    labelText: AppString.enterTaskTitle,
                    prefixIcon: const Icon(Iconsax.edit_2, size: 17,),
                    validator: (value) => Formatter().validateField(value, type: 'taskTitle'),
                  ),
                  const SizedBox(height: Sizes.md,),
                  customTextFormField(
                    controller: provider.taskDesController,
                    labelText: AppString.enterTaskDescription,
                    prefixIcon: const Icon(Iconsax.edit_2, size: 17,),
                    maxLines: 5,
                    validator: (value) => Formatter().validateField(value, type: 'taskDes'),
                  ),
                  const SizedBox(height: Sizes.md),
                  SizedBox(
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
                      onPressed: () {
                        if(provider.taskFormKey.currentState!.validate()) {
                          provider.createTask(context);
                        }else{
                          log('Invalid Details');
                        }
                      },
                      icon: const Icon(Iconsax.export),
                      label: context.watch<TaskViewModel>().isLoading ? const SizedBox(
                          height: 15,
                          width: 15,
                          child: CircularProgressIndicator()
                      )
                          : Text(AppString.save),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
  );
}
