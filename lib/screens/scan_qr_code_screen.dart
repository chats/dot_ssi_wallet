import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../services/core/connection_service.dart';
import 'message_screen.dart';

class ScanQrCodeScreen extends StatefulWidget {
  const ScanQrCodeScreen({super.key});
  static const routeName = '/scan_qr_code';
  @override
  State<ScanQrCodeScreen> createState() => _ScanQrCodeScreenState();
}

class _ScanQrCodeScreenState extends State<ScanQrCodeScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan QR Code"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(flex: 5, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: _isvalidCode(result) //(result != null)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Container(
                                  margin: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .primaryContainer, //, // Background color
                                        foregroundColor: Theme.of(context)
                                            .colorScheme
                                            .primary // Text Color (Foreground color)
                                        ),
                                    onPressed: () async {
                                      await controller?.resumeCamera();
                                    },
                                    child: const Text("Re-Scan"),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .primary, //, // Background color
                                        foregroundColor: Theme.of(context)
                                            .colorScheme
                                            .onPrimary // Text Color (Foreground color)
                                        ),
                                    onPressed: () async {
                                      //Navigator.pop(context, result!.code);
                                      final value = result!.code;
                                      if (value != null) {
                                        receiveInvitation(value)
                                            .then((value) => {setState(() {})});
                                        await controller?.resumeCamera();
                                        Get.to(MessageScreen())!
                                            .then((value) => {});
                                      }
                                    },
                                    child: Text("Connect"),
                                  ),
                                ),
                              ])
                        : Row(children: [])),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        controller.pauseCamera();
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.amber,
          content: Text('No Permission'),
        ),
      );
    }
  }

  bool _isvalidCode(Barcode? result) {
    if (result == null) return false;
    controller?.pauseCamera();
    //HapticFeedback.vibrate();
    return true;
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
