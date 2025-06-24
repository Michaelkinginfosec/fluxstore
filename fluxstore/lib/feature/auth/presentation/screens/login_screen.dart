import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxstore/core/config/routes/route_names.dart';
import 'package:fluxstore/core/config/theme/app_style.dart';
import 'package:fluxstore/core/constants/app_size.dart';
import 'package:fluxstore/core/utils/snackbar_helper.dart';
import 'package:fluxstore/feature/auth/domain/entities/login_entity.dart';
import 'package:fluxstore/feature/auth/presentation/blocs/remote/remote_auth_bloc/auth_remote_bloc.dart';
import 'package:fluxstore/feature/auth/presentation/blocs/remote/remote_auth_bloc/auth_remote_event.dart';
import 'package:fluxstore/feature/auth/presentation/blocs/remote/remote_auth_bloc/auth_remote_state.dart';
import 'package:fluxstore/feature/auth/presentation/widgets/have_account.dart';
import 'package:fluxstore/feature/auth/presentation/widgets/login_form.dart';
import 'package:fluxstore/feature/auth/presentation/widgets/other_sign_in_method.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                AppSize.kHeight50,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Log into\nyour account",
                    style: AppStyle.primaryStyle,
                  ),
                ),
                AppSize.kHeight30,
                BlocConsumer<AuthRemoteBloc, AuthRemoteState>(
                  listener: (context, state) {
                    if (state is AuthRemoteSuccess) {
                      CustomSnackbar.show(context, state.message);
                      context.go(AppRoutes.home);
                    } else if (state is AuthRemoteFailure) {
                      CustomSnackbar.show(context, state.error, isError: true);
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthRemoteLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return LoginForm(
                      emailController: _emailController,
                      passwordController: _passwordController,
                      onTap: () {
                        if (_emailController.text.isEmpty ||
                            _passwordController.text.isEmpty) {
                          CustomSnackbar.show(
                            context,
                            "Please fill in all fields",
                            isError: true,
                          );
                          return;
                        }
                        final user = UserLoginEntity(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                        );
                        context.read<AuthRemoteBloc>().add(
                          LoginEventRequested(user),
                        );
                      },
                      passwordObscureText: _isPasswordVisible,
                      passwordSuffix:
                          _isPasswordVisible
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                      passwordTap: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    );
                  },
                ),
                //TODO: will come back to change the progresas indicatior to only on he button
                AppSize.kHeight20,
                Text("or log in with", style: AppStyle.signUpWith),
                AppSize.kHeight20,
                OtherSignInMethod(),
                AppSize.kHeight40,
                HaveAccount(
                  onTap: () => context.push(AppRoutes.signup),
                  title: "Don't have an account? ",
                  subTitle: "Sign Up",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
