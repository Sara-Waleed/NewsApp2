
import 'package:flutter/material.dart';
import 'package:newwspp/layouts/Home.dart';
void main() {
  runApp(home());
}

// there are only two types of response data map or list
//any request to the internet requires waiting for its response
// so ypu should add async and await in this function
// the best feature in dio package is converting and string response into json directly
// but if you use http package to create a request you should convert your data into jason file