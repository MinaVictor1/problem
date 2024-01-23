import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threemodel/lists/List.dart';
import 'package:threemodel/cubit/changepage/changepage_cubit.dart';
import '3dscene.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController controller = PageController();
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangepageCubit, ChangepageState>(
      listener: (context, state) {},
      builder: (context, state) {
        ChangepageCubit cubit = ChangepageCubit.get(context);
        cubit.changePage(controller);
        return Container(
          color: Colors.yellow,
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: models.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Scene3D(
                          models: models[index].models,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
