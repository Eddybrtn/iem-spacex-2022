import 'package:flutter/material.dart';
import 'package:iem_spacex_2022/core/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, HomeViewModel model, child) => Scaffold(
          appBar: AppBar(
            title: const Text("SpaceX"),
          ),
          body: model.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemBuilder: (context, position) => Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                    child: Text(model.launches[position].name ?? ''),
                  ),
                  itemCount: model.launches.length,
                ),
        ),
      ),
    );
  }
}
