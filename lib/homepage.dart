import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threemodel/List.dart';
import 'package:threemodel/cubit/changepage/changepage_cubit.dart';

import '3dscene.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Flutter3DController controller1 = Flutter3DController();
  Flutter3DController controller2 = Flutter3DController();
  PageController controller = PageController();
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("GeeksForGeeks"),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                icon: Icon(Icons.home_filled),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.account_box_outlined),
                text: "Account",
              ),
              Tab(
                icon: Icon(Icons.alarm),
                text: "Alarm",
              ),
              Tab(
                icon: Icon(Icons.home_filled),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.account_box_outlined),
                text: "Account",
              ),
              Tab(
                icon: Icon(Icons.alarm),
                text: "Alarm",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: BlocConsumer<ChangepageCubit, ChangepageState>(
                listener: (context, state) {},
                builder: (context, state) {
                  ChangepageCubit cubit = ChangepageCubit.get(context);
                  cubit.changePage(controller);
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    child: PageView.builder(
                      controller: controller,
                      itemCount: models.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Scene3D(
                                controller: controller1,
                                model3d: models[index].model1,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Scene3D(
                                controller: controller2,
                                model3d: models[index].model2,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            const Center(
              child: Icon(Icons.account_circle),
            ),
            const Center(
              child: Icon(Icons.alarm),
            ),
            const Center(
              child: Icon(Icons.home),
            ),
            const Center(
              child: Icon(Icons.account_circle),
            ),
            const Center(
              child: Icon(Icons.alarm),
            )
          ],
        ),
      ),
    );
  }
}
/*ScrollConfiguration(
              behavior: ScrollConfiguration.of(context),
              child: LoopPageView.builder(
                controller: controller,
                itemBuilder: (context, index) {
                  print(index);
                  print(
                      '----------------------------------------------------------------------------------------------------------------------------------');
                  return Row(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Scene3D(
                            controller: controller1,
                            model3d: models[index].model1),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Scene3D(
                            controller: controller2,
                            model3d: models[index].model2),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  );
                },
                itemCount: models.length,
              ),
            ),*/