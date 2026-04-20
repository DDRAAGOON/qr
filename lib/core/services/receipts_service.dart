import 'dart:typed_data';

class ReceiptModel {
  final String name;
  final String email;
  final String? assetImg;
  final Uint8List? memoryImg;
  final String status;

  ReceiptModel({
    required this.name,
    required this.email,
    this.assetImg,
    this.memoryImg,
    this.status = 'Pending Review',
  });
}

class ReceiptsService {
  // Singleton instance
  static final ReceiptsService _instance = ReceiptsService._internal();
  factory ReceiptsService() => _instance;
  ReceiptsService._internal();

  final List<ReceiptModel> _receipts = [
    ReceiptModel(
      name: 'Hamza ail',
      email: 'hamzaail249@gmail.com',
      assetImg: 'assets/receipts/receipt1.png',
    ),
    ReceiptModel(
      name: 'Marwan Ahmed',
      email: 'marooo004@gmail.com',
      assetImg: 'assets/receipts/receipt2.png',
    ),
    ReceiptModel(
      name: 'Ahmed Ail',
      email: 'ahmedali04@gmail.com',
      assetImg: 'assets/receipts/receipt3.png',
    ),
  ];

  List<ReceiptModel> get receipts => List.unmodifiable(_receipts);

  void addReceipt(ReceiptModel receipt) {
    _receipts.insert(0, receipt);
  }

  void removeReceiptAt(int index) {
    if (index >= 0 && index < _receipts.length) {
      _receipts.removeAt(index);
    }
  }
}
