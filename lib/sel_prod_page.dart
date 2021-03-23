import 'package:flutter/material.dart';

class SelProdPage extends StatefulWidget {
  const SelProdPage({
    Key key,
    this.nome,
    this.preco,
    this.tipo,
    this.nota,
    this.tempoMedio,
  }) : super(key: key);
  final String nome;
  final double preco;
  final String tipo;
  final double nota;
  final String tempoMedio;

  static String routerName = '/selprod';

  @override
  _SelProdPageState createState() => _SelProdPageState();
}

class _SelProdPageState extends State<SelProdPage> {
  int cantBot = 1;
  double total;

  @override
  void initState() {
    total = cantBot * this.widget.preco;
    total = cantBot * this.widget.preco;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double preco = this.widget.preco;

    String nome = this.widget.nome;
    String tipo = this.widget.tipo;
    double nota = this.widget.nota;
    String tempoMedio = this.widget.tempoMedio;

    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccionar Produtos'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '?',
                style: TextStyle(fontSize: 22),
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            ContainerSup(),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            '$cantBot',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                      width: 200,
                      child: Text(
                        nome + ' - ' + 'Botelhão 13kg ',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text('R\$'),
                    Container(
                      width: 70,
                      alignment: Alignment.centerRight,
                      child: Text(
                        '${total.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 46,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.home, size: 42),
                        ),
                      ]),
                      Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0),
                                child: Container(
                                  width: 180,
                                  child: Text(
                                    nome,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '$nota',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: Colors.yellow,
                                  ),
                                ],
                              ),
                              SizedBox(width: 10),
                              Container(
                                  width: 60,
                                  alignment: Alignment.bottomLeft,
                                  child: Text(tempoMedio + 'min')),
                              SizedBox(width: 10),
                              Container(
                                width: 90,
                                height: 20,
                                color: Colors.black,
                                child: Center(
                                  child: Text(
                                    tipo,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 5,
                    color: Colors.grey[200],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          botelhao(preco, nome),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row botelhao(double preco, String nome) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Text('Botijão de 13kg'),
              Text('$nome'),
              Row(
                children: [
                  Container(
                    height: 22,
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'R\$',
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        '${preco.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Column(
          children: [
            IconButton(
              icon: Icon(
                Icons.add_circle_outline,
                size: 25,
              ),
              onPressed: () {
                setState(() {
                  cantBot++;
                  total = preco * cantBot;
                });
              },
            ),
          ],
        ),
        Container(
          width: 32,
          height: 54,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/botelhao.png'),
                fit: BoxFit.cover,
                alignment: Alignment.center),
          ),
          child: Center(
            child: Center(
              child: Container(
                width: 17,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '$cantBot',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.remove_circle_outline,
            size: 25,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              if (cantBot > 1) {
                cantBot--;
              }

              total = preco * cantBot;
            });
          },
        ),
      ],
    );
  }
}

class ContainerSup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 12),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              color: Colors.white12,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.fiber_manual_record_sharp,
                      color: Colors.blue,
                      semanticLabel: 'comprar',
                    ),
                    focusColor: Colors.blue,
                    disabledColor: Colors.transparent,
                  ),
                  linea(84),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.fiber_manual_record_outlined,
                      color: Colors.black38,
                    ),
                    focusColor: Colors.blue,
                    disabledColor: Colors.black,
                  ),
                  linea(84),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.fiber_manual_record_outlined,
                      color: Colors.black38,
                    ),
                    focusColor: Colors.blue,
                    disabledColor: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 10),
            child: Container(
              color: Colors.white54,
              child: Row(
                //      mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Comprar'),
                  SizedBox(width: 68),
                  Text('Pagamento'),
                  SizedBox(width: 52),
                  Text('Confirmação'),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 3,
            height: 7,
            color: Colors.grey[200],
          ),
        ],
      ),
    );
  }

  Padding linea(double ancho) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        width: ancho,
        height: 1,
        color: Colors.grey,
      ),
    );
  }
}
