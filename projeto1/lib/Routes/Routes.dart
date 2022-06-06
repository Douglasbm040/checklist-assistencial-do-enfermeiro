// ignore: file_names
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
class Routes {
  Nextpage(Context,Screen) {
                          Navigator.push(
                            Context,
                             MaterialPageRoute(
                                builder: (context) => Screen),
                          );
                        }
}