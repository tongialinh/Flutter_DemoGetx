import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/configs/themes/app_icons.dart';
import 'package:study_app/configs/themes/custom_text_styles.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';
import 'package:study_app/controllers/question_papers/question_paper_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:study_app/screens/home/menu_screen.dart';
import 'package:study_app/screens/home/question_card.dart';
import 'package:study_app/screens/test_screen.dart';
import 'package:study_app/widgets/app_circle_button.dart';
import 'package:study_app/widgets/content_area.dart';
import 'package:study_app/controllers/zoom_drawer_controller.dart';



class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();

    return Scaffold(
      body: GetBuilder<MyZoomDrawerController>(builder: (_){
        return ZoomDrawer(
          borderRadius: 50.0,
          controller: _.zoomDrawerController,
          showShadow: true,
          angle: 0.0,
          style: DrawerStyle.defaultStyle,
          menuBackgroundColor: Colors.white.withOpacity(0.5),
          slideWidth: MediaQuery.of(context).size.width*1,

          menuScreen: MyMenuScreen(),
          mainScreen: Container(
            decoration: BoxDecoration(gradient: mainGradient()),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(mobileScreenPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppCircleButton(

                          child: const Icon(AppIcons.menuLeft,),
                          onTap: controller.toogleDrawer,
                        ),

                        const SizedBox(
                          height: 10,

                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              const Icon(AppIcons.peace),
                              Text(
                                "Hello friend",
                                style:
                                detailText.copyWith(color: onSurfaceTextColor),
                              )
                            ],
                          ),
                        ),
                        Text(
                          "What do you want to learn today?",
                          style: headerText,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: ContentArea(
                        addPadding: false,
                        child: Obx(() => ListView.separated(
                          padding: UIParamenters.mobileScreenPadding,
                          itemCount: _questionPaperController.allPapers.length,
                          itemBuilder: (BuildContext context, int index) {
                            return QuestionCard(
                              model: _questionPaperController.allPapers[index],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 20,
                            );
                          },
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },),


    );
  }
}

/*
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<String> _imageUrls = []; // khởi tạo giá trị ban đầu cho _imageUrls

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    final storageRef = FirebaseStorage.instance.ref().child('question_paper_images');
    final ListResult result = await storageRef.listAll();
    final urls = <String>[];

    for (final ref in result.items) {
      if (ref.name.endsWith('.png')) { // kiểm tra định dạng của file là .png
        final url = await ref.getDownloadURL();
        urls.add(url);
      }
    }

    setState(() {
      _imageUrls = urls;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: _imageUrls == null // kiểm tra nếu _imageUrls chưa được khởi tạo thì hiển thị CircularProgressIndicator()
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _imageUrls.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(_imageUrls[index]);
        },
      ),
    );
  }
}*/
