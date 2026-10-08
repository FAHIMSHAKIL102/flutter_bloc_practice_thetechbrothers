import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/imagepicker/bloc/image_picker_bloc.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('I M A G E   P I C K E R')),
      body: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          BlocBuilder<ImagePickerBloc, ImagePickerState>(
            builder: (context, state) {
              return Column(
                children: [
                  state.file == null
                      ? Center(
                          child: CircleAvatar(
                            radius: 56,
                            child: Icon(Icons.image_outlined, size: 100),
                          ),
                        )
                      : Center(
                          child: SizedBox(
                            height: 300,
                            width: 300,
                            child: Image.file(
                              fit: BoxFit.cover,
                              File(state.file!.path),
                            ),
                          ),
                        ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<ImagePickerBloc>().add(
                            CameraCaptureImageEvent(),
                          );
                        },
                        child: Text('Camera'),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          context.read<ImagePickerBloc>().add(
                            ImageFromGalleryEvent(),
                          );
                        },
                        child: Text('Gallery'),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

// camera capture

// if (state.file == null) {
//                 return GestureDetector(
//                   onTap: () {
//                     context.read<ImagePickerBloc>().add(CameraCaptureImage());
//                   },
//                   child: Center(
//                     child: CircleAvatar(
//                       radius: 56,
//                       child: Icon(Icons.broken_image_outlined, size: 100),
//                     ),
//                   ),
//                 );
//               } else {
//                 return GestureDetector(
//                   onTap: () {
//                     context.read<ImagePickerBloc>().add(CameraCaptureImage());
//                   },
//                   child: Center(
//                     child: SizedBox(
//                       height: 300,
//                       width: 300,
//                       child: Image.file(File(state.file!.path)),
//                     ),
//                   ),
//                 );
//               }
