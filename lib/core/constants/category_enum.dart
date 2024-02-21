enum CategoryEnum {
  common('Common'),
  work('Work'),
  studying('Stydying'),
  sport('Sport'),
  shopping('Shopping');

  final String category;
  const CategoryEnum(this.category);
}

extension ConvertCategory on String {
  CategoryEnum toCategoryEnum() {
    switch (this) {
      case 'Work':
        return CategoryEnum.work;
      case 'Shopping':
        return CategoryEnum.shopping;
      case 'Studying':
        return CategoryEnum.studying;
      case 'Sport':
        return CategoryEnum.sport;
      default:
        return CategoryEnum.common;
    }
  }
}

final List<String> categoryList = <String>[
  CategoryEnum.common.category,
  CategoryEnum.shopping.category,
  CategoryEnum.sport.category,
  CategoryEnum.work.category,
  CategoryEnum.studying.category,
];