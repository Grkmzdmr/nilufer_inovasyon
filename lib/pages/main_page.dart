import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nilufer_inovasyon/models/data_model.dart';
import 'package:nilufer_inovasyon/pages/login_page.dart';
import 'package:nilufer_inovasyon/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ApiServices service = ApiServicesImplementer();
  StreamController<HomeResponse> _streamController =
      StreamController<HomeResponse>();
  Color defaultColor = Colors.white;

  @override
  void initState() {
    service.getHome().then((value) {
      _streamController.sink.add(value);
      print(value.data!.elementAt(1).color?.substring(1));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Renk Paleti'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();

                prefs.remove('token');

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: StreamBuilder<HomeResponse>(
          stream: _streamController.stream,
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data?.per_page ?? 0,
              itemBuilder: (context, index) {
                return Card(
                    margin: EdgeInsets.all(8),
                    color: Colors.white,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(12),
                      leading: Container(
                        height: 6.h,
                        width: 10.w,
                        color: fromHex(snapshot.data?.data?[index].color ?? ''),
                      ),
                      subtitle: Column(
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            children: [
                              Text(
                                'Üretim Yılı : ${snapshot.data?.data?[index].year ?? ''}',
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            children: [
                              Text(
                                  'Pantone Kodu : ${snapshot.data?.data?[index].pantone_value ?? ''}'),
                            ],
                          ),
                        ],
                      ),
                      title: Text(
                          'Renk İsmi : ${snapshot.data?.data?[index].name ?? ''}'),
                    ));
              },
            );
          }),
    );
  }

  Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
