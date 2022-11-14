import 'package:flutter/material.dart';

class ConsejosNavigPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        padding: EdgeInsets.all(12.0),
        itemCount: _cargarDatos().length,
        itemBuilder: (context, i) => _cargarCards(context, _cargarDatos()[i]),
      ),
    );
  }

  Widget _cargarCards(BuildContext context, String consejo) {
    final card = Container(
      margin: EdgeInsets.all(3.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(13.0),
            child: Text(
              consejo,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Color.fromARGB(255, 255, 200, 0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }

  List<String> _cargarDatos() {
    List<String> tipsList = [];

    tipsList.add(
        "With the practice of this sport you will achieve, from a physical point of view, develop your body in a balanced and functional way, remaining strong and resistant. In addition, your body will adapt to any type of situation that requires a certain effort. ");
    tipsList.add(
        "Before strength training, prefer stretching for short periods, since you do not want to indicate to your muscles that it is time to rest before a new repetition, this could injure you and make you lose strength in your series. ");
    tipsList.add(
        "Calisthenics exercises can be made almost as complicated as you want. And, when your body weight falls short, you can use some simple elements to increase the difficulty.");
    tipsList.add(
        "Food is very important since the results of your body depend on it, it is not necessary to follow a diet, just try to eat healthy and eat a lot of protein.");
    tipsList.add(
        "Knowing the best calisthenics routines will allow you to continue your training wherever you are, whether it's on a trip you're taking or you're locked up at home longer than usual and you don't have material to train. With calisthenics your body becomes your own gym.");
    tipsList.add(
        "Many of you will want to gain muscle mass; for aesthetic reasons or to make strength exercises more affordable for you. To gain muscle you just have to eat more calories than you spend, but they must be good quality calories, it is worthless to eat large amounts of empty calorie foods such as ice cream, sugary soft drinks, industrial pastries and many others.");
    tipsList.add(
        "The main objective of this sport is to develop all the capacity of man in an integral and complete way, through physical practice and not only trying to enhance all his qualities such as strength and resistance, but also to create art with his body. and at the same time develop muscles in the upper and lower part of it. ");
    tipsList.add(
        "If you really want to increase your muscle mass quickly, you should eat food in the first 15 minutes after your training session. Mainly fruits or carbohydrates, and if it is in a liquid state better. This is because at that time your energy reserves are empty and any calories you eat will go directly to your muscles. ");
    tipsList.add(
        "Always remember to do a warm-up stage beforehand so that the muscles, tendons and ligaments warm up and gain flexibility, thus avoiding future injuries. ");
    tipsList.add(
        "You don't want to get ahead of yourself by wanting to do advanced moves. It is better to carry out the requirements and progressions in an adequate way and gradually the objectives will come out on their own.");
    tipsList.add(
        "You don't want to get ahead of yourself by wanting to do advanced moves. It is better to carry out the requirements and progressions in an adequate way and gradually the objectives will come out on their own..");
    tipsList.add(
        "All people can practice this art. There is no discrimination by sex or age to practice this discipline, there are disabled world representatives and they are motivation for many, in addition to taking advantage of the parallel bars as a method of rehabilitation and maintenance of good organic health. ");
    tipsList.add(
        "Always try to vary the muscle groups you train, if you can train them all. The more trained you have the muscles involved in an execution, the easier it will be to achieve it. ");
    tipsList.add(
        "The advantage of this sport is that you do not have to buy any equipment, you can do it at home, on the street, in the park or wherever you feel more comfortable outdoors.");
    tipsList.add(
        "If Toning is what you crave, look for fast and powerful reps. Static exercises that keep the muscles constantly active are ideal for this purpose.");
    tipsList.add(
        "The main objective of performing a proper warm-up is to activate the muscles, thus preparing the body to withstand various states of physical stress and thus avoid possible injuries. ");
    tipsList.add(
        "Remember that stretching after exercise is of the utmost importance to prevent injuries and promote transfer for the regeneration of fatigued muscles. ");
    tipsList.add(
        "The large number of movements, ranges and different types of exercises, together with the focus on gaining strength that is given to them, means that if you try other disciplines after mastering Calisthenics, you notice that you have a good initial level in them. ");
    tipsList.add(
        "Train your legs, do not forget about them. In this area are the largest muscles of the body and if you want to seriously increase your general muscle mass you must train them, the hormonal response that occurs is incomparable and will bring general benefits.");
    tipsList.add(
        "If one of your goals is to achieve a well-defined body, it is good that you take the practice of exercises as a way, but do not forget your diet, one of the most common mistakes among people is the thought that only physical activity is achieved. desired shape and this makes up only 20% of the results.");
    tipsList.add(
        "The muscles should rest at least 48 hours after intense training, although depending on the plan you have, you could train them daily. Keep in mind that these grow on rest and without it you would only be burning them.");
    tipsList.add(
        "There are different types of training. They can be full body, resistance, by muscle groups or perhaps to achieve a certain movement; choose one according to your objectives and from time to time exchange it with another so as not to fall into monotony.");
    tipsList.add(
        "Calisthenics proposes an immense variety of exercises, going through all levels and allowing to form a range of routines so diverse and entertaining that it is very difficult to feel bored in their development..");
    tipsList.add(
        "Once you get the basic knowledge and have certain experience doing Street Workout you will be able to design your own routines, in this way they will be adapted to your own body and you will get a better response.");
    tipsList.add(
        "The main way to progress in routines is by adding more difficult exercises, this is because the weight we move is always our own, which will allow you to see your progress with greater motivation.");
    tipsList.add(
        "When an injury occurs, you should see a doctor or physiotherapist as soon as possible. If it is not necessary, analyze what could be the movement that caused the pain and wait until you fully recover before using the affected part again. Do not feel bad if you have to go back a few difficulty levels, in the long run it will protect you from greater evils.");
    tipsList.add(
        "When you start doing physical exercises for the first time, it is advisable to do a routine in which you work the whole body, so you will get a solid base that you will need later.");
    tipsList.add(
        "Unless you are obese or already have decent below-fat muscle mass from previous training in another discipline, I don't recommend cutting to start in calisthenics. The beginning is the time to gain strength, gain muscle mass and since we have an extra ballast (fat) take advantage of it to gain the maximum strength possible.");
    tipsList.add(
        "Many will not be able to do a pull-up or dip, for this I always recommend doing the negative phase of the pull-up, that is, enduring the force exerted by gravity to lower your body when you are hanging from the bar.");
    tipsList.add(
        "If you manage to make the moment of training a moment of escape, in which you enjoy yourself and forget about all the pressures of everyday life, you have won a lot. With this feeling of enjoyment everything is easier, you will be constant and give everything in training.");
    tipsList.add(
        "Most exercises like the plank and the L-sit can be done in any of the main areas, practice them in all, on the bars, the parallel bars and the floor, this habit will improve your strength.");

    tipsList.shuffle();

    return tipsList;
  }
}
