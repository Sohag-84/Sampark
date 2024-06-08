import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../config/images.dart';
import '../../../config/strings.dart';

class WelcomeHeading extends StatelessWidget {
  const WelcomeHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetsImage.appIconSVG,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ],
        ),
        const Gap(20),
        Text(
          AppString.appName,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(),
        ),
      ],
    );
  }
}
