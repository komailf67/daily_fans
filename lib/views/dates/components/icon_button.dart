import 'package:flutter/material.dart';

class CustomIconButtun extends StatefulWidget {
  const CustomIconButtun({Key? key}) : super(key: key);

  @override
  _CustomIconButtunState createState() => _CustomIconButtunState();
}

class _CustomIconButtunState extends State<CustomIconButtun> {
  @override
  Widget build(BuildContext context) {
    var _isLoading = true;

    void _onSubmit() {
      print('object');
      setState(() => _isLoading = false);
      // Future.delayed(
      //   const Duration(seconds: 2),
      //   () => setState(() => _isLoading = false),
      // );
    }

    return IconButton(
      icon: _isLoading
          ? SizedBox(
              height: 15,
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
                strokeWidth: 3,
              ),
            )
          : Icon(
              Icons.share,
              color: Theme.of(context).primaryColor,
            ),
      color: Theme.of(context).primaryColor,
      // onPressed: () => controller.sendDatesToContacts(1), //TODO
      onPressed: () => _onSubmit(), //TODO
      iconSize: 25,
    );
  }
}
