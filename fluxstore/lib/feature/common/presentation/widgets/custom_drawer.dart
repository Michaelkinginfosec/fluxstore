import 'package:flutter/material.dart';
import 'package:fluxstore/core/config/theme/app_style.dart';
import 'package:fluxstore/core/constants/app_colors.dart';
import 'package:fluxstore/core/constants/app_size.dart';
import 'package:fluxstore/core/constants/list_tile_data.dart';

class CustomDrawer extends StatefulWidget {
  final int isSelected;
  final ValueChanged<int> onSelected;
  const CustomDrawer({
    super.key,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSize.kHeight30,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(child: Image.asset("assets/images/avatar.png")),
                  AppSize.kWidth20,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sunie Pham", style: AppStyle.appBarTitleStyle),
                      Text("sunieux@gmail.com", style: AppStyle.smallBoldText),
                    ],
                  ),
                ],
              ),
              AppSize.kHeight50,
              for (int i = 0; i < 4; i++)
                GestureDetector(
                  onTap: () => widget.onSelected(i),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          widget.isSelected == i
                              ? AppColors.selectedSidebarColor
                              : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 55,
                    child: ListTile(
                      title: Row(
                        children: [
                          Image.asset(listTileData[i]['icon']),
                          AppSize.kWidth20,
                          Text(listTileData[i]['title']),
                        ],
                      ),
                    ),
                  ),
                ),
              AppSize.kHeight30,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("OTHER"),
              ),
              AppSize.kHeight30,

              for (int i = 4; i < listTileData.length; i++)
                ListTile(
                  title: Row(
                    children: [
                      Image.asset(listTileData[i]['icon']),
                      AppSize.kWidth20,
                      Text(listTileData[i]['title']),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
