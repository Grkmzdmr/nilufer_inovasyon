import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nilufer_inovasyon/models/data_model.dart';
import 'package:nilufer_inovasyon/models/login_model.dart';
import 'package:nilufer_inovasyon/models/register_model.dart';

abstract class ApiServices {
  Future<LoginResponse> login(String email, String password);
  Future<HomeResponse> getHome();
  Future<RegisterResponse> register(String email, String password);
}

class ApiServicesImplementer implements ApiServices {
  @override
  Future<LoginResponse> login(String email, String password) async {
    final String apiUrl = 'https://reqres.in/api/login';

    LoginResponse model = LoginResponse(false, "");

    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      model.success = true;

      final Map<String, dynamic> responseData = json.decode(response.body);

      final String token = responseData['token'];

      model.token = token;

      print('Giriş Başarılı');

      print('Dönen Cevap: ${response.body}');
    } else {
      model.success = false;

      print('Giriş Başarısız');

      print('Dönen Cevap: ${response.body}');
    }

    return model;
  }

  @override
  Future<HomeResponse> getHome() async {
    final String apiUrl = 'https://reqres.in/api/unknown';

    HomeResponse homeResponse = HomeResponse();

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      List<dynamic> data = responseData['data'];

      List<HomeDataResponse> homeDataResponse =
          data.map((item) => HomeDataResponse.fromJson(item)).toList();

      homeResponse.data = homeDataResponse;

      homeResponse.per_page = responseData['per_page'];

      //final String totalCount = responseData['total'];

      print('ana sayfa basarili');
    }

    return homeResponse;
  }

  @override
  Future<RegisterResponse> register(String email, String password) async {
    final String apiUrl = 'https://reqres.in/api/register';

    RegisterResponse model = RegisterResponse(0, false, '');

    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'email': email,
        'password': password,
      },);


       if (response.statusCode == 200) {
      model.success = true;

      final Map<String, dynamic> responseData = json.decode(response.body);

      final String token = responseData['token'];

      model.token = token;

      print('Kayit Başarılı');

      print('Dönen Cevap: ${response.body}');
    } else {
      model.success = false;

      print('Kayit Başarısız');

      print('Dönen Cevap: ${response.body}');
    }

    return model;



    
  }
}
