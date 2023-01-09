import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'view_photo_state.dart';

class ViewPhotoCubit extends Cubit<ViewPhotoState> {
  ViewPhotoCubit() : super(ViewPhotoInitial());
}
// TODO: create view photo cubit transferring photo link function
