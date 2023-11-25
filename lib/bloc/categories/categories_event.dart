abstract class CategoriesEvents {}

class EditCategories extends CategoriesEvents {
  final Map categoryDetailsMap;

  EditCategories({required this.categoryDetailsMap});
}

class DeleteCategories extends CategoriesEvents {
  final List<int> variantIds;

  DeleteCategories({required this.variantIds});
}

class FetchAllCategories extends CategoriesEvents {}

class ToggleCategories extends CategoriesEvents {
  bool categoryToggle;

  ToggleCategories({required this.categoryToggle});
}
