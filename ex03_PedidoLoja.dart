class ItemPedido {
  final String nome;
  final int quantidade;
  final double precoUnitario;

  ItemPedido({
    required this.nome,
    required this.quantidade,
    required this.precoUnitario,
  });

  double calcularSubtotal() {
    return this.quantidade * this.precoUnitario;
  }

  void exibirLinha() {
    print(
      'Quantidade: $quantidade - Nome: $nome - Preço Unitário: \$${precoUnitario.toStringAsFixed(2)} - Subtotal: \$${calcularSubtotal().toStringAsFixed(2)}',
    );
  }
}

class Pedido {
  final String cliente;
  final List<ItemPedido> itens = [];

  Pedido(this.cliente);

  void adicionarItem(ItemPedido item) {
    itens.add(item);
  }

  void mostrarResumo() {
    print('Resumo do Pedido para o cliente: $cliente');
    double total = 0.0;
    double subtotal = 0.0;
    double valorDesconto = 0.0;
    for (var item in itens) {
      item.exibirLinha();
      subtotal += item.calcularSubtotal();
    }
    if (subtotal > 200.0) {
      valorDesconto = subtotal * 0.1;
    }
    total = subtotal - valorDesconto;
    print('Subtotal : R\$ ${subtotal.toStringAsFixed(2)}');
    print('Desconto (10%) ${valorDesconto.toStringAsFixed(2)}');
    print('Total do Pedido: \$${total.toStringAsFixed(2)}');
  }
}

void main() {
  ItemPedido item1 = ItemPedido(
    nome: 'Teclado',
    quantidade: 1,
    precoUnitario: 150.0,
  );
  ItemPedido item2 = ItemPedido(
    nome: 'Mouse',
    quantidade: 2,
    precoUnitario: 89.90,
  );
  ItemPedido item3 = ItemPedido(
    nome: 'Mousepad',
    quantidade: 1,
    precoUnitario: 35.50,
  );

  Pedido pedido = Pedido('Carla');
  pedido.adicionarItem(item1);
  pedido.adicionarItem(item2);
  pedido.adicionarItem(item3);
  pedido.mostrarResumo();
}
