// ignore_for_file: unused_element

part of "../view/map_qr_view.dart";

class _Text extends ViewModelWidget<MapQrViewModel> {
  const _Text(this.viewModel);
  final MapQrViewModel viewModel;
  @override
  Widget build(BuildContext context, MapQrViewModel viewModel) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: context.initialHorizantalPadding,
        child: AppLabelTextField(
          controller: viewModel.textController,
          textInputAction: TextInputAction.done,
          label: "QR Kodunu giriniz",
          onEditingComplete: () {
            viewModel.reSearch(viewModel.textController.text);
          },
        ),
      ),
    );
  }
}
