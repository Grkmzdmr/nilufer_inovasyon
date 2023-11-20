import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nilufer_inovasyon/pages/main_page.dart';
import 'package:nilufer_inovasyon/pages/register_page.dart';
import 'package:nilufer_inovasyon/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ApiServices _services = ApiServicesImplementer();
  TextEditingController _usernameTextEditingController =
      TextEditingController();
  TextEditingController _passwordTextEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      //Bu widget, cihazın ekranındaki çeşitli kenarlık bölgelerinin (örneğin, üst, alt, sol, sağ) içeriği kaplamamasını sağlar. Iphone çentiği gibi.

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // const SizedBox(
              //   height: 50,
              // ),
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
                      "Uygulamaya hoşgeldin tek yapman gereken giriş yapmak.",
                      style: TextStyle(fontSize: 14, color: Colors.blueAccent),
                      textAlign: TextAlign.center,
                      //   ),
                    ),
                  ),
                  Spacer()
                ],
              ),

              // const SizedBox(
              //   height: 20,
              // ),
              SizedBox(
                height: 4.h,
              ),
              SizedBox(
                  // height: 50,
                  // width: 250,
                  height: 6.h,
                  width: 75.w,
                  child: TextField(
                    controller: _usernameTextEditingController,
                    decoration: InputDecoration(
                      labelText: "E-posta",
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
              // const SizedBox(
              //   height: 20,
              // ),
              SizedBox(
                height: 3.h,
              ),
              SizedBox(
                  // height: 50,
                  // width: 250,
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
              // const SizedBox(
              //   height: 5,
              // ),
              SizedBox(
                height: 1.h,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                  child: const Text(
                    "Üye değil misin? Kayıt Ol!",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blueAccent),
                  )),
              // const SizedBox(
              //   height: 20,
              // ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                  // width: 275,
                  // height: 40,
                  width: 80.w,
                  height: 6.h,
                  child: ElevatedButton(
                      onPressed: () async {
                        //await _services.login("email", "asd");
                        //eve.holt@reqres.in

                        //cityslicka
                        await _services
                            .login(_usernameTextEditingController.text.trim(),
                                _passwordTextEditingController.text.trim())
                            .then((value) async {
                          if (value.success) {
                            const snackBar = SnackBar(
                              content: Text('Giriş Başarılı'),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);

                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();

                            prefs.setString('token', value.token);

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainPage()));
                          } else {
                            const snackBar = SnackBar(
                              content: Text('Giriş Hatalı'),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        });
                      },
                      child: const Text(
                        "Giriş Yap",
                        style: TextStyle(color: Colors.white),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
