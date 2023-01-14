import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/view_photo/view_photo_cubit.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_app_bar_title.dart';

class ViewPhotoPage extends StatefulWidget {
  const ViewPhotoPage({
    super.key,
  });

  @override
  _ViewPhotoPage createState() => _ViewPhotoPage();
}

class _ViewPhotoPage extends State<ViewPhotoPage> {
  late String link = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    link = args['link'];

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocConsumer<ViewPhotoCubit, ViewPhotoState>(
      listener: (_, state) {},
      builder: (context, state) {
        return BlocBuilder<ViewPhotoCubit, ViewPhotoState>(
          buildWhen: (oldState, newState) => oldState != newState,
          builder: (context, state) {
            return Scaffold(
              appBar: CustomAppBar(
                height: height,
                width: width,
                leading: MaterialButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: width > 412 ? height * 0.05 : height * 0.04,
                    color: Colors.black,
                  ),
                ),
                title: const CustomAppBarTitle(
                  text: "Back",
                ),
              ),
              body: Stack(
                children: [
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(
                            width > 412 ? height * 0.03 : height * 0.02),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(height * 0.03),
                          child: Image.network(
                            link,
                            fit: BoxFit.fitHeight,
                            height: height,
                            width: width,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Colors.green,
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          ),
                        )),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
