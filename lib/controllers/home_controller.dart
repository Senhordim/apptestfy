import 'package:apptestfy/models/post_model.dart';
import 'package:apptestfy/repositories/home_repository.dart';
import 'package:flutter/material.dart';

class HomeController {
  final HomeRepository _homeRepository;

  HomeController(this._homeRepository);

  ValueNotifier<List<PostModel>> posts = ValueNotifier<List<PostModel>>([]);
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  fetch() async {
    inLoader.value = true;
    posts.value = await _homeRepository.getList();
    Future.delayed(const Duration(seconds: 3));
    inLoader.value = false;
  }
}
