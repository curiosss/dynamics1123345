import 'package:dynamics/features/dynamics/controller/dynamics_controller.dart';
import 'package:dynamics/features/dynamics/presentation/widgets/alers_widget.dart';
import 'package:dynamics/features/dynamics/presentation/widgets/dynamics_chart_widget.dart';
import 'package:dynamics/features/dynamics/presentation/widgets/dynamics_list_tile.dart';
import 'package:flutter/material.dart';

class DynamicsPage extends StatefulWidget {
  const DynamicsPage({super.key});

  @override
  State<DynamicsPage> createState() => _DynamicsPageState();
}

class _DynamicsPageState extends State<DynamicsPage> {
  DynamicsController dynamicsCtrl = DynamicsController();
  bool showLoader = true;
  // RefreshController refreshController = RefreshController();

  resubmit() {}

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  void dispose() {
    dynamicsCtrl.dispose();
    // refreshController.dispose();
    super.dispose();
  }

  Future<void> init() async {
    await dynamicsCtrl.getDynamics();
    showLoader = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 4,
      ),
      body: RefreshIndicator(
        onRefresh: dynamicsCtrl.getDynamics,
        child: ListenableBuilder(
          listenable: dynamicsCtrl,
          builder: (context, _) {
            if (dynamicsCtrl.isloading) {
              return Center(
                child: showLoader
                    ? const CircularProgressIndicator.adaptive()
                    : const SizedBox(),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dynamics',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'All Period',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: DynamicsChartWidget(
                      dynamicsData: dynamicsCtrl.dynamics,
                    ),
                  ),
                  if (dynamicsCtrl.alert != null)
                    SliverToBoxAdapter(
                      child: AlersWidget(
                        alert: dynamicsCtrl.alert!,
                      ),
                    ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Дата',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[400],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'ME/мл',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          height: 1,
                          color: Colors.grey[300],
                        ),
                      ],
                    ),
                  ),
                  SliverList.separated(
                    itemCount: dynamicsCtrl.dynamics.length,
                    itemBuilder: (context, index) {
                      return DynamicsListTile(
                        dynamicModel: dynamicsCtrl.dynamics[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        height: 1,
                        color: Colors.grey[300],
                      );
                    },
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 14 + MediaQuery.of(context).padding.bottom,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
