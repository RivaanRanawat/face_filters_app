import 'package:avatar_view/avatar_view.dart';
import "package:flutter/material.dart";
import "package:camera_deep_ar/camera_deep_ar.dart";

class CameraFilterScreen extends StatefulWidget {
  @override
  _CameraFilterScreenState createState() => _CameraFilterScreenState();
}

class _CameraFilterScreenState extends State<CameraFilterScreen> {
  CameraDeepArController cameraDeepArController;
  String _platformVersion = 'Unknown';
  int currentPage = 0;
  final vp = PageController(viewportFraction: .24);
  Effects currentEffect = Effects.none;
  Filters currentFilter = Filters.none;
  Masks currentMask = Masks.none;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            CameraDeepAr(
              cameraDeepArCallback: (c) async {
                cameraDeepArController = c;
                setState(() {});
              },
              onCameraReady: (isReady) {
                _platformVersion = "Camera status $isReady";
                print(_platformVersion);
                setState(() {});
              },
              androidLicenceKey:
                  "be3d0a99127f267f58da0201b278f7cea640d7833cef04c69ac95990d91f5ca472d05d47f9117f30",
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(8, (index) {
                          var active = currentPage == index;

                          return GestureDetector(
                            onTap: () {
                              currentPage = index;
                              cameraDeepArController.changeMask(index);
                              setState(() {});
                            },
                            child: AvatarView(
                              radius: active ? 45 : 25,
                              borderColor: Colors.yellow,
                              borderWidth: 2,
                              isOnlyText: false,
                              avatarType: AvatarType.CIRCLE,
                              backgroundColor: Colors.red,
                              imagePath:
                                  "assets/images/${index.toString()}.jpg",
                              placeHolder: Icon(Icons.person, size: 50),
                              errorWidget: Container(
                                child: Icon(Icons.error, size: 50),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
