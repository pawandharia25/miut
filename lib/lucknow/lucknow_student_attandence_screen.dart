import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miut/controller/lucknow_student_attandence_controller.dart';
import 'package:miut/data/response/status.dart';
import 'package:miut/infrastructures/widgets/custom_container.dart';
import 'package:miut/infrastructures/widgets/internet_exception.dart';
import 'package:miut/pages/widgets/appbarlogo.dart';

class LucknowStudentAttandence
    extends GetView<LucknowStudentAttandenceController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Get.put(
      LucknowStudentAttandenceController(),
    );
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          style: ButtonStyle(alignment: Alignment.centerLeft),
        ),
        backgroundColor: Color(0xFF111d5e),
        flexibleSpace: const AppBarLogo(),
        toolbarHeight: 80,
      ),
      body: Obx(() {
        switch (controller.rxRequestStatus.value) {
          case Status.Loading:
            return Center(
              child: CircularProgressIndicator(),
            );
          // TODO: Handle this case.
          case Status.Complete:
            return Column(
              children: [
                Container(
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Color(0xFFfcc736)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        "Lucknow School wise Attandence",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: controller.dataList.value.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                            left: 15.w,
                            right: 15.w,
                            top: 10.h,
                          ),
                          padding: EdgeInsets.only(
                            top: 5.w,
                            bottom: 20.w,
                          ),
                          child: Obx(() {
                            return Center(
                              child: Custom_container(
                                bottomPadding: 15.0,
                                bottomMargin: 10.0,
                                topMargin: 0.0.h,
                                topPadding: 15.0,
                                leftMargin: 5.0.w,
                                leftPadding: 10.0,
                                rightMargin: 5.0.w,
                                rightPadding: 0.0,
                                width: Get.width.w,
                                backgroundColor: Colors.blue,
                                borderColor: Colors.red,
                                // textColor: Colors.white,
                                // fontSize:25.sp,
                                // fontWeight: FontWeight.w700,
                                borderRadius: 10,
                                child: Center(
                                  child: Column(
                                    children: [
                                      AutoSizeText(
                                        controller
                                            .dataList.value.data![index].aStatus
                                            .toString(),
                                        style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                          // decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      AutoSizeText(
                                        controller.dataList.value.data![index]
                                            .schoolName
                                            .toString(),
                                        style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w400,
                                          // decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      }),
                ),
              ],
            );
          // TODO: Handle this case.
          case Status.Error:
            if (controller.error.value == "No internet") {
              return InternetExceptionWidget(
                onPress: () {
                  controller.updateDataListApi();
                },
              );
            } else {
              return InternetExceptionWidget(onPress: () {
                controller.updateDataListApi();
              });
            }
        }
      }),
    );
  }
}
