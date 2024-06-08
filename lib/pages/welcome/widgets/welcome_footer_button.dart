import 'package:sampark/config/constant.dart';
import 'package:slide_to_act/slide_to_act.dart';

class WelcomeFooterButton extends StatelessWidget {
  const WelcomeFooterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideAction(
      onSubmit: () {
        return null;
      },
      sliderButtonIcon: SizedBox(
        height: 25,
        width: 25,
        child: SvgPicture.asset(
          AssetsImage.plugSVG,
          width: 25,
        ),
      ),
      submittedIcon: SvgPicture.asset(
        AssetsImage.connetSVG,
        width: 25,
      ),
      sliderRotate: false,
      animationDuration: const Duration(seconds: 3),
      text: WelcomePageString.slideToStart,
      textStyle: Theme.of(context).textTheme.labelLarge,
      innerColor: Theme.of(context).colorScheme.primary,
      outerColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }
}
