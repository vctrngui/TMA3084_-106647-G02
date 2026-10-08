import 'dart:io';

void main() {
  print('=== Pizza Order Calculator ===');
  print('Prices: Small = 5 USD, Medium = 7 USD, Large = 10 USD');

  double grandTotal = 0;
  bool ordering = true;

  while (ordering) {
    // Input validation loop for size
    String size = '';
    while (true) {
      stdout.write('\nEnter pizza size (small/medium/large): ');
      size = (stdin.readLineSync() ?? '').trim().toLowerCase();
      if (size == 'small' || size == 'medium' || size == 'large') {
        break;
      }
      print('Invalid size. Please enter small, medium, or large.');
    }

    // Input validation loop for quantity
    int quantity = 0;
    while (true) {
      stdout.write('Enter quantity: ');
      int? input = int.tryParse((stdin.readLineSync() ?? '').trim());
      if (input != null && input > 0) {
        quantity = input;
        break;
      }
      print('Invalid quantity. Please enter a whole number greater than 0.');
    }

    // Calculate the total using switch
    int pricePerPizza;
    switch (size) {
      case 'small':
        pricePerPizza = 5;
        break;
      case 'medium':
        pricePerPizza = 7;
        break;
      case 'large':
        pricePerPizza = 10;
        break;
      default:
        pricePerPizza = 0;
    }

    double total = (pricePerPizza * quantity).toDouble();
    grandTotal += total;
    print('Order: $quantity x $size = \$${total.toStringAsFixed(2)}');

    // Continuous ordering
    stdout.write('Order another pizza? (y/n): ');
    String again = (stdin.readLineSync() ?? '').trim().toLowerCase();
    if (again != 'y') {
      ordering = false;
    }
  }

  print('\nTotal payment: \$${grandTotal.toStringAsFixed(2)}');
  print('Thank you for your order!');
}