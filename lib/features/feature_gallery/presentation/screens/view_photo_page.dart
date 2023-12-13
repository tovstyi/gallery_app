import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/view_photo/view_photo_cubit.dart';
import '../widgets/custom_app_bar_title.dart';
import '../widgets/rect_image.dart';
import '../widgets/responsive_safe_area.dart';

class ViewPhotoPage extends StatefulWidget {
  final String? link;

  const ViewPhotoPage({
    super.key,
    this.link,
  });

  @override
  State<ViewPhotoPage> createState() => _ViewPhotoPage();
}

class _ViewPhotoPage extends State<ViewPhotoPage> {
  late String? link = '';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    if (args != null && args['link'] != '') {
      link = args['link'];
    } else if (widget.link != null) {
      link = widget.link!;
    }

    return BlocConsumer<ViewPhotoCubit, ViewPhotoState>(
      listener: (_, state) {},
      builder: (context, state) {
        return BlocBuilder<ViewPhotoCubit, ViewPhotoState>(
          buildWhen: (oldState, newState) => oldState != newState,
          builder: (context, state) {
            return ResponsiveSafeArea(builder: (context, size) {
              return Scaffold(
                appBar: AppBar(
                  leading: MaterialButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: size.width > 412
                          ? size.height * 0.05
                          : size.height * 0.04,
                      color: Colors.black,
                    ),
                  ),
                  title: const StyledAppBarTitle(
                    text: 'Back',
                  ),
                ),
                body: Stack(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(size.width > 412
                            ? size.height * 0.03
                            : size.height * 0.02),
                        child: RectImage(
                          size: size,
                          imageHeight: 1,
                          imageLink: link,
                        ))
                  ],
                ),
              );
            });
          },
        );
      },
    );
  }
}
