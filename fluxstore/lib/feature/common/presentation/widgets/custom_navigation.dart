// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxstore/core/constants/navigation_icon.dart';
import 'package:fluxstore/feature/common/presentation/bloc/navigation/navigation_cubit.dart';

class CustomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const CustomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.watch<NavigationCubit>().state;
    return Material(
      elevation: 8,
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, -1),
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(icons.length, (i) {
            final isSelected = i == selectedIndex;
            return GestureDetector(
              onTap: () => onTap(i),
              child: Image.asset(
                icons[i],
                color: isSelected ? Colors.black : null,
              ),
            );
          }),
        ),
      ),
    );
  }
}
