import 'package:barq_go/features/auth/presentaion/cubit/auth_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  TextEditingController phoneController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
}
