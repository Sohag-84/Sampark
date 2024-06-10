import 'package:flutter/material.dart';
import 'package:sampark/common%20widgets/primary_button.dart';
import 'package:sampark/config/constant.dart';
import 'package:sampark/pages/profile/widgets/edit_profile_textfield.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        ///profile picture
                        Container(
                          height: 150,
                          width: 150,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surface,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.image, size: 48),
                        ),
                        const Gap(10),

                        ///name
                        editProfileTextField(
                          context: context,
                          title: "Name",
                          prefixIcon: Icons.person,
                          hintText: "Your name",
                        ),
                        const Gap(20),

                        ///email
                        editProfileTextField(
                          context: context,
                          title: "Email",
                          prefixIcon: Icons.mail,
                          hintText: "Your email",
                        ),
                        const Gap(20),

                        ///phone
                        editProfileTextField(
                          context: context,
                          title: "Phone Number",
                          prefixIcon: Icons.person,
                          hintText: "Your number",
                          textInputAction: TextInputAction.done,
                        ),
                        const Gap(20),
                        PrimaryButton(
                          onTap: () {},
                          btnName: "Save",
                          icon: Icons.save,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
