import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/params/params.dart';
import '../models/template_model.dart';

abstract class TemplateRemoteDataSource {
  Future<TemplateModel> getTemplate({required TemplateParams templateParams});
}

class TemplateRemoteDataSourceImpl implements TemplateRemoteDataSource {

  TemplateRemoteDataSourceImpl();

  @override
  Future<TemplateModel> getTemplate({required TemplateParams templateParams}) async {
   
      throw ServerException();
    
  }
}
