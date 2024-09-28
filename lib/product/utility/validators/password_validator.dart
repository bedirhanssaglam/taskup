import 'package:validify/validify.dart';

class PasswordValidator extends Validify {
  @override
  List<ValidatorFunction> get validators => [
        Validators.require(message: 'Password is required'),
        Validators.minLength(
          6,
          message: (length) =>
              'Password must be at least $length characters long',
        ),
      ];
}
