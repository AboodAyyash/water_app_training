import 'package:flutter/material.dart';
import 'package:start/shared/shared.dart';

Future customDataDialog({required String title, required List data}) {
  return showDialog(
    context: navigatorKey.currentState!.context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('${data[index].name}'),
                onTap: () {
                  Navigator.of(context).pop(data[index]);
                },
              );
            },
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
