part of '../tasks_screen_imports.dart';

Widget todoCardWidget(BuildContext context, {required String title, required String description, required String taskId, required void Function() onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(bottom: Sizes.sm),
      padding: const EdgeInsets.only(left: Sizes.md, right: Sizes.md, top: Sizes.md),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.grey)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: Sizes.fontSizeMd, fontWeight: FontWeight.w500),),

          const SizedBox(height: Sizes.sm/2),
          Text(description, style: const TextStyle(fontSize: Sizes.fontSizeSm/1.2),),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskDetailsScreen(taskId: taskId),
                      ),
                    );
                  },
                  icon: const Icon(Iconsax.edit_2, color: AppColors.blue, size: 20,)
              ),

            ],
          )
        ],
      ),
    ),
  );
}
