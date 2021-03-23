import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'sel_prod_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> lojas;
  Color mcolor;
  var strColor;
  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/dados.json').then((dadosData) {
      this.setState(() {
        lojas = json.decode(dadosData);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escolha uma Revenda'),
        // centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected: (value) {},
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 1,
                  child: Text('Melhor Avaliação'),
                ),
                PopupMenuItem(
                  value: 1,
                  child: Text('Mas Rapido'),
                ),
                PopupMenuItem(
                  value: 1,
                  child: Text('Mas Barato'),
                ),
              ];
            },
            icon: Icon(Icons.import_export_outlined),
          ),
          Icon(Icons.help_outline),
        ],
      ),
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              height: 95,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 240,
                    height: 95,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              'Botelhão 13kg em:',
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                          Text(
                            'Av. Paulista,1001',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Paulista,Sao Paulo, SP',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    width: 120,
                    height: 95,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Center(
                            child: Icon(
                              Icons.location_on,
                              color: Colors.blue,
                            ),
                          ),
                          Center(
                            child: Text(
                              'Mudar',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 17),
                              textAlign: TextAlign.end,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  //----------------------------------------------------------------------
                ],
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  //  width: 350,
                  color: Colors.white70,
                  height: (MediaQuery.of(context).size.height -
                      (100 + 56 + MediaQuery.of(context).padding.top)),
                  child: ListView.builder(
                      itemCount: lojas?.length ?? 0,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: InkWell(
                            child: Container(
                              //      color: Colors.green[100],
                              //  ink aca
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              width: 330,
                              height: 97,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 97,
                                    child: RotateTexto(
                                        tipo: lojas[index]['tipo'],
                                        colores: lojas[index]['cor']),
                                  ),
                                  Column(
                                    //  mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          RowSuperior(
                                              nome: lojas[index]['nome'],
                                              melhorpreco: lojas[index]
                                                  ['melhorPreco']),
                                        ],
                                      ),
                                      TresCamposRow(
                                        preco: lojas[index]['preco'],
                                        nota: lojas[index]['nota'],
                                        tempomedio: lojas[index]['tempoMedio'],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SelProdPage(
                                  nome: lojas[index]['nome'],
                                  preco: lojas[index]['preco'],
                                  tipo: lojas[index]['tipo'],
                                  nota: lojas[index]['nota'],
                                  tempoMedio: lojas[index]['tempoMedio'],
                                ),
                              ));
                              //builder: (context) => ContPage(tipo)
                            },
                          ),
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RotateTexto extends StatelessWidget {
  const RotateTexto({Key key, this.tipo, this.colores}) : super(key: key);
  final String tipo;
  final String colores;

  @override
  Widget build(BuildContext context) {
    Color newColor = Color(int.parse('0xff' + this.colores));
    return RotatedBox(
      quarterTurns: -1,
      child: Container(
        height: 20,
        width: 97,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
            color: newColor),

        //  color: newColor,
        alignment: Alignment(-1, -1),
        child: Center(
          child: Text(
            this.tipo,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class RowSuperior extends StatelessWidget {
  const RowSuperior({Key key, this.nome, this.melhorpreco}) : super(key: key);
  final String nome;
  final bool melhorpreco;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          // width: 150,
          height: 34,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 4, left: 8),
              child: Text(nome),
            ),
          ),
        ),
        SizedBox(
          width: 97,
        ),
        Container(
          height: 34,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 4,
            ),
            child: this.melhorpreco ? MellorPreco() : Container(),
          ),
        ),
      ],
    );
  }
}

class MellorPreco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
        color: Colors.orange,
      ),
      child: Center(
        child: Row(
          children: [
            Icon(Icons.label_important, color: Colors.white),
            Text(
              'Melhor preço ',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}

class TresCamposRow extends StatelessWidget {
  const TresCamposRow({
    Key key,
    this.preco,
    this.nota,
    this.tempomedio,
  }) : super(key: key);
  final double preco;
  final double nota;
  final String tempomedio;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Nota',
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${this.nota}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.star,
                      size: 15,
                      color: Colors.yellow,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 100,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: Text('Tiempo Medio'),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
                    child: Text(
                      '${this.tempomedio}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      bottom: 2,
                    ),
                    child: Text(
                      'min',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text('Preço'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'R\$ ${this.preco.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
