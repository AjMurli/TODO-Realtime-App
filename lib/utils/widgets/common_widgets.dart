part of 'widgets_imports.dart';

Widget customTextFormField({
  int? maxLines,
  int? maxLength,
  required String labelText,
  Widget? prefixIcon,
  required TextEditingController controller,
  String? Function(String?)? validator,
}) {
  return TextFormField(
    controller: controller,
    style: const TextStyle(decorationThickness: 0.0),
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(fontSize: Sizes.fontSizeSm),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.grey)
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.grey)
      ),
      prefixIcon: prefixIcon,
      contentPadding: const EdgeInsets.symmetric(vertical: Sizes.sm),
    ),
    maxLength: maxLength,
    maxLines: maxLines,
    validator: validator,
    autovalidateMode: AutovalidateMode.onUserInteraction,
  );
}