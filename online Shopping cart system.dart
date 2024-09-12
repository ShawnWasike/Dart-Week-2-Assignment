void main() {
  // List of item prices
  List<double> cartItems = [15.0, 25.0, 8.0, 12.5, 45.0];

  // Calculate the total price with optional tax parameter
  double totalPrice = calculateTotal(cartItems, taxRate: 0.1);  // 10% tax
  print('Total Price (with tax): \$${totalPrice.toStringAsFixed(2)}');

  // Filter out items below $10 using an anonymous function
  List<double> filteredItems = cartItems.where((item) => item >= 10).toList();
  print('Filtered Items (above \$10): $filteredItems');

  // Apply a discount using a higher-order function
  double discountRate = 0.2;  // 20% discount
  List<double> discountedItems = applyDiscount(filteredItems, (price) => price * (1 - discountRate));
  print('Discounted Items (20% off): $discountedItems');

  // Calculate total after discount
  double discountedTotal = calculateTotal(discountedItems, taxRate: 0.1);
  print('Discounted Total (with tax): \$${discountedTotal.toStringAsFixed(2)}');

  // Apply special factorial discount based on the number of items
  double finalPrice = applyFactorialDiscount(discountedTotal, filteredItems.length);
  print('Final Price (with factorial discount): \$${finalPrice.toStringAsFixed(2)}');
}

//// Standard Functions //// 

// Function to calculate the total price (with optional tax)
double calculateTotal(List<double> prices, {double taxRate = 0.0}) {
  double total = prices.reduce((sum, item) => sum + item);
  return total * (1 + taxRate);
}

//// Higher-Order Functions ////

// Function to apply a discount to a list of prices
List<double> applyDiscount(List<double> prices, double Function(double) discountFunction) {
  return prices.map(discountFunction).toList();
}

//// Recursive Functions ////

// Recursive function to calculate factorial discount
double calculateFactorialDiscount(int n) {
  if (n <= 1) return 1.0;
  return n * calculateFactorialDiscount(n - 1);
}

// Function to apply factorial discount based on the number of items
double applyFactorialDiscount(double totalPrice, int numItems) {
  double factorialDiscount = calculateFactorialDiscount(numItems);
  print('Applying a discount of $factorialDiscount% based on factorial of item count.');
  return totalPrice * (1 - (factorialDiscount / 100));
}
