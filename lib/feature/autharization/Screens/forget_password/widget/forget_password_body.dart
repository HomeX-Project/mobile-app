import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_x/core/util/colors.dart';
import 'package:home_x/core/widgets/custom_material_bottons.dart';
import 'package:home_x/core/widgets/custom_text_field.dart';
import 'package:home_x/feature/autharization/date/auth_forget_password/auth_cubit.dart';

class ForgetPasswordBodyScreen extends StatefulWidget {
  ForgetPasswordBodyScreen({super.key});

  @override
  State<ForgetPasswordBodyScreen> createState() => _ForgetPasswordBodyScreenState();
}

class _ForgetPasswordBodyScreenState extends State<ForgetPasswordBodyScreen> {
  final formKey = GlobalKey<FormState>();

  String? email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextFormField(
                onChange: (date) {
                  email = date;
                },
                hintText: "Email Adress",
              //  lableText: 'Email Adress',
                prefixIcon: const Icon(Icons.email_outlined),
                inputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return " please inter email";
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomMaterialBottons(
                  backgroundBottonsColors:AppColors.primaryColors,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<AppForgetPasswordCubit>(context)
                          .resetPasswordLink(email: email!);
                    }
                  },
                  text: 'email verify'),
            ]),
      ),
    );
  }
}
