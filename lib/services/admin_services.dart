import 'dart:convert';

import 'package:http/src/response.dart';
import 'package:iget_sporty_admin_panel/services/http.dart';
import 'package:iget_sporty_admin_panel/services/shared_preferences.dart';
import 'package:iget_sporty_admin_panel/services/urls.dart';

class AdminServices {
  static final PreferencesService prefs = PreferencesService();
  static Future<Map<String, dynamic>> sendOtp(
      {required Map<String, dynamic> body}) async {
    try {
      Response response = await HttpServiceManager.post(
          endPoint: Url.sendOtp,
          body: body,
          headers: {'Content-Type': 'application/json'});
      return jsonDecode(response.body);
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> verifyEmail(
      {required Map<String, dynamic> body}) async {
    try {
      Response response = await HttpServiceManager.post(
        endPoint: Url.verifyEmail,
        body: body,
      );
      return jsonDecode(response.body);
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> signUp(Map<String, dynamic> body) async {
    try {
      Response response;

      response = await HttpServiceManager.post(
        endPoint: Url.signUp,
        body: body,
      );

      return jsonDecode(response.body);
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> login(
      {required Map<String, dynamic> body}) async {
    try {
      Response response = await HttpServiceManager.post(
        endPoint: Url.login,
        body: body,
      );
      return jsonDecode(response.body);
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> forgotPassword(
      {required Map<String, dynamic> body}) async {
    try {
      Response response = await HttpServiceManager.post(
        endPoint: Url.forgotPassword,
        body: body,
      );
      return jsonDecode(response.body);
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> viewAllPlayers() async {
    final token = await prefs.getUserToken();
    try {
      Response response;

      response = await HttpServiceManager.get(
        endPoint: Url.getPlayers,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      return jsonDecode(response.body);
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> viewAllOwners() async {
    final token = await prefs.getUserToken();
    try {
      Response response;

      response = await HttpServiceManager.get(
        endPoint: Url.getOwners,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      return jsonDecode(response.body);
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> viewAllBookings() async {
    final token = await prefs.getUserToken();
    try {
      Response response;

      response = await HttpServiceManager.get(
        endPoint: Url.getBooking,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      return jsonDecode(response.body);
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> deleteUser(String id) async {
    final token = await prefs.getUserToken();
    try {
      Response response;

      response = await HttpServiceManager.delete(
        endPoint: "${Url.deleteUser}/$id",
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      return jsonDecode(response.body);
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> deleteBooking() async {
    final token = await prefs.getUserToken();
    try {
      Response response;

      response = await HttpServiceManager.delete(
        endPoint: Url.deleteBooking,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      return jsonDecode(response.body);
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> updateUserStatus(
      Map<String, dynamic> body, String id) async {
    final token = await prefs.getUserToken();
    try {
      Response response;

      response = await HttpServiceManager.patch(
        endPoint: "${Url.updateUserStatus}/$id",
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      return jsonDecode(response.body);
    } catch (e) {
      rethrow;
    }
  }
}
