import 'package:calistenico/src/models/exercise_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BarraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CalisthAnyWhere'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('exercises')
            .where('type',
                isEqualTo: 'barra') // Ajusta el filtro según necesites
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final exercises = snapshot.data!.docs.map((doc) {
            return Exercise(
              doc['nombre'],
              doc['nivel'],
              doc['muscle'],
              doc['previos'],
              doc['ayudaA'],
              doc['descripcion'],
              doc['consejo'],
              doc['foto'],
            );
          }).toList();

          return ListView.builder(
            padding: EdgeInsets.all(12.0),
            itemCount: exercises.length,
            itemBuilder: (context, i) => _cargarCards(context, exercises[i]),
          );
        },
      ),
    );
  }

  Widget _cargarCards(BuildContext context, Exercise exercise) {
    final card = Container(
      margin: EdgeInsets.all(3.0),
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/images/jar_loading.gif'),
            height: 200.0,
            fit: BoxFit.contain,
            image: AssetImage('assets/images/' + exercise.foto + '.png'),
          ),
          Container(
            child: Text(exercise.nombre),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text(exercise.nivel),
          ),
        ],
      ),
    );

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'detalle', arguments: exercise);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.grey,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, 10.0),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: card,
        ),
      ),
    );
  }
}
