import 'package:get/get.dart';
import 'package:sampark/config/constant.dart';

class AuthPageBody extends StatelessWidget {
  const AuthPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isLogin = false.obs;
    return Obx(() {
      return Container(
        height: 400,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ///login
                      InkWell(
                        onTap: () {
                          isLogin.value = true;
                        },
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2.5,
                          child: Column(
                            children: [
                              Text(
                                "Login",
                                style: isLogin.value
                                    ? Theme.of(context).textTheme.bodyLarge
                                    : Theme.of(context).textTheme.labelLarge,
                              ),
                              const Gap(5),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                height: 2,
                                width: isLogin.value ? 100 : 0,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      ///signup
                      InkWell(
                        onTap: () {
                          isLogin.value = false;
                        },
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2.5,
                          child: Column(
                            children: [
                              Text(
                                "Signup",
                                style: isLogin.value
                                    ? Theme.of(context).textTheme.labelLarge
                                    : Theme.of(context).textTheme.bodyLarge,
                              ),
                              const Gap(5),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                height: 2,
                                width: isLogin.value ? 0 : 100,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
