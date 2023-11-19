import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/data/dto/contact_us_dto.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsState());

  final Dio dio = Dio();

  Future<void> sendData({required String name, required String email, required String message}) async {
    try {
      emit(state.copyWith(contactUsStatus: ContactUsStatus.loading));
      final data = ContactUsDTO(name: name, email: email, message: message).toJson();
      final response = await dio.post('https://api.byteplex.info/api/test/contact/', data: data);

      log('--------> sendData = ${ContactUsDTO.fromJson(response.data).toContactUs().toString()}');

      emit(state.copyWith(contactUsStatus: ContactUsStatus.success));
    } on DioException catch (error) {
      emit(state.copyWith(contactUsStatus: ContactUsStatus.error, errorMessage: error.message.toString()));
    }
  }
}
