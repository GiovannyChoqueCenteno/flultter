import 'package:flutter/material.dart';
import 'package:qr_scanner/src/models/scan_model.dart';
import 'package:qr_scanner/src/providers/db_provider.dart';

class ScanProvider extends ChangeNotifier {
  List<ScanModel> _scans = [];
  String tipoSeleccionado = 'http';

  List<ScanModel> get scans => _scans;

  nuevoScan(String valor) async {
    final nuevoScan = ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    nuevoScan.id = id;
    if (tipoSeleccionado == nuevoScan.tipo) {
      scans.add(nuevoScan);
      notifyListeners();
    }
  }

  cargarScans() async {
    final scans = await DBProvider.db.getTodosLosScans();
    if (scans != null) _scans = [...scans];
    notifyListeners();
  }

  cargarScanPorTipo(String tipo) async {
    final scans = await DBProvider.db.getScansporTipo(tipo);
    _scans = [...scans];
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.deleteAllScans();
    _scans = [];
    notifyListeners();
  }

  borrarScanPorId(int? id) async {
    scans.removeWhere((element) => element.id == id);

    await DBProvider.db.deleteScan(id);
  }
}
