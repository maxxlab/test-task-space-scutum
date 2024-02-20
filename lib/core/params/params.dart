class NoParams {}

class TemplateParams {}

class TaskParams {
  final String title;
  final String description;

  TaskParams({
    required this.title,
    required this.description,
  });
}
