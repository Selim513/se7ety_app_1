import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety_app_1/core/font/app_font.dart';
import 'package:se7ety_app_1/core/function/navigator.dart';
import 'package:se7ety_app_1/core/utils/app_color.dart';
import 'package:se7ety_app_1/features/DoctorScreen/doctor_home.dart';
import 'package:se7ety_app_1/features/SignUp/Doctors_SignUp/Doctor_SignUp.dart';

class DoctorSignIn extends StatelessWidget {
  const DoctorSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    var fromKey = GlobalKey<FormState>();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: fromKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 250, child: Image.asset('asset/logo.png')),
                  const Gap(30),
                  Text(
                    ' سجل دخول الان ك "دكتور"',
                    style: getlargefont(
                        color: Appcolors.primaryColor,
                        fontweight: FontWeight.w700),
                  ),
                  const Gap(40),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Appcolors.offWhiteColor1,
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'يجب ان تدخل بريد الكتروني صالح';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'example@example.com',
                          suffixIcon: Icon(Icons.mail),
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Appcolors.offWhiteColor1,
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'ادخل الرقم السري';
                          }
                          return null;
                        },
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                            hintText: '*******',
                            suffixIcon: Icon(Icons.lock),
                            prefixIcon: Icon(Icons.visibility)),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'نسيت كلمه المرور؟',
                            style: TextStyle(color: Colors.blueAccent),
                          ))
                    ],
                  ),
                  const Gap(40),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Appcolors.primaryColor,
                        ),
                        onPressed: () {
                          if (fromKey.currentState!.validate()) {
                            gotoreplacement(context, const DoctorHome());
                          }
                        },
                        child: Text(
                          'تسجيل الدخول',
                          style: getmeduimfont(color: Colors.white),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ليس لدي حساب؟',
                        style: getmeduimfont(),
                      ),
                      TextButton(
                          onPressed: () {
                            gotoreplacement(context, const DoctorSingUp());
                          },
                          child: Text(
                            'سجل الان',
                            style: getmeduimfont(color: Appcolors.primaryColor),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
