import 'package:validify/validify.dart';

class EmailValidator extends Validify {
  @override
  List<ValidatorFunction> get validators => [
        Validators.require(message: 'Email is required'),
        Validators.pattern(RegExp(r'^[^@]+@[^@]+\.[^@]+$'),
            message: 'Invalid email format'),
      ];
}
