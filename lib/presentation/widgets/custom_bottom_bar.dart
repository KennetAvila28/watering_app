import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watering_system/presentation/utils/resources/app_colors.dart';
import 'package:watering_system/presentation/utils/resources/fonts.dart';

class BottomItem {
  final String label;
  final String icon;
  final bool showBadged;

  BottomItem(this.label, this.icon, this.showBadged);
}

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar(
      {super.key, required this.items, required this.onItemPressed});
  final List<BottomItem> items;
  final ValueChanged<int> onItemPressed;

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  late int _activeItem;

  @override
  void initState() {
    _activeItem = 0;
    super.initState();
  }

  onItemPressed(int index) {
    setState(() {
      _activeItem = index;
    });
    widget.onItemPressed(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(color: Colors.grey[200]),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              widget.items.length,
              (index) {
                var item = widget.items[index];
                return InkWell(
                  onTap: () => onItemPressed(index),
                  child: Stack(
                    children: [
                      item.showBadged
                          ? Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red[800]),
                              height: 8,
                              width: 8,
                            )
                          : Container(),
                      Column(
                        children: [
                          item.icon.isNotEmpty
                              ? SvgPicture.asset(
                                  item.icon,
                                  height: 24,
                                  width: 24,
                                  colorFilter: index == _activeItem
                                      ? const ColorFilter.mode(
                                          AppColors.darkBlue, BlendMode.srcIn)
                                      : ColorFilter.mode(
                                          Colors.grey[800]!, BlendMode.srcIn),
                                )
                              : const Placeholder(),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: Fonts.normalText(item.label),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        )
      ]),
    );
  }
}
