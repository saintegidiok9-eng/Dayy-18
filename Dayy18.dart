class Product 
{
  final int id;
  final String name;
  final double price;

  Product(this.id, this.name, this.price);
}

class CartItem 
{
  final Product product;
  int quantity;

  CartItem(this.product, this.quantity);

  double get totalPrice => product.price * quantity;
}

class ShoppingCart 
{
  final List<CartItem> _items = [];

  void addProduct(Product product, int quantity) 
 {
    for (var item in _items) 
   {
      if (item.product.id == product.id) 
      {
        item.quantity += quantity;
        return;
      }
    }
    _items.add(CartItem(product, quantity));
  }

  void removeProduct(int productId) 
  {
    _items.removeWhere((item) => item.product.id == productId);
  }

  double get totalAmount 
 {
    double total = 0;
    for (var item in _items) 
    {
      total += item.totalPrice;
    }
    return total;
  }

  void printReceipt() 
  {
    for (var item in _items) 
    {
      print(
        "${item.product.name} x${item.quantity} = ${item.totalPrice}"
      );
    }
    print("Total: $totalAmount");
  }
}

void main() 
{
  Product p1 = Product(1, "Book", 50);
  Product p2 = Product(2, "Pen", 5);

  ShoppingCart cart = ShoppingCart();

  cart.addProduct(p1, 2);
  cart.addProduct(p2, 5);
  cart.addProduct(p1, 1);

  cart.printReceipt();
}
