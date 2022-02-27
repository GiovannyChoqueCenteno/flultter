import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/src/pages/direcciones_page.dart';
import 'package:qr_scanner/src/pages/mapas_page.dart';
import 'package:qr_scanner/src/providers/scan_provider.dart';
import 'package:qr_scanner/src/providers/ui_provider.dart';
import 'package:qr_scanner/src/widgets/custom_navigator.dart';
import 'package:qr_scanner/src/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Historial'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              final scanProvider =
                  Provider.of<ScanProvider>(context, listen: false);
              scanProvider.borrarTodos();
            },
            icon: const Icon(
              Icons.delete_forever,
            ),
          ),
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigatorBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Obtener el selected menuopt
    final scanProvider = Provider.of<ScanProvider>(context);
    final uiProvider = Provider.of<UIProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        scanProvider.cargarScanPorTipo('geo');
        return MapasPage();
      case 1:
        scanProvider.cargarScanPorTipo('http');
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }
}
