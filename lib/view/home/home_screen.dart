import 'package:demo_project/common/common_card.dart';
import 'package:demo_project/common/common_dialog.dart';
import 'package:demo_project/common/common_textstyle.dart';
import 'package:demo_project/utils/app_color.dart';
import 'package:demo_project/utils/app_session.dart';
import 'package:demo_project/utils/route_string.dart';
import 'package:demo_project/view/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  HomeController homeController = Get.find<HomeController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, initialIndex: 0, vsync: this);
    homeController.taskGet();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          backgroundColor: AppColors.kGrey200,
          appBar: AppBar(
            title: Row(
              children: [
                Text(
                  "TO",
                  style: AppTextStyle.styleW600.copyWith(fontSize: 20),
                ),
                Text(
                  "DO",
                  style: AppTextStyle.styleW600.copyWith(
                    fontSize: 20,
                    color: AppColors.kPrimary,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  clearLocalStorage().then(
                    (value) => Get.offAllNamed(RouteString.loginScreen),
                  );
                },
                icon: const Icon(Icons.logout),
              ),
            ],
            bottom: (homeController.isLoading.value == false)
                ? TabBar(
                    controller: tabController,
                    tabs: const [
                      Tab(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text('All'),
                        ),
                      ),
                      Tab(
                        child: Text('Pending'),
                      ),
                      Tab(
                        child: Text('Conform'),
                      ),
                    ],
                    onTap: (value) {
                      homeController.flotingButtonShowHide.value = value;
                    },
                  )
                : null,
          ),
          body: (homeController.isLoading.value == false)
              ? TabBarView(
                  controller: tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    AllList(data: homeController.todoData),
                    AllList(
                        data: homeController.todoData
                            .where((e) => e.status == false)
                            .toList()),
                    AllList(
                        data: homeController.todoData
                            .where((e) => e.status == true)
                            .toList()),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.kPrimary,
                  ),
                ),
        );
      },
    );
  }
}

class AllList extends StatefulWidget {
  List data;

  AllList({super.key, required this.data});

  @override
  State<AllList> createState() => _AllListState();
}

class _AllListState extends State<AllList> {
  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kGrey200,
      floatingActionButton: (homeController.flotingButtonShowHide.value == 2)
          ? const SizedBox()
          : FloatingActionButton(
              backgroundColor: AppColors.kPrimary,
              onPressed: () {
                homeController.titleController.clear();
                homeController.descriptionController.clear();
                Get.dialog(
                  commonDialog(
                    onTap: () {
                      homeController.taskAdd().then((value) {
                        homeController.isLoading.value = true;
                        homeController.taskGet();
                      });
                    },
                    descriptionController: homeController.descriptionController,
                    titleController: homeController.titleController,
                  ),
                );
              },
              child: const Icon(
                Icons.add,
                color: AppColors.kWhite,
              ),
            ),
      body: (widget.data.isNotEmpty)
          ? ListView.builder(
              itemCount: widget.data.length,
              padding: const EdgeInsets.symmetric(vertical: 7),
              itemBuilder: (context, index) {
                return commonCard(data: widget.data[index]);
              },
            )
          : const Center(
              child: Text("No data found"),
            ),
    );
  }
}
