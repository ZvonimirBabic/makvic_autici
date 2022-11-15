// ignore_for_file: avoid_annotating_with_dynamic

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide FormData, Response;

import '../utils/logger_interceptor.dart';
import 'alice_service.dart';
import 'logger_service.dart';

enum HttpMethod {
  get,
  post,
  put,
  patch,
  delete,
}

class DioService extends GetxService {
  ///
  /// DEPENDENCIES
  ///

  final logger = Get.find<LoggerService>();
  final alice = Get.find<AliceService>().alice;

  ///
  /// VARIABLES
  ///

  late final Dio dio;

  ///
  /// INIT
  ///

  @override
  void onInit() {
    super.onInit();

    dio = Dio(
      BaseOptions(
        connectTimeout: kDebugMode ? 30000 : 5000,
      ),
    )
      ..interceptors.add(LoggerInterceptor())
      ..interceptors.add(alice.getDioInterceptor());
  }

  ///
  /// METHODS
  ///

  Future<T?> request<T>({
    required String endpoint,
    required HttpMethod httpMethod,
    required Future<T> Function(dynamic responseData) onSuccess,
    Function(String error)? onError,
    Map<String, dynamic>? parameters,
  }) async {
    final jsonData = jsonEncode(parameters);

    try {
      final options = Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        method: httpMethod.name,
      );

      late Response response;

      switch (httpMethod) {
        case HttpMethod.get:
          response = await dio.get(
            endpoint,
            options: options,
            queryParameters: parameters,
          );
          break;

        case HttpMethod.post:
          response = await dio.post(
            endpoint,
            data: jsonData,
            options: options,
          );
          break;

        case HttpMethod.put:
          response = await dio.put(
            endpoint,
            data: jsonData,
            options: options,
          );
          break;

        case HttpMethod.patch:
          response = await dio.patch(
            endpoint,
            data: jsonData,
            options: options,
          );
          break;

        case HttpMethod.delete:
          response = await dio.delete(
            endpoint,
            data: jsonData,
            options: options,
          );
          break;

        default:
          logger
            ..e('DIO SERVICE')
            ..e('--------------------')
            ..e('Error generating response')
            ..e('--------------------\n');
      }

      return onSuccess(response.data);
    } on DioError catch (e) {
      if (onError != null) {
        onError('$e');
      }
    } catch (e) {
      if (onError != null) {
        onError('$e');
      }
    }

    return null;
  }
}
