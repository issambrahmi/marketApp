import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:market_app/Controller/login_controller.dart';
import 'package:market_app/Core/Color/app_color.dart';
import 'package:market_app/Core/Shared%20widgets/app_button.dart';
import 'package:market_app/Core/functions/app_validator.dart';
import 'package:market_app/View/LoginPage/commonW/login_form_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                child: Column(
              children: [
                LoginFormField(
                    hint: 'email',
                    prefixIcon: Icon(
                      Icons.email,
                      size: 25.sp,
                      color: AppColor.greencolor,
                    ),
                    textController: controller.email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (txt) => appValidator(
                          value: txt.toString(),
                          minLength: 10,
                          maxLength: 100,
                          isEmail: true,
                          isRequired: true,
                        )),
                SizedBox(height: 15.h),
                Obx(() => LoginFormField(
                    hint: 'password',
                    prefixIcon: Icon(
                      Icons.password,
                      size: 25.sp,
                      color: AppColor.greencolor,
                    ),
                    textController: controller.password,
                    isPassword: true,
                    isObsecure: controller.isObsecure.value,
                    eyeTap: () => controller.isObsecure.value =
                        !controller.isObsecure.value,
                    validator: (txt) => appValidator(
                          value: txt.toString(),
                          minLength: 8,
                          maxLength: 100,
                          isPassword: true,
                          isRequired: true,
                        ))),
                SizedBox(height: 30.h),
                AppButton(
                  text: 'Login',
                  height: 50.h,
                  width: double.infinity,
                  textSize: 18.sp,
                  gradient: const LinearGradient(colors: [
                    AppColor.greencolor,
                    AppColor.darkBlue,
                  ]),
                  textColor: Colors.white,
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
