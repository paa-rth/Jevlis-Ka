import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 30,
      height: 30,
      child: CircularProgressIndicator(
        color: Color(0xFFFF3F00),
        strokeWidth: 1.5,
        backgroundColor: Colors.grey,
      ),
    );
  }
}
