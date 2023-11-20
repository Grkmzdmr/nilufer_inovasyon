import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nilufer_inovasyon/pages/login_page.dart';
import 'package:nilufer_inovasyon/pages/main_page.dart';
import 'package:nilufer_inovasyon/services/api_services.dart';
import 'package:sizer/sizer.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  ApiServices services = ApiServicesImplementer();
  TextEditingController _usernameTextEditingController =
      TextEditingController();
  TextEditingController _passwordTextEditingController =
      TextEditingController();
  TextEditingController _secondPasswordTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 4.h,
              ),
              SizedBox(
                height: 20.h,
                width: 30.w,
                child: SvgPicture.asset('assets/images/logo.svg'),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Expanded(
                    flex: 7,
                    child: Text(
                      "Aramıza hoşgeldin tek yapman gereken kayıt olmak.",
                      style: TextStyle(fontSize: 14, color: Colors.blueAccent),
                      textAlign: TextAlign.center,
                      //   ),
                    ),
                  ),
                  Spacer()
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                  height: 6.h,
                  width: 75.w,
                  child: TextField(
                    controller: _usernameTextEditingController,
                    decoration: InputDecoration(
                      labelText: "E-posta",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  )),
              SizedBox(
                height: 3.h,
              ),
              SizedBox(
                  height: 6.h,
                  width: 75.w,
                  child: TextField(
                    controller: _passwordTextEditingController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Şifre",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  )),
              SizedBox(
                height: 3.h,
              ),
              SizedBox(
                  height: 6.h,
                  width: 75.w,
                  child: TextField(
                    controller: _secondPasswordTextEditingController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Şifre Tekrar",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  )),
              SizedBox(
                height: 1.h,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  },
                  child: const Text(
                    "Üye misin? Giriş Yap!",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blueAccent),
                  )),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                  width: 80.w,
                  height: 6.h,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_passwordTextEditingController.text !=
                            _secondPasswordTextEditingController.text) {
                          const snackBar = SnackBar(
                            content: Text('Şifreler Eşleşmiyor !'),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          return;
                        }
                        //"email": "eve.holt@reqres.in",
                        //"password": "pistol"
                        services
                            .register(
                                _usernameTextEditingController.text.trim(),
                                _passwordTextEditingController.text.trim())
                            .then((value) {
                          if (value.success) {
                            const snackBar = SnackBar(
                              content: Text('Giriş Başarılı'),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainPage()));
                          }
                        });
                      },
                      child: const Text(
                        "Kayıt Ol",
                        style: TextStyle(color: Colors.white),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
