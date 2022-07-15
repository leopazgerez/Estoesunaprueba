// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

//import 'dart:html';

import 'package:flutter/material.dart';

/*void main() {
  //Esta funcion toma al Widget y lo hace la raiz del ArbolWidget
  //En este ejemplo, el arbol tiene 2 Widgets, 'CENTER' y su
  //hijo 'CHILD' el texto.\
  //La estructura fuerza a la raiz del arbol a cubrir la pantalla
  //con el texto, loque significa que va a estar centrado en 
  //la pantalla
  runApp(
    const Center(
        child: Text(
      'Hola querido mundo!!',
      textDirection: TextDirection.ltr,
    )),
  );
}*/
class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.title, super.key});
  //Los campos en una sublase Widget son siempre marcados como
  // 'Final'
  final Widget title;

  @override
  Widget build(BuildContext context) /*(Constructor de contexto)*/ {
    return Container(
        //permite crear un elemento visual rectangular
        height: 56.0, //en pixeles logicos(altura)
        padding: const EdgeInsets.symmetric(
            vertical: 8.0, horizontal: 6.0), //(Relleno)
        decoration: BoxDecoration(
          color: Colors.blue[600],
          border: Border.all(
            color: Colors.red,
            width: 4,
          ),
        ), //Decoracion
        //La fila es horizontal con diseno lineal
        child: Row(
          children: [
            const IconButton(
              icon: Icon(Icons.restore),
              tooltip: 'Navegation menu',
              onPressed: null, //nulo deshabilita el boton
            ),
            //'Expanded' expande este hijo para llenar el espacio
            //disponible
            Expanded(
              child: title,
            ),
            const IconButton(
              icon: Icon(Icons.agriculture),
              tooltip: 'Search',
              onPressed: null,
            ),
          ],
        ));
  }
}

class MyScaffold extends StatelessWidget /*(Widget sin estado)*/ {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    //'Material' es una pieza conceptual
    //de papel en donde el UI aparece
    return Material(
        //La columna tiene diseno lineal vertical
        child: Column(children: [
      MyAppBar(
        title: Text(
          ' Tantas lineas para solo esto',
          style: Theme.of(context).primaryTextTheme.headline6,
        ),
      ),
      const Expanded(
        child: Center(
          child: Text('El tipico: Hola Mundo!!'),
        ),
      ),
    ]));
  }
}

void main() {
  runApp(
    const MaterialApp(
      title: 'Mi aplicacion', //usado por el conmutador de tareas del S.O
      home: SafeArea(
        child: MyScaffold(),
      ),
    ),
  );
}
