part of '../task_details_imports.dart';

Future shareTaskBottomSheet(BuildContext context, String taskId) {
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
                    Text(AppString.shareTask),
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
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: context.watch<TaskViewModel>().sharedWithEmails.length,
                    itemBuilder: (context, index){
                      final email = context.watch<TaskViewModel>().sharedWithEmails[index];
                      bool isCurrentUserEmail = FirebaseAuth.instance.currentUser?.email == email && FirebaseAuth.instance.currentUser!.uid == provider.taskModel!.ownerId;
                      return Container(
                        margin: const EdgeInsets.only(right: Sizes.sm),
                        padding: const EdgeInsets.all(Sizes.sm),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(email),
                            const SizedBox(width: 4),
                            if(!isCurrentUserEmail)
                            IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: (){
                                  provider.addRemoveEmail(taskId: taskId, deleteEmail: email);
                                }, icon: const Icon(Iconsax.trash, color: AppColors.red, size: 17))
                          ],
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: Sizes.md,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: customTextFormField(
                        controller: provider.emailIdController,
                        labelText: AppString.enterEmailID,
                        prefixIcon: const Icon(Iconsax.edit_2, size: 17,),
                        validator: (value) => Formatter().validateField(value, type: 'email'),
                      ),
                    ),
                    const SizedBox(width: Sizes.sm),

                    CircleAvatar(
                        child: IconButton(
                        onPressed: (){
                          provider.addRemoveEmail(taskId: taskId);
                        },
                        icon: const Icon(Iconsax.add))
                    )
                  ],
                ),
                const SizedBox(height: Sizes.sm),
                Text(AppString.or),
                SizedBox(
                  width: DeviceUtility.screenWidth(context) * 0.5,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: const BorderSide(color: AppColors.grey)
                        )
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      final String taskUrl = '${AppString.baseUrlLink}/$taskId';
                      Share.share('Check out this task: $taskUrl');
                    },
                    child: Text(AppString.shareOtherMedia),
                  ),
                ),
                const SizedBox(height: Sizes.xl),

              ],
            ),
          ),
        );
      }
  );
}
