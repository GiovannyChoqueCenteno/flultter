import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/src/providers/scan_provider.dart';
import 'package:qr_scanner/utils.dart';

class ScanTiles extends StatelessWidget {
  const ScanTiles({Key? key, required String tipo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanProvider = Provider.of<ScanProvider>(context);
    final scans = scanProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (context, i) => Dismissible(
        key: Key(scans[i].id.toString()),
        background: Container(
          color: Colors.red,
          child: Icon(Icons.delete),
        ),
        confirmDismiss: (direction) => showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('¿Desea eliminar este Mapa?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Provider.of<ScanProvider>(context, listen: false)
                          .borrarScanPorId(scans[i].id);
                      Navigator.of(context).pop();
                    },
                    child: Text('Aceptar'),
                  )
                ],
              );
            }),
        child: ListTile(
          onTap: () {
            launchURL(context, scans[i]);
          },
          leading: Icon(Icons.map, color: Theme.of(context).primaryColor),
          title: Text(scanProvider.scans[i].id.toString()),
          subtitle: Text('ID : 1'),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        ),
      ),
    );
  }
}
