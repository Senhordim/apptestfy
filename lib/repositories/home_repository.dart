import 'package:apptestfy/models/post_model.dart';

abstract class HomeRepository {
  Future<List<PostModel>> getList();
}
