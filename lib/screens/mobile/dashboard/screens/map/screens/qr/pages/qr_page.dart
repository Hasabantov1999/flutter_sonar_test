part of "../view/map_qr_view.dart";

class _QR extends StatefulWidget {
  const _QR(this.viewModel);
  final MapQrViewModel viewModel;
  @override
  State<_QR> createState() => _QRState();
}

class _QRState extends State<_QR> {
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  StreamSubscription<Barcode>? qrScanSubscription;
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  @override
  void dispose() {
    qrScanSubscription?.cancel();
    controller?.dispose();
    DeveloperLog.instance.logInfo("Qr Disposed Succesfully");
    super.dispose();
  }

  void onQRViewCreated(QRViewController controller) {
    DeveloperLog.instance.logInfo("Qr Created Succesfully");
    this.controller = controller;
    qrScanSubscription = controller.scannedDataStream.listen(
      (scanData) async {
        if (!widget.viewModel.stateBusy.value) {
          if (scanData.code != null) {
            widget.viewModel.reSearch(scanData.code!);
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderWidth: 5.w,
        borderRadius: 10.r,
        borderLength: 20,
        borderColor: context.appThemeExtensions.colors.primary,
      ),
    );
  }
}
