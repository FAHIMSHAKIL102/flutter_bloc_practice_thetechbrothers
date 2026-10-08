import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_practice_thetechbrothers/utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(ImagePickerState()) {
    on<CameraCaptureImageEvent>(cameraCaptureImage);
    on<ImageFromGalleryEvent>(imageFromGallery);
  }

  FutureOr<void> cameraCaptureImage(
    CameraCaptureImageEvent event,
    Emitter<ImagePickerState> emit,
  ) async {
    final XFile? file = await imagePickerUtils.cameracapture();
    emit(state.copyWith(file: file));
  }

  FutureOr<void> imageFromGallery(
    ImageFromGalleryEvent event,
    Emitter<ImagePickerState> emit,
  ) async {
    final XFile? file = await imagePickerUtils.galleryPicker();
    emit(state.copyWith(file: file));
  }
}
