import 'package:counter_cubit/src/service/api_service.dart';
import 'package:flutter/material.dart';

import 'src/my_app.dart';

void main() {
  runApp(MyApp(
    apiService: ApiService(),
  ));
}
