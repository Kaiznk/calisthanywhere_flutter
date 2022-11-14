import 'package:calistenico/src/models/exercise_model.dart';
import 'package:flutter/material.dart';

class DetallesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Exercise exercise =
        ModalRoute.of(context)?.settings.arguments as Exercise;

    return Scaffold(
      appBar: AppBar(
        title: Text('CalisthAnyWhere'),
      ),
      body: Column(
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/' + exercise.foto + '.png'),
            height: 210.0,
          ),
          SizedBox(height: 10.0),
          Text(
            exercise.nombre,
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(7.5),
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 18.0,
                  ),
                  Row(
                    children: <Widget>[
                      Text('Level:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text(exercise.nivel)
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      Text('Muscles:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 4.0,
                      ),
                      Flexible(child: Text(exercise.muscle))
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      Text('Previous exercises:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 4.0,
                      ),
                      Flexible(
                        child: Text(
                          exercise.previos,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      Text('It helps to achieve:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 4.0,
                      ),
                      Flexible(child: Text(exercise.ayudaA))
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      Text('Description:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 4.0,
                      ),
                      Flexible(child: Text(exercise.descripcion))
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      Text('Advice:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 4.0,
                      ),
                      Flexible(child: Text(exercise.consejo)),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
