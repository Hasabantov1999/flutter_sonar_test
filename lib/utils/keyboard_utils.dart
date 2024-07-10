// ignore_for_file: non_constant_identifier_names

import 'package:flutter/services.dart';

void KeyboardClose()=> SystemChannels.textInput.invokeMethod('TextInput.hide');