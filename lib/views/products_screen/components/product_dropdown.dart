import 'package:get/get.dart';
import 'package:ggd_mart_admin/const/const.dart';
import 'package:ggd_mart_admin/controller/products_controller.dart';
import 'package:ggd_mart_admin/widgets/normal_text.dart';

Widget productDropdown(
    hint, List<String> list, dropvalue, ProductsController controller) {
  return Obx(
    () => DropdownButtonHideUnderline(
      child: DropdownButton(
          hint: normalText(text: "$hint", color: fontGrey),
          value: dropvalue.value == '' ? null : dropvalue.value,
          isExpanded: true,
          items: list.map((e) {
            return DropdownMenuItem(
              // ignore: sort_child_properties_last
              child: e.toString().text.make(),
              value: e,
            );
          }).toList(),
          onChanged: ((newvalue) {
            if (hint == "Category") {
              // Corrected the hint to "Category"
              controller.subcategoryvalue.value = '';
              controller.populateSubcategory(newvalue.toString());
            }
            dropvalue.value = newvalue.toString();
          })),
    )
        .box
        .white
        .roundedSM
        .padding(const EdgeInsets.symmetric(horizontal: 6))
        .make(),
  );
}
