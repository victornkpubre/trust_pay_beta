

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

const String USER_KEY = "USER_KEY";
const String TOKEN_KEY = "TOKEN_KEY";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage(); 

  AppPreferences(SharedPreferences sharedPreferences) : _sharedPreferences = sharedPreferences;
  
   Future<void> setUser(User? user) async {
    user == null?
    _sharedPreferences.remove(USER_KEY):
    _sharedPreferences.setString(USER_KEY, jsonEncode(user.toJson()));
  }

  Future<User?> getUser() async {
    String? userJson = _sharedPreferences.getString(USER_KEY);
    return userJson!=null? User.fromJson(jsonDecode(userJson)): null;
  }

  Future<bool> setAccessToken(String accessToken) async {  
    try {  
      await _secureStorage.write(key: TOKEN_KEY, value: accessToken);  
      return true;
    } catch (e) {  
      return false;
    }  
  }  

  Future<String?> getAccessToken() async {  
    try {  
      return await _secureStorage.read(key: TOKEN_KEY);  
    } catch (e) {   
      return null;  
    }  
  } 


}