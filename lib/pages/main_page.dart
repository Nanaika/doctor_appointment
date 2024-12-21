import 'package:doctor_appoinment/ui_kit/colors.dart';
import 'package:doctor_appoinment/utils/assets_paths.dart';
import 'package:doctor_appoinment/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int page = 0;

  setPage(int newIndex) {
    setState(() {
      page = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: page,
            children: [
              Container(
                color: Colors.yellow,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.greenAccent,
              ),
            ],
          ),
          Positioned(
            child: BottomBar(
              onIndexChanged: (index) {
                setPage(index);
              },
            ),
            left: 0,
            right: 0,
            bottom: 0,
          )
        ],
      ),
    );
  }
}

class BottomBar extends StatefulWidget {
  const BottomBar({
    super.key,
    required this.onIndexChanged,
  });

  final void Function(int index) onIndexChanged;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selected = 0;

  void changeIndex(int newIndex) {
    setState(() {
      selected = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.scaffoldHPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            AppIcons.mainIcons.length,
            (index) {
              return GestureDetector(
                onTap: () {
                  changeIndex(index);
                  widget.onIndexChanged(index);
                },
                child: Container(
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                    left: index != 0 ? 20 : 0,
                    right: index != AppIcons.mainIcons.length - 1 ? 20 : 0,
                  ),
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        fit: BoxFit.none,
                        AppIcons.mainIcons[index],
                        height: 25,
                        width: 25,
                      ),
                      AnimatedOpacity(
                        opacity: selected == index ? 1 : 0,
                        duration: AppConstants.duration200,
                        child: SvgPicture.asset(
                          fit: BoxFit.none,
                          AppIcons.mainIcons[index],
                          height: 25,
                          width: 25,
                          colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
