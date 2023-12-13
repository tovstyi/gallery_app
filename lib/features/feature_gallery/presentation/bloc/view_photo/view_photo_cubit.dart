import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'view_photo_state.dart';

class ViewPhotoCubit extends Cubit<ViewPhotoState> {
  ViewPhotoCubit() : super(ViewPhotoInitial());
}
