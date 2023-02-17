import 'package:apptestfy/controllers/home_controller.dart';
import 'package:apptestfy/models/post_model.dart';
import 'package:apptestfy/repositories/home_repository_imp.dart';
import 'package:apptestfy/services/prefs_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(HomeRepositoryImp());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () {
              PrefsService.logout();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/login', (route) => true);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ValueListenableBuilder<List<PostModel>>(
          valueListenable: _controller.posts,
          builder: (context, value, __) {
            return Visibility(
              visible: !_controller.inLoader.value,
              replacement: const CircularProgressIndicator(),
              child: ListView.separated(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(value[index].id.toString()),
                    trailing: const Icon(Icons.arrow_forward),
                    title: Text(value[index].title),
                    onTap: () => Navigator.of(context)
                        .pushNamed('/details', arguments: value[index]),
                  );
                },
                separatorBuilder: (_, __) => const Divider(),
              ),
            );
          }),
    );
  }
}
