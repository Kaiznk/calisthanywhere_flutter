import 'package:calistenico/src/models/exercise_model.dart';
import 'package:calistenico/src/models/routine_model.dart';

class RoutinesDB {
  RoutinesDB();

  List<Routine> getRutinas() {
    List<Routine> rutinas = [];

    //rutinas INICIADORAS
    rutinas.add(new Routine(-1, "First steps", 7, 3, 45, 180, _getPrimPasos(),
        getRep("First steps"), 'i_primeros_pasos', "Initiation routine"));
    rutinas.add(new Routine(
        -2,
        "Back, Abdominals and Triceps",
        7,
        3,
        45,
        120,
        _getEspAbsTri(),
        getRep("Back, Abdominals and Triceps"),
        'i_espalda_abs',
        "Initiation routine"));
    rutinas.add(new Routine(
        -3,
        "Chest, Abs and Biceps",
        7,
        3,
        45,
        120,
        _getPechAbsBic(),
        getRep("Chest, Abs and Biceps"),
        'i_pecho_abs',
        "Initiation routine"));
    rutinas.add(new Routine(
        -4,
        "Shoulders, Abs and Forearms",
        7,
        3,
        45,
        120,
        _getHomAbsAnte(),
        getRep("Shoulders, Abs and Forearms"),
        'i_homb_abs',
        "Initiation routine"));
    rutinas.add(new Routine(
        -5,
        "Chest, arms and back at home",
        5,
        2,
        45,
        120,
        _getPechBraEspHouse(),
        getRep("Chest, arms and back at home"),
        'i_pecho_house',
        "Initiation routine"));
    rutinas.add(new Routine(-6, "Iron abdominal", 7, 3, 45, 120, _getAbsHier(),
        getRep("Iron abdominal"), 'i_abs_hierro', "Initiation routine"));
    rutinas.add(new Routine(
        -7,
        "It's leg day friends!",
        7,
        3,
        45,
        120,
        _getLegss(),
        getRep("It's leg day friends!"),
        'i_diapiernasamig',
        "Initiation routine"));
    rutinas.add(new Routine(
        -8,
        "Full Max Cardio",
        7,
        3,
        45,
        120,
        _getMaxCardio(),
        getRep("Full Max Cardio"),
        'i_fullmaxcard',
        "Initiation routine"));

    //rutinas de Progresiones de movimientos
    rutinas.add(new Routine(-9, "Pistol Squat", 7, 3, 45, 120, _getPistolS(),
        getRep("Pistol Squat"), 'i_pistolsquat', "Movement progressions"));
    rutinas.add(new Routine(-10, "L Sit", 7, 3, 45, 120, _getLsit(),
        getRep("L Sit"), 'i_l_sit', "Movement progressions"));
    rutinas.add(new Routine(
        -11,
        "Superman Push Ups",
        7,
        3,
        45,
        120,
        _getSuperPush(),
        getRep("Superman Push Ups"),
        'i_supermanpush',
        "Movement progressions"));
    rutinas.add(new Routine(-12, "Pull Over", 7, 3, 45, 120, _getPullO(),
        getRep("Pull Over"), 'i_pullover', "Movement progressions"));
    rutinas.add(new Routine(-13, "Muscle Up", 7, 3, 45, 120, _getMuscl(),
        getRep("Muscle Up"), 'i_muscle_ups', "Movement progressions"));
    rutinas.add(new Routine(-14, "Back Lever", 7, 3, 45, 120, _getBacL(),
        getRep("Back Lever"), 'i_back_lever', "Movement progressions"));
    rutinas.add(new Routine(-15, "Front Lever", 7, 3, 45, 120, _getFronL(),
        getRep("Front Lever"), 'i_front_lever', "Movement progressions"));
    rutinas.add(new Routine(-16, "Handstand", 7, 3, 45, 120, _getHandS(),
        getRep("Handstand"), 'i_pino', "Movement progressions"));
    rutinas.add(new Routine(-17, "Human Flag", 7, 3, 45, 120, _getFlag(),
        getRep("Human Flag"), 'i_bandedra_humana', "Movement progressions"));
    rutinas.add(new Routine(
        -18,
        "Straddle Planche",
        7,
        3,
        45,
        120,
        _getStradl(),
        getRep("Straddle Planche"),
        'i_straddle',
        "Movement progressions"));
    rutinas.add(new Routine(-19, "Hefesto", 7, 3, 45, 120, _getHefesto(),
        getRep("Hefesto"), 'i_hefesto', "Movement progressions"));
    rutinas.add(new Routine(-20, "Full Planche", 7, 3, 45, 120, _getFulPlan(),
        getRep("Full Planche"), 'i_full_planche', "Movement progressions"));

    //Rutinas Generales
    rutinas.add(new Routine(-21, "Beast Mode", 7, 3, 45, 120, _getBeast(),
        getRep("Beast Mode"), 'i_modo_bestia', "General routine"));
    rutinas.add(new Routine(
        -22,
        "Breathe and pull",
        7,
        3,
        45,
        240,
        _getBrePul(),
        getRep("Breathe and pull"),
        'i_respira_tira',
        "General routine"));
    rutinas.add(new Routine(
        -23,
        "Breathe and push",
        7,
        3,
        45,
        240,
        _getBrePush(),
        getRep("Breathe and push"),
        'i_respira_empuja',
        "General routine"));
    rutinas.add(new Routine(
        -24,
        "Legs, Abdomen, Cardio and Pull/Push Ups",
        7,
        3,
        45,
        120,
        _getExplosiv(),
        getRep("Legs, Abdomen, Cardio and Pull/Push Ups"),
        'i_rutina_explosiva',
        "General routine"));
    rutinas.add(new Routine(
        -25,
        "Next Level Routine: Max",
        7,
        3,
        45,
        120,
        _getNextLevel(),
        getRep("Next Level Routine: Max"),
        'i_next_level',
        "General routine"));

    rutinas.add(new Routine(-26, "Jumper", 7, 3, 45, 120, _getJump(),
        getRep("Jumper"), 'i_jumper', "General routine"));
    rutinas.add(new Routine(-27, "Core Killer", 7, 3, 45, 120, _getCorKil(),
        getRep("Core Killer"), 'i_core_killer', "General routine"));
    rutinas.add(new Routine(-28, "Full Body", 7, 3, 45, 120, _getFulBod(),
        getRep("Full Body"), 'i_cuerpo_completo', "General routine"));
    rutinas.add(new Routine(
        -29,
        "2 by 2 Full Body - Pull-ups",
        7,
        3,
        45,
        120,
        _get2Dominadas(),
        getRep("2 by 2 Full Body - Pull-ups"),
        'i_2_2_dominadas',
        "General routine"));
    rutinas.add(new Routine(
        -30,
        "2 by 2 Full Body - Pushups",
        7,
        3,
        45,
        120,
        _get2Flexiones(),
        getRep("2 by 2 Full Body - Pushups"),
        'i_2_2_flexiones',
        "General routine"));
    rutinas.add(new Routine(
        -31,
        "2 by 2 Full Body - Core",
        7,
        3,
        45,
        120,
        _get2Core(),
        getRep("2 by 2 Full Body - Core"),
        'i_2_2_core',
        "General routine"));
    rutinas.add(new Routine(
        -32,
        "2 by 2 Full Body - Squats",
        7,
        3,
        45,
        120,
        _get2Squat(),
        getRep("2 by 2 Full Body - Squats"),
        'i_2_2_sentadillas',
        "General routine"));
    rutinas.add(new Routine(
        -33,
        "Challenge - Muscle Ups",
        33,
        33,
        15,
        15,
        _getChalMusc(),
        getRep("Challenge - Muscle Up"),
        'i_challenge_muscle',
        "General routine"));
    rutinas.add(new Routine(
        -34,
        "Challenge - Pull Ups",
        33,
        33,
        15,
        15,
        _getChalPul(),
        getRep("Challenge - Pull Ups"),
        'i_challenge_pull_ups',
        "General routine"));
    rutinas.add(new Routine(
        -35,
        "Next Level Routine: !!No limits!!",
        5,
        1,
        60,
        360,
        _getNoLimit(),
        getRep("Next Level Routine: !!No limits!!"),
        'i_sin_limites',
        "General routine"));

    return rutinas;
  }

  //rutinas iniciadoras
  List<Exercise> _getPrimPasos() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Jumping Jacks",
        "⭐",
        "Legs, especially calves. Strengthens the whole body.",
        "-",
        "Explosive squat.",
        "Stand with your feet together and your arms at your sides. Jump up, moving your feet and arms to the sides as you do. Keep moving your feet and arms out, until you're back on the ground, at which point your feet are wide apart and your arms are raised above your head. From this position, jump back up and bring your feet back to center and arms back to your sides. ",
        "",
        'jumping_jacks'));
    prim.add(new Exercise(
        "Push-ups",
        "⭐",
        "Chest and triceps ",
        "Incline push-ups, knee push-ups",
        "Clap push-ups, Superman push-ups.",
        "Push-ups just require you to push your body away from the ground, supporting yourself on your hands and toes and keeping your midsection tense.  ",
        "",
        'push_ups'));
    prim.add(new Exercise(
        "Plank",
        "⭐",
        "Abs and psoas.",
        "Short floor crunches, crunches. ",
        "Side Plank, Advanced Ab Plank.",
        "Place your forearms or hands on the floor, as you would for push-ups. Extend your feet behind your body and balance on your toes. Next, raise your hips until your shoulders, hips, knees, and ankles are in line. Hold this position as long as possible. ",
        "",
        'plank'));
    prim.add(new Exercise(
        "Chin-ups",
        "⭐",
        "Back and biceps. ",
        "Australian pull ups, negative and short pull-ups. ",
        "L Chin-up, Chin-up Muscle UP. ",
        "On the pull-up bar, holding your palms towards you, bend your arms until your chin goes over the bar and lower until your arms are straight.  ",
        "",
        'chin_ups'));
    prim.add(new Exercise(
        "Mountain Climbers",
        "⭐",
        "Abs",
        "-",
        "Knee raises in dips.",
        "Get into push-up position. Next, bring one of your knees as close to your chest as you can and return your leg to the starting position. Repeat the same movement with the other leg, alternating between both.",
        "",
        'mountain_climbers'));
    prim.add(new Exercise(
        "Crunches",
        "⭐",
        "ABS.",
        "Short crunches on the floor.",
        "Knee raises in dips.",
        "Lying on your back on the floor, bend your knees and keep your feet on the floor, perform an abdominal contraction so that your back rises off the ground and your head reaches your knee. ",
        "",
        'crunches'));
    prim.add(new Exercise(
        "Flutter Kicks",
        "⭐⭐",
        "Abs and psoas",
        "Plank, crunches.",
        "Leg raises on the floor, windshield wipers on the floor.",
        "Lying on your back, raise your legs just enough so that your heels do not touch the ground and start kicking like freestyle swimming. . ",
        "",
        'flutter_kicks'));

    return prim;
  }

  List<Exercise> _getEspAbsTri() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Pull-ups",
        "⭐",
        "Back and biceps. ",
        "Australian pull ups, negative and short pull-ups. ",
        "Explosive pull-ups, muscle up, bar row. ",
        "On the pull-up bar, holding your palms forward, bend your arms until your chin goes over the bar and lower until your arms are straight. ",
        "",
        'pull_ups'));
    prim.add(new Exercise(
        "Dips",
        "⭐",
        "Chest and triceps. ",
        "Bench dips, statics, short dips, negative dips. ",
        "Explosive dips, clip dips, elbow dips, korean dips.",
        "On parallel bars, support yourself with your arms and go down until the elbow reaches at least a 90o angle, go up until you lock your elbows. Basic Calisthenics exercise. ",
        "",
        'dips'));
    prim.add(new Exercise(
        "Mountain Climbers",
        "⭐",
        "ABS",
        "-",
        "Knee raises in dips.",
        "Get into push-up position. Next, bring one of your knees as close to your chest as you can and return your leg to the starting position. Repeat the same movement with the other leg, alternating between both..",
        "",
        'mountain_climbers'));
    prim.add(new Exercise(
        "Burpees",
        "⭐⭐",
        "Full body.",
        "Squats, push-ups, mountain climbers.",
        "advanced exercises.",
        "Squatting with the hands on the ground, both legs are extended behind and at the same time an elbow flexion is made, it returns to position 1 and from the previous position a vertical jump is made.",
        "",
        'burpees'));
    prim.add(new Exercise(
        "Leg Raises",
        "⭐⭐",
        "Abs, lumbar, psoas.",
        "L sit raises on bar.",
        "Windshield wipers, pullover.",
        "Hanging on the bar, bring your feet to it, trying not to bend your knees. ",
        "",
        'leg_raises'));

    return prim;
  }

  List<Exercise> _getPechAbsBic() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Chin-up",
        "⭐",
        "Back and biceps. ",
        "Australian pull ups, negative and short pull-ups. ",
        "L-sit Chin-up Muscle up, Chin-up Muscle up. ",
        "On the pull-up bar, holding your palms towards you, bend your arms until your chin goes over the bar and lower until your arms are straight.  ",
        "",
        'chin_ups'));
    prim.add(new Exercise(
        "Australian Pull Ups",
        "⭐",
        "Back and biceps. ",
        "Start with a high bar and go lower.",
        "Pull-ups",
        "On a low bar, do a rowing motion with an overhand grip. The difficulty can be adapted by varying the height of the bar. ",
        "",
        'australian_pull_ups'));
    prim.add(new Exercise(
        "Jumping Jacks",
        "⭐",
        "Legs, especially calves. Strengthens the whole body.",
        "-",
        "Explosive squat.",
        "Stand with your feet together and your arms at your sides. Jump up, moving your feet and arms to the sides as you do. Keep moving your feet and arms out, until you're back on the ground, at which point your feet are wide apart and your arms are raised above your head. From this position, jump back up and bring your feet back to center and arms back to your sides.. ",
        "",
        'jumping_jacks'));
    prim.add(new Exercise(
        "Push-ups",
        "⭐",
        "Chest and triceps",
        "Incline push-ups, knee push-ups",
        "Clap push-ups, Superman push-ups.",
        "Push-ups just require you to push your body away from the ground, supporting yourself on your hands and toes and keeping your midsection tense. Basic exercise of Calisthenics and Street Workout training. ",
        "",
        'push_ups'));
    prim.add(new Exercise(
        "Burpees",
        "⭐⭐",
        "Full body.",
        "Squats, push-ups, mountain climbers.",
        "Advanced exercises.",
        "Squatting with the hands on the ground, both legs are extended behind and at the same time an elbow flexion is made, it returns to position 1 and from the previous position a vertical jump is made.",
        "",
        'burpees'));
    prim.add(new Exercise(
        "Knee Raises",
        "⭐",
        "ABS, psoas. ",
        "knee raises on the floor.",
        "L sit raises on bar. ",
        "Hang from the bar and bring your knees to your chest, without bending your arms. In order to do repetitions correctly you must find the right rhythm. ",
        "",
        'knee_raises'));
    prim.add(new Exercise(
        "Decline push-ups",
        "⭐",
        "Chest, triceps and shoulders.",
        "Push-ups",
        "Pike push ups, hindu push ups, Assisted handstand pushups.",
        "Hands on the ground, feet elevated and the same movement as push-ups.",
        "",
        'decline_push_ups'));

    return prim;
  }

  List<Exercise> _getHomAbsAnte() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Pike Push Ups",
        "⭐⭐",
        "Chest, triceps and shoulders.",
        "Push-ups, decline push-ups.",
        "Hindu push ups, assisted handstand pushups.",
        "Hands and feet come closer, raising the hip. ",
        " Preparatory exercise for handstand work.",
        'pike_push_ups'));
    prim.add(new Exercise(
        "Australian Pull Ups",
        "⭐",
        "Back and biceps. ",
        "Start with a high bar and go down.",
        "Pull-ups",
        "On a low bar, do a rowing motion with an overhand grip. The difficulty can be adapted by varying the height of the bar. ",
        "",
        'australian_pull_ups'));
    prim.add(new Exercise(
        "Mountain Climbers",
        "⭐",
        "ABS",
        "-",
        "Dip knee raises.",
        "Get into push-up position. Next, bring one of your knees as close to your chest as you can and return your leg to the starting position. Repeat the same movement with the other leg, alternating between both.",
        "",
        'mountain_climbers'));
    prim.add(new Exercise(
        "Bench dips",
        "⭐",
        "Chest and triceps.",
        "Static positions, short repetitions, benches or bars with greater height.",
        "Static dips, short dips, dips, korean dips.",
        "On a bench or low bar, lie on your back with your hands on the edge.",
        "On a bench or low bar, lie on your back with your hands on the edge. It is a good exercise for those who cannot do normal dips. ",
        'bench_dips'));
    prim.add(new Exercise(
        "Burpees",
        "⭐⭐",
        "Full body.",
        "Squats, push-ups, mountain climbers.",
        "Advanced exercises.",
        "Squatting with the hands on the ground, both legs are extended behind and at the same time an elbow flexion is made, it returns to position 1 and from the previous position a vertical jump is made.",
        "",
        'burpees'));
    prim.add(new Exercise(
        "Tucked Planche",
        "⭐⭐",
        "Shoulders.",
        "Assisted handstand pushups, frog stand, planche lean.",
        "Tucked planche push ups, advanced tucked planche.",
        "Get into a frog position but with your arms outside your legs and lift your feet off the ground, first it is usually served with unlocked elbows and then with locked elbows. ",
        "",
        'tucked_planche'));
    prim.add(new Exercise(
        "Knee Raises",
        "⭐",
        "ABS, psoas. ",
        "Knee raises on the floor.",
        "L sit raises on bar. ",
        "Hang from the bar and bring your knees to your chest, without bending your arms. In order to do repetitions correctly you must find the right rhythm. ",
        "",
        'knee_raises'));

    return prim;
  }

  List<Exercise> _getPechBraEspHouse() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Australian Pull Ups under a table, bed or chair",
        "⭐",
        "Back and biceps. ",
        "-",
        "Pull-ups ",
        "Place your extended body under a table, bed or chair, grab onto the edge and pull to bring your body closer to the object. ",
        "The inverted row using a table is possibly one of the most ingenious exercises that we can do at home to work our back. If we cannot pull objects towards us, we will be the ones to pull ourselves towards objects.",
        'table_inverted_row'));
    prim.add(new Exercise(
        "Pike Push Ups",
        "⭐⭐",
        "Chest, triceps and shoulders.",
        "Push-ups, decline push-ups.",
        "Hindu push ups, Assisted handstand pushups.",
        "Hands and feet come closer, raising the hip. ",
        " Preparatory exercise for handstand work.",
        'pike_push_ups'));
    prim.add(new Exercise(
        "Push-ups",
        "⭐",
        "Chest and triceps ",
        "Incline push-ups, knee push-ups",
        "Clap push-ups, Superman push-ups.",
        "Push-ups only require you to push your body away from the ground, supporting yourself on your hands and toes and keeping your midsection tense.  ",
        "",
        'push_ups'));

    return prim;
  }

  List<Exercise> _getAbsHier() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Plank",
        "⭐",
        "ABS and psoas.",
        "Short crunches, full crunches. ",
        "Side Plank, Advanced Ab Plank.",
        "Place your forearms or hands on the floor, as you would for push-ups. Extend your feet behind your body and balance on your toes. Next, raise your hips until your shoulders, hips, knees, and ankles are in line. Hold this position as long as possible. ",
        "",
        'plank'));
    prim.add(new Exercise(
        "Mountain Climbers",
        "⭐",
        "ABS",
        "-",
        "Knee raises in dips.",
        "Get into push-up position. Next, bring one of your knees as close to your chest as you can and return your leg to the starting position. Repeat the same movement with the other leg, alternating between both.",
        "",
        'mountain_climbers'));
    prim.add(new Exercise(
        "Flutter Kicks",
        "⭐⭐",
        "ABS and psoas",
        "Plank, crunches.",
        "Leg raises on floor, windshield wipers on floor.",
        "Lying on your back, raise your legs just enough so that your heels do not touch the ground and start kicking like freestyle swimming. ",
        "",
        'flutter_kicks'));
    prim.add(new Exercise(
        "Burpees",
        "⭐⭐",
        "Full body.",
        "Squats, push-ups, mountain climbers.",
        "Advanced exercises.",
        "Squatting with the hands on the floor, both legs are extended behind and at the same time an elbow flexion is made, it returns to position 1 and from the previous position a vertical jump is made..",
        "",
        'burpees'));
    prim.add(new Exercise(
        "Crunches",
        "⭐",
        "ABS.",
        "Short crunches on the floor.",
        "Knee raises in dips.",
        "Lying face up on the floor, bend your knees and keep your feet on the floor, perform an abdominal contraction so that your back rises off the ground and your head goes to your knee. ",
        "",
        'crunches'));
    prim.add(new Exercise(
        "Knee Raises",
        "⭐",
        "ABS, psoas. ",
        "Knee raises on the floor.",
        "L sit raises on bar. ",
        "Hang from the bar and bring your knees to your chest, without bending your arms. In order to do repetitions correctly you must find the right rhythm. ",
        "",
        'knee_raises'));

    return prim;
  }

  List<Exercise> _getLegss() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Squat",
        "⭐",
        "Quadriceps and glutes",
        " Assisted squat, short squat.",
        "Explosive squat. ",
        "Stand with your heels shoulder-width apart and your arms hugging your chest or in front of your body. Bend your knees, keeping your back as straight as possible and looking straight ahead. Drive your hips back and down at the same time. As you lower your body, push your knees out and let your hips drop into the hollow of your knees. Also, make sure that your feet remain as flat as possible, and that no part of the sole leaves the ground at any time. Keep going as low as you physically can. From this lowest point, drive your hips up to the starting position. This counts as one repeat. ",
        "La sentadilla es un movimiento bastante complejo, con mucho juego entre los músculos y las articulaciones, y en realidad es bastante fácil de realizar incorrectamente. ",
        'squats'));
    prim.add(new Exercise(
        "Wall sit",
        "⭐",
        "Quadriceps.",
        "Assisted squat.",
        "Squat.",
        "Stand with your back against the wall and your knees bent, forming a 90° angle, hold in that position.",
        "",
        'wall_sit'));
    prim.add(new Exercise(
        "Lunges",
        "⭐",
        "Quadriceps and glutes.",
        "Short squat, squat.",
        "Bulgarian squat, explosive lunges with change.",
        "Stand with your feet shoulder-width apart and your hands at your sides. Take a step forward with one leg, as if taking a long stride. Make sure your heel hits the ground first, followed by the rest of your foot. From this position, bend both legs until the back knee is almost touching the ground. Try to keep your torso as upright as possible throughout the entire movement. From this lowest point, you can press hard with your front foot and return to the pi position, or you can press hard with your back leg and step forward. The first method can be done in a small area, obviously, since you are practically moving at one point, but the second requires a little more space, since you will have to move forward. ",
        "",
        'zancada'));
    prim.add(new Exercise(
        "Side lunges",
        "⭐",
        "Quadriceps, femoral, glutes.",
        "Lunges",
        "Explosive lunges with change, short squats to 1 leg, deep squat.",
        "Stand up and take a long step to the side, bending your knee while keeping the other knee straight. ",
        "",
        'zancadas_laterales'));
    prim.add(new Exercise(
        "Mountain Climbers",
        "⭐",
        "ABS",
        "-",
        "Knee raises on parallel bars.",
        "Get into push-up position. Next, bring one of your knees as close to your chest as you can and return your leg to the starting position. Repeat the same movement with the other leg, alternating between the two.",
        "",
        'mountain_climbers'));
    prim.add(new Exercise(
        "Leg Curl",
        "⭐",
        "Femoral and gluteal. ",
        " Do short repetitions and increase the range. ",
        "Do short repetitions and increase the range.",
        "Lie face up on the floor, bend your knees and lift your hips until your back is in line with your thighs. ",
        "",
        'curl_femoral'));

    return prim;
  }

  List<Exercise> _getMaxCardio() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Jumping Jacks",
        "⭐",
        "Legs, especially calves. Strengthens the whole body.",
        "-",
        "Explosive squat.",
        "Stand with your feet together and your arms at your sides. Jump up, moving your feet and arms to the sides as you do. Keep moving your feet and arms out, until you're back on the ground, at which point your feet are wide apart and your arms are raised above your head. From this position, jump back up and bring your feet back to center and arms back to your sides. ",
        "",
        'jumping_jacks'));
    prim.add(new Exercise(
        "Mountain Climbers",
        "⭐",
        "Abs",
        "-",
        "Knee raises on parallel bars.",
        "Get into push-up position. Next, bring one of your knees as close to your chest as you can and return your leg to the starting position. Repeat the same movement with the other leg, alternating between the two.",
        "",
        'mountain_climbers'));
    prim.add(new Exercise(
        "Front Kicks",
        "⭐",
        "Quadriceps and abdomen. ",
        "-",
        "Front kicks with squats.",
        "Standing, raise one knee to a 90-degree angle and kick forward, return to the starting position and repeat with the other leg.",
        "",
        'front_kicks'));
    prim.add(new Exercise(
        "Squat",
        "⭐",
        "Quadriceps and glutes",
        " Assisted squat, short squat.",
        "Explosive squat. ",
        "Stand with your heels shoulder-width apart and your arms hugging your chest or in front of your body. Bend your knees, keeping your back as straight as possible and looking straight ahead. Drive your hips back and down at the same time. As you lower your body, push your knees out and let your hips drop into the hollow of your knees. Also, make sure that your feet remain as flat as possible, and that no part of the sole leaves the ground at any time. Keep going as low as you physically can. From this lowest point, drive your hips up to the starting position. This counts as one repetition. ",
        "The squat is a fairly complex movement, with a lot of play between muscles and joints, and it's actually quite easy to perform incorrectly. ",
        'squats'));
    prim.add(new Exercise(
        "Burpees",
        "⭐⭐",
        "Full body.",
        "Squats, push-ups, mountain climbers.",
        "Advanced exercises.",
        "Squatting with the hands on the ground, both legs are extended behind and at the same time an elbow flexion is made, it returns to position 1 and from the previous position a vertical jump is made..",
        "",
        'burpees'));
    prim.add(new Exercise(
        "Lunges",
        "⭐",
        "Quadriceps and glutes.",
        "Short squat, squat.",
        "Bulgarian squat, explosive lunges with change.",
        "Stand with your feet shoulder-width apart and your hands at your sides. Take a step forward with one leg, as if taking a long stride. Make sure your heel hits the ground first, followed by the rest of your foot. From this position, bend both legs until the back knee is almost touching the ground. Try to keep your torso as upright as possible throughout the entire movement. From this lowest point, you can press hard with your front foot and return to the pi position, or you can press hard with your back leg and step forward. The first method can be done in a small area, obviously, since you are practically moving at one point, but the second requires a little more space, since you will have to move forward. ",
        "",
        'zancada'));
    prim.add(new Exercise(
        "Lunge-jump-squat",
        "⭐⭐",
        "Quadriceps and glutes.",
        "Squat, explosive squat, lunge.",
        "Bulgarian squat, explosive lunges with change.",
        "Stand with your feet shoulder-width apart, stride forward two steps, bring your feet together, and jump. Upon landing from the jump, perform a squat.  ",
        "",
        'lunges_jump_squat'));

    return prim;
  }

  List<Exercise> _getSuperPush() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Push-ups",
        "⭐",
        "Chest and triceps ",
        "Incline push-ups, knee push-ups",
        "Clap push-ups, Superman push-ups.",
        "Push-ups just require you to push your body away from the ground, supporting yourself on your hands and toes and keeping your midsection tense. Basic exercise of Calisthenics and Street Workout training. ",
        "",
        'push_ups'));
    prim.add(new Exercise(
        "Mountain Climbers",
        "⭐",
        "Abs",
        "-",
        "Knee raises on parallel bars.",
        "Get into push-up position. Next, bring one of your knees as close to your chest as you can and return your leg to the starting position. Repeat the same movement with the other leg, alternating between both.",
        "",
        'mountain_climbers'));
    prim.add(new Exercise(
        "Crunches",
        "⭐",
        "Abs.",
        "Short crunches on the floor.",
        "Knee raises on parallel bars.",
        "Lying face up on the floor, bend your knees and keep your feet on the floor, perform an abdominal contraction so that your back rises off the ground and your head goes to your knee. ",
        "",
        'crunches'));
    prim.add(new Exercise(
        "Skipping in site",
        "⭐",
        "Quadriceps and abdomen. ",
        "-",
        "Lunges",
        "Standing, raise one knee to form a 90 degree angle, lower it and raise the other. At the same time bring the opposite arm of the elevated leg to a 90 degree flexion to obtain complete coordination. It is done as if we were doing a race with the knees raised on the spot.",
        "Keep the hip elevated at all times, preventing it from descending when placing the foot on the ground and maintaining the position of the trunk, which should be kept straight and slightly inclined forward.",
        'skipping'));
    prim.add(new Exercise(
        "Explosive pushups",
        "⭐⭐",
        "Chest and triceps.",
        "Push-ups.",
        "Clap push-ups.",
        "As you stretch your arms, your hands come off the ground. In order to do this exercise correctly, you must increase the speed of execution of your normal push-ups.",
        "",
        'push_ups_multi'));
    prim.add(new Exercise(
        "Sprint",
        "⭐",
        "Legs",
        "Skipping in site",
        "-",
        "Carry out a race with an intensity level of 90% during the indicated time",
        "",
        'sprint'));
    prim.add(new Exercise(
        "Mountain Climbers",
        "⭐",
        "Abs",
        "-",
        "Knee raises on parallel bars.",
        "Get into push-up position. Next, bring one of your knees as close to your chest as you can and return your leg to the starting position. Repeat the same movement with the other leg, alternating between both..",
        "",
        'mountain_climbers'));
    prim.add(new Exercise(
        "Leg Plank",
        "⭐",
        "Lower back and glutes.",
        "-",
        "Hyperextensions",
        "Get into a push-up position and lift one of your legs as much as you can, until you notice the gluteus contracted well. Same with the other leg.",
        "",
        'leg_plank'));

    return prim;
  }

  //rutinas progresivas
  List<Exercise> _getPistolS() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Squats",
        "⭐",
        "Quadriceps and glutes",
        " Assisted squat, short squat.",
        "Explosive squat. ",
        "Stand with your heels shoulder-width apart and your arms hugging your chest or in front of your body. Bend your knees, keeping your back as straight as possible and looking straight ahead. Drive your hips back and down at the same time. As you lower your body, push your knees out and let your hips drop into the hollow of your knees. Also, make sure that your feet remain as flat as possible, and that no part of the sole leaves the ground at any time. Keep going as low as you physically can. From this lowest point, drive your hips up to the starting position. This counts as one repetition. ",
        "The squat is a fairly complex movement, with a lot of play between muscles and joints, and it's actually quite easy to perform incorrectly. ",
        'squats'));
    prim.add(new Exercise(
        "Wall sit",
        "⭐",
        "Quadriceps.",
        "Assisted squat.",
        "Squat.",
        "Stand with your back against the wall and your knees bent, forming an angle of 90°, hold in that position.",
        "",
        'wall_sit'));
    prim.add(new Exercise(
        "Skipping in site",
        "⭐",
        "Quadriceps and abdomen. ",
        "-",
        "Lunges",
        "Standing, raise one knee to form a 90 degree angle, lower it and raise the other. At the same time bring the opposite arm of the elevated leg to a 90 degree flexion to obtain complete coordination. It is performed as if we were doing a race with the knees raised on the spot.",
        "Keep the hip elevated at all times, preventing it from descending when placing the foot on the ground and maintaining the position of the trunk, which should be kept straight and slightly inclined forward.",
        'skipping'));
    prim.add(new Exercise(
        "Negative Pistol Squat",
        "⭐⭐⭐",
        "Quadriceps, hamstrings, glutes.",
        "Deep squat, assisted pistol squat.",
        "pistol squat.",
        "\tStand on one leg, with the other as horizontal as possible. Crouch down on the leg that is flat on the ground, keeping the heel planted. Putting your arms in front of your body can help you keep your balance. When you reach the bottom of the movement, come up with both legs, only the negative part of the Pistol Sqauts is performed in this exercise. ",
        "",
        'pistol_squat'));
    prim.add(new Exercise(
        "Side lunges",
        "⭐",
        "Quadriceps, hamstrings, glutes.",
        "Lunges",
        "Explosive switch lunges, 1-leg short squats, deep squats.",
        "Stand up and take a long step to the side, bending your knee while keeping the other knee straight. ",
        "",
        'zancadas_laterales'));
    prim.add(new Exercise(
        "Explosive Squat",
        "⭐⭐",
        "Quadriceps, glutes, calves.",
        "Squat, deep squat.",
        "Box jumps. ",
        "Perform a normal squat but when going up add explosiveness to the movement, so that you jump, for greater difficulty bring your knees to your chest. ",
        "",
        'squats'));
    prim.add(new Exercise(
        "Mountain Climbers",
        "⭐",
        "Abs",
        "-",
        "Knee raises on parallel bars.",
        "Get into push-up position. Next, bring one of your knees as close to your chest as you can and return your leg to the starting position. Repeat the same movement with the other leg, alternating between both",
        "",
        'mountain_climbers'));
    prim.add(new Exercise(
        "Plank",
        "⭐",
        "Abs and psoas.",
        "Short floor crunches, full crunches. ",
        "Side Plank, Advanced Ab Plank.",
        "Place your forearms or hands on the floor, as you would for push-ups. Extend your feet behind your body and balance on your toes. Next, raise your hips until your shoulders, hips, knees, and ankles are in line. Hold this position as long as possible. ",
        "",
        'plank'));
    prim.add(new Exercise(
        "Assisted Pistol Squat",
        "⭐⭐",
        "Quadriceps, hamstrings, glutes.",
        "Deep squat",
        "Pistol squat, negative pistol squat.",
        "Taking as support a tube in front of you, stand on one leg, and with the other placed as horizontal as you can. Crouch down on the leg that is flat on the ground, keeping the heel planted. Putting your arms in front of your body can help you keep your balance. When you reach the bottom of the movement, push back up to the starting position.  ",
        "",
        'pistol_squat'));

    return prim;
  }

  List<Exercise> _getLsit() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Leg Raises",
        "⭐⭐",
        "Abs, lumbar, psoas.",
        "Knee raises on bar.",
        "Windshield wipers, pullover.",
        "Hanging on the bar, bring your feet to it, trying not to bend your knees. ",
        "",
        'leg_raises'));
    prim.add(new Exercise(
        "Bench dips",
        "⭐",
        "Chest and triceps.",
        "Static positions, short repetitions, benches or bars with greater height.",
        "Static on dips, short dips, dips, korean dips.",
        "On a bench or low bar, lie on your back with your hands on the edge.",
        "On a bench or low bar, lie on your back with your hands on the edge. It is a good exercise for those who cannot do normal dips. ",
        'bench_dips'));
    prim.add(new Exercise(
        "Frog stand",
        "⭐",
        "Shoulders and triceps.",
        "Decline push-ups.",
        "Turtle planche.",
        "Squat on the ground with your arms inside your thighs, support your hands and lean forward until your feet are off the ground. The elbows remain flexed. ",
        "",
        'frog'));
    prim.add(new Exercise(
        "Skipping in site",
        "⭐",
        "Quadriceps and abdomen. ",
        "-",
        "Lunges",
        "Standing, raise one knee to form a 90 degree angle, lower it and raise the other. At the same time bring the opposite arm of the elevated leg to a 90 degree flexion to obtain complete coordination. It is done as if we were doing a race with the knees raised on the spot.",
        "Keep the hip elevated at all times, preventing it from descending when placing the foot on the ground and maintaining the position of the trunk, which should be kept straight and slightly inclined forward.",
        'skipping'));
    prim.add(new Exercise(
        "Flutter L Sit on the floor",
        "⭐",
        "Abs, psoas.",
        "L sit raises on parallel bars.",
        "L Sit",
        "Lie down in an L-sit position on the floor with one leg tucked in, hold the position for a few moments, and swap leg positions.",
        "",
        'l_sit_floor'));
    prim.add(new Exercise(
        "Burpees",
        "⭐⭐",
        "Full body.",
        "Squats, push-ups, mountain climbers.",
        "Advanced exercises.",
        "Squatting with the hands on the ground, both legs are extended behind and at the same time an elbow flexion is made, it returns to position 1 and from the previous position a vertical jump is made..",
        "",
        'burpees'));
    prim.add(new Exercise(
        "Mountain Climbers",
        "⭐",
        "Abs",
        "-",
        "Knee raises on parallel bars.",
        "Get into push-up position. Next, bring one of your knees as close to your chest as you can and return your leg to the starting position. Repeat the same movement with the other leg, alternating between both..",
        "",
        'mountain_climbers'));
    prim.add(new Exercise(
        "Squat",
        "⭐",
        "Quadriceps and glutes",
        " Assisted squat, short squat.",
        "Explosive squat. ",
        "Stand with your heels shoulder-width apart and your arms hugging your chest or in front of your body. Bend your knees, keeping your back as straight as possible and looking straight ahead. Drive your hips back and down at the same time. As you lower your body, push your knees out and let your hips drop into the hollow of your knees. Also, make sure that your feet remain as flat as possible, and that no part of the sole leaves the ground at any time. Keep going as low as you physically can. From this lowest point, drive your hips up to the starting position. This counts as one repetition.",
        "The squat is a fairly complex movement, with a lot of play between muscles and joints, and it's actually quite easy to perform incorrectly. ",
        'squats'));

    return prim;
  }

  List<Exercise> _getPullO() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Leg Raises",
        "⭐⭐",
        "Abs, lumbar, psoas.",
        "Knee raises on the bar.",
        "Windshield wipers, pullover.",
        "Hanging on the bar, bring your feet to it, trying not to bend your knees. ",
        "",
        'leg_raises'));
    prim.add(new Exercise(
        "Australian Pull Ups",
        "⭐",
        "Back and biceps. ",
        "Start with a high bar and work your way down.",
        "Pull-ups ",
        "On a low bar, do a rowing motion with an overhand grip. Difficulty can be adapted by varying the height of the bar. ",
        "",
        'australian_pull_ups'));
    prim.add(new Exercise(
        "Tucked Planche",
        "⭐⭐",
        "Shoulders.",
        "Assisted handstand push-ups, frog stand, planche lean.",
        "Tucked planche push ups, advanced tucked planche.",
        "Get into a frog position but with your arms outside your legs and lift your feet off the ground, first it is usually served with unlocked elbows and then with locked elbows. ",
        "",
        'tucked_planche'));
    prim.add(new Exercise(
        "Skipping in site",
        "⭐",
        "Quadriceps and abdomen. ",
        "-",
        "Lunges",
        "Standing, raise one knee to form a 90 degree angle, lower it and raise the other. At the same time bring the opposite arm of the elevated leg to a 90 degree flexion to obtain complete coordination. It is performed as if we were doing a race with the knees raised on the spot.",
        "Keep the hip elevated at all times, preventing it from descending when placing the foot on the ground and maintaining the position of the trunk, which should be kept straight and slightly inclined forward.",
        'skipping'));
    prim.add(new Exercise(
        "Scissors",
        "⭐⭐",
        "Abs and psoas ",
        "Plank, full crunches on the floor.",
        "Leg raises on floor, windshield wipers on floor.",
        "Lying on your back, raise your legs just enough so that your heels do not touch the ground, keep them there and cross them over and over again. ",
        "",
        'scissors'));
    prim.add(new Exercise(
        "Knee Raises",
        "⭐",
        "Abs, psoas. ",
        "Knee raises on the floor.",
        "L sit raises on bar. ",
        "Hang from the bar and bring your knees to your chest, without bending your arms. In order to do repetitions correctly you must find the right rhythm. ",
        "",
        'knee_raises'));
    prim.add(new Exercise(
        "Mountain Climbers",
        "⭐",
        "Abs",
        "-",
        "Knee raises on parallel bars.",
        "Get into push-up position. Next, bring one of your knees as close to your chest as you can and return your leg to the starting position. Repeat the same movement with the other leg, alternating between both",
        "",
        'mountain_climbers'));

    return prim;
  }

  List<Exercise> _getMuscl() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Pull-ups",
        "⭐",
        "Back and biceps. ",
        "Australian pull ups, negative and short pull-ups. ",
        "Explosive pull-ups, muscle up, bar row. ",
        "On the pull-up bar, holding your palms forward, bend your arms until your chin goes over the bar and lower until your arms are straight. ",
        "",
        'pull_ups'));
    prim.add(new Exercise(
        "Push-ups",
        "⭐",
        "Chest and triceps",
        "Incline push-ups, knee push-ups",
        "Clap push-ups, Superman push-ups.",
        "Push-ups just require you to push your body away from the ground, supporting yourself on your hands and toes and keeping your midsection tense. Basic exercise of Calisthenics and Street Workout training. ",
        "",
        'push_ups'));
    prim.add(new Exercise(
        "Skipping in site",
        "⭐",
        "Quadriceps and abdomen. ",
        "-",
        "Lunges",
        "Standing, raise one knee to form a 90 degree angle, lower it and raise the other. At the same time bring the opposite arm of the elevated leg to a 90 degree flexion to obtain complete coordination. It is done as if we were doing a race with the knees raised on the spot.",
        "Keep the hip elevated at all times, preventing it from descending when placing the foot on the ground and maintaining the position of the trunk, which should be kept straight and slightly inclined forward.",
        'skipping'));
    prim.add(new Exercise(
        "Knee Raises",
        "⭐",
        "Abs, psoas. ",
        "knee raises on the floor.",
        "L sit raises on bar. ",
        "Hang from the bar and bring your knees to your chest, without bending your arms. In order to do repetitions correctly you must find the right rhythm. ",
        "",
        'knee_raises'));
    prim.add(new Exercise(
        "Burpees",
        "⭐⭐",
        "Full body.",
        "Squats, push-ups, mountain climbers.",
        "Advanced exercises.",
        "Squatting with the hands on the ground, both legs are extended behind and at the same time an elbow flexion is made, returning to position 1 and from the previous position a vertical jump is made.",
        "",
        'burpees'));
    prim.add(new Exercise(
        "Straight bar dips",
        "⭐⭐",
        "Chest and triceps.",
        "Dips.",
        "Muscle up, one arm dips.",
        "Perform dips by placing both hands on the same bar. Try to lower yourself until your chest grazes the bar. ",
        "",
        'straight_bar_dips'));
    prim.add(new Exercise(
        "Mountain Climbers",
        "⭐",
        "Abs",
        "-",
        "Knee raises in dips.",
        "Get into push-up position. Next, bring one of your knees as close to your chest as you can and return your leg to the starting position. Repeat the same movement with the other leg, alternating between both..",
        "",
        'mountain_climbers'));

    return prim;
  }

  List<Exercise> _getBacL() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Flutter Kicks",
        "⭐⭐",
        "Abs and psoas",
        "Plank, full crunches on the floor.",
        "Leg raises en suelo, windshield wipers en suelo.",
        "Lying on your back, raise your legs just enough so that your heels do not touch the ground and start freestyle swimming kicks. ",
        "",
        'flutter_kicks'));
    prim.add(new Exercise(
        "Skipping in site",
        "⭐",
        "Quadriceps and abdomen. ",
        "-",
        "Lunges",
        "Standing, raise one knee to form a 90 degree angle, lower it and raise the other. At the same time bring the opposite arm of the elevated leg to a 90 degree flexion to obtain complete coordination. It is done as if we were doing a race with the knees raised on the spot.",
        "Keep the hip elevated at all times, preventing it from descending when placing the foot on the ground and maintaining the position of the trunk, which should be kept straight and slightly inclined forward.",
        'skipping'));
    prim.add(new Exercise(
        "Knee Raises",
        "⭐",
        "Abss, psoas. ",
        "Knee raises on the floor.",
        "L sit raises on bar. ",
        "Hang from the bar and bring your knees to your chest, without bending your arms. In order to do repetitions correctly you must find the right rhythm.",
        "",
        'knee_raises'));
    prim.add(new Exercise(
        "Burpees",
        "⭐⭐",
        "Full body.",
        "Squats, push-ups, mountain climbers.",
        "Advanced exercises.",
        "Squatting with the hands on the ground, both legs are extended behind and at the same time an elbow flexion is made, returning to position 1 and from the previous position a vertical jump is made.",
        "",
        'burpees'));
    prim.add(new Exercise(
        "Dips",
        "⭐",
        "Chest and triceps.",
        "Bank dips, static dips, short dips, negative dips. ",
        "Explosive dips, clap dips, elbow dips, Korean dips.",
        "On parallel bars, support yourself with your arms and go down until the elbow reaches at least a 90o angle, go up until you lock your elbows. Basic Calisthenics exercise. ",
        "",
        'dips'));
    prim.add(new Exercise(
        "Mountain Climbers",
        "⭐",
        "ABS",
        "-",
        "Knee raises en fondos.",
        "Colocate en la posición de flexiones. A continuación, lleva una de las rodillas lo más cerca del pecho  que puedas y regresa la pierna a la posición inicial. Repite el mismo movimiento con la otra pierna, alternando entre ambas.",
        "",
        'mountain_climbers'));
    prim.add(new Exercise(
        "Hold Bar",
        "⭐",
        " Forearms (grip)",
        "Australian pull ups.",
        "Pull-ups, scapular retractions.",
        "On a pull-up bar, hang in an overhand grip and hold in that position. ",
        "",
        'push_ups_multi'));
    prim.add(new Exercise(
        "Bench dips",
        "⭐",
        "Chest and triceps.",
        "Static positions, short repetitions, benches or bars with greater height.",
        "Static on dips, short dips, dips, korean dips.",
        "On a bench or low bar, lie on your back with your hands on the edge.",
        "On a bench or low bar, lie on your back with your hands on the edge. It is a good exercise for those who cannot do normal dips. ",
        'bench_dips'));

    return prim;
  }

  List<Exercise> _getFronL() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Scissors",
        "⭐⭐",
        "Abs and psoas ",
        "Plank, full crunches on the floor.",
        "Leg raises on the floor, windshield wipers on the floor.",
        "Lying on your back, raise your legs just enough so that your heels do not touch the ground, keep them there and cross them over and over again.",
        "",
        'scissors'));
    prim.add(new Exercise(
        "Pull-ups",
        "⭐",
        "Back and biceps. ",
        "Australian pull ups, negative and short pull-ups. ",
        "Explosive pull-ups, muscle up, bar row. ",
        "On the pull-up bar, holding your palms forward, bend your arms until your chin goes over the bar and lower until your arms are straight. ",
        "",
        'pull_ups'));
    prim.add(new Exercise(
        "Skipping in site",
        "⭐",
        "Quadriceps and abdomen. ",
        "-",
        "Lunges",
        "Standing, raise one knee to form a 90 degree angle, lower it and raise the other. At the same time bring the opposite arm of the elevated leg to a 90 degree flexion to obtain complete coordination. It is done as if we were doing a race with the knees raised on the spot.",
        "Keep the hip elevated at all times, preventing it from descending when placing the foot on the ground and maintaining the position of the trunk, which should be kept straight and slightly inclined forward.",
        'skipping'));
    prim.add(new Exercise(
        "Burpees",
        "⭐⭐",
        "Full body.",
        "Squats, push-ups, mountain climbers.",
        "Advanced exercises.",
        "Squatting with the hands on the ground, both legs are extended behind and at the same time an elbow flexion is made, it returns to position 1 and from the previous position a vertical jump is made..",
        "",
        'burpees'));
    prim.add(new Exercise(
        "Dragon Flag",
        "⭐⭐⭐",
        "Dorsal and abs. ",
        "Dragon flag 1 leg.",
        "Front lever. ",
        "On a bar near the ground, on your back with your head close to it, use an overhand grip and stay at a 45° angle, with both legs straight and only your upper back on the ground. ",
        "",
        'dragon_flag'));
    prim.add(new Exercise(
        "Headbangers",
        "⭐⭐",
        "Back and biceps.",
        "Chin-ups",
        "L chin-ups, chin-up muscle up.",
        "In a chin-up position with your arms bent, perform short pull-ups trying to go down as little as possible, so that the movement is almost horizontal.",
        "",
        'headbangers'));
    prim.add(new Exercise(
        "Mountain Climbers",
        "⭐",
        "Abs",
        "-",
        "Knee raises in dips.",
        "Get into push-up position. Next, bring one of your knees as close to your chest as you can and return your leg to the starting position. Repeat the same movement with the other leg, alternating between both",
        "",
        'mountain_climbers'));
    prim.add(new Exercise(
        "Tucked Front Lever",
        "⭐⭐",
        "Dorsal and abs.",
        "Pull-ups and leg raises.",
        "1 leg front lever.",
        "Stand on the bar with an overhand grip and bring your knees to your chest, keeping your arms straight and trying to keep your back parallel to the ground.",
        "",
        'tuck_front_lever'));

    return prim;
  }

  List<Exercise> _getHandS() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Push-ups",
        "⭐",
        "Chest and triceps ",
        "Incline push-ups, Knee push-ups",
        "Clap push-ups, Superman push-ups.",
        "Push-ups just require you to push your body away from the ground, supporting yourself on your hands and toes and keeping your midsection tense. Basic exercise of Calisthenics and Street Workout training. ",
        "",
        'push_ups'));
    prim.add(new Exercise(
        "Climb the wall",
        "⭐",
        " Shoulder, triceps and core.",
        "Hindu push ups, assisted handstand pushups.",
        "Handstand walking, handstand.",
        "Place your feet on the wall and go up until you are doing a handstand facing the wall.",
        "",
        'wall_handstand'));
    prim.add(new Exercise(
        "Skipping in site",
        "⭐",
        "Quadriceps and abdomen. ",
        "-",
        "Lunges",
        "Standing, raise one knee to form a 90 degree angle, lower it and raise the other. At the same time bring the opposite arm of the elevated leg to a 90 degree flexion to obtain complete coordination. It is done as if we were doing a race with the knees raised on the spot.",
        "Keep the hip elevated at all times, preventing it from descending when placing the foot on the ground and maintaining the position of the trunk, which should be kept straight and slightly inclined forward.",
        'skipping'));
    prim.add(new Exercise(
        "The Hollow",
        "⭐⭐",
        "Abs and psoas ",
        "Crunches",
        "Floor leg raises .",
        "Lie on your back, with your legs extended and your arms by your sides. She lifts her shoulders and upper back off the ground, and lifts her hands off the ground. Then lift your legs off the ground, making sure your lower and mid-back stay off the ground. Imagine pressing your spine down as hard as you can, or trying to bring your navel toward the ground. Now hold the position for as long as you can. ",
        "",
        'hollow'));
    prim.add(new Exercise(
        "Burpees",
        "⭐⭐",
        "Full body.",
        "Squats, push-ups, mountain climbers.",
        "Advanced exercises.",
        "Squatting with the hands on the ground, both legs are extended behind and at the same time an elbow flexion is made, it returns to position 1 and from the previous position a vertical jump is made..",
        "",
        'burpees'));
    prim.add(new Exercise(
        "Mountain Climbers",
        "⭐",
        "Abs",
        "-",
        "Knee raises on parallel bars.",
        "Get into push-up position. Next, bring one of your knees as close to your chest as you can and return your leg to the starting position. Repeat the same movement with the other leg, alternating between both",
        "",
        'mountain_climbers'));
    prim.add(new Exercise(
        "Plank",
        "⭐",
        "Abs and psoas.",
        "Short floor crunches, full floor crunches. ",
        "Side plank, advanced abdominal plank.",
        "Place your forearms or hands on the floor, as you would for push-ups. Extend your feet behind your body and balance on your toes. Next, raise your hips until your shoulders, hips, knees, and ankles are in line. Hold this position as long as possible. ",
        "",
        'plank'));
    prim.add(new Exercise(
        "Frog stand",
        "⭐",
        "Shoulders and triceps.",
        "Decline push-ups.",
        "Turtle planche.",
        "Squat on the ground with your arms inside your thighs, support your hands and lean forward until your feet are off the ground. The elbows remain flexed. ",
        "",
        'frog'));

    return prim;
  }

  List<Exercise> _getFlag() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Pull-ups",
        "⭐",
        "Back and biceps. ",
        "Australian pull ups, negative and short pull-ups. ",
        "Explosive pull-ups, muscle up, bar row. ",
        "On the pull-up bar, holding your palms forward, bend your arms until your chin goes over the bar and lower until your arms are straight. ",
        "",
        'pull_ups'));
    prim.add(new Exercise(
        "Climb the wall",
        "⭐",
        " Shoulder, triceps and core.",
        "Hindu push ups, assisted handstand pushups.",
        "Handstand walking, handstand.",
        "Place your feet on the wall and go up until you are doing a handstand facing the wall.",
        "",
        'wall_handstand'));
    prim.add(new Exercise(
        "Skipping in site",
        "⭐",
        "Quadriceps and abdomen. ",
        "-",
        "Lunges",
        "Standing, raise one knee to form a 90 degree angle, lower it and raise the other. At the same time bring the opposite arm of the elevated leg to a 90 degree flexion to obtain complete coordination. It is done as if we were doing a race with the knees raised on the spot.",
        "Keep the hip elevated at all times, preventing it from descending when placing the foot on the ground and maintaining the position of the trunk, which should be kept straight and slightly inclined forward..",
        'skipping'));
    prim.add(new Exercise(
        "Tucked Human Flag",
        "⭐⭐",
        "Back and shoulders.",
        "Wide and mixed grip pull-ups, assisted handstand push-ups.",
        "Fallen Human Flag.",
        "On some trellis bars or a vertical bar, place one hand higher than your head and the other at waist height, bring your knees to your chest and try to stay in that position.",
        "",
        'human_flag'));
    prim.add(new Exercise(
        "Burpees",
        "⭐⭐",
        "Full body.",
        "Squats, push-ups, mountain climbers.",
        "Advanced exercises.",
        "Squatting with the hands on the ground, both legs are extended behind and at the same time an elbow flexion is made, it returns to position 1 and from the previous position a vertical jump is made.",
        "",
        'burpees'));
    prim.add(new Exercise(
        "Leg Raises on the floor",
        "⭐⭐",
        "Abs, lumbar, psoas.",
        "Knee raises on the bar.",
        "Windshield wipers, pullover.",
        "Lying on the floor raise your feet until they form a 90 degree angle with your torso, when raising your feet keep your legs straight. ",
        "",
        'leg_raises'));
    prim.add(new Exercise(
        "Mountain Climbers",
        "⭐",
        "Abs",
        "-",
        "Knee raises on parallel bars.",
        "Get into push-up position. Next, bring one of your knees as close to your chest as you can and return your leg to the starting position. Repeat the same movement with the other leg, alternating between both",
        "",
        'mountain_climbers'));
    prim.add(new Exercise(
        "Plank",
        "⭐",
        "Abs y psoas.",
        "Short floor crunches, full floor crunches. ",
        "Plank, advanced abdominal plank.",
        "Place your forearms or hands on the floor, as you would for push-ups. Extend your feet behind your body and balance on your toes. Next, raise your hips until your shoulders, hips, knees, and ankles are in line. Hold this position as long as possible. ",
        "",
        'plank'));
    prim.add(new Exercise(
        "Side Plank",
        "⭐",
        "Abdominals, mainly the Obliques. ",
        "Plank.",
        "Windshield wipers on floor, human flag.",
        "Place one forearm on the ground and extend your legs to 0 degrees of this arm. Place the bottom foot on its side, and the other foot on top of the first. Next, lift your hips up to form a straight line that can be drawn by joining your shoulders, hips, knees, and ankles. Your midsection should be parallel to the ground, and you should feel tension in your obliques closest to the floor.",
        "",
        'side_plank'));
    prim.add(new Exercise(
        "Side Plank",
        "⭐",
        "Abdominals, mainly the Obliques. ",
        "Plank",
        "Windshield wipers on floor, human flag.",
        "Place one forearm on the ground and extend your legs to 0 degrees of this arm. Place the bottom foot on its side, and the other foot on top of the first. Next, lift your hips up to form a straight line that can be drawn by joining your shoulders, hips, knees, and ankles. Your midsection should be parallel to the ground, and you should feel tension in your obliques closest to the ground. ",
        "",
        'side_plank'));

    return prim;
  }

  List<Exercise> _getStradl() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Tucked Planche",
        "⭐⭐",
        "Shoulders.",
        "Assisted handstand pushups, frog stand, planche lean.",
        "Tucked planche push ups, advanced tucked planche.",
        "Get into a frog position but with your arms outside your legs and lift your feet off the ground, usually delivered first with unlocked elbows and then with locked elbows.",
        "",
        'tucked_planche'));
    prim.add(new Exercise(
        "Push-ups",
        "⭐",
        "Chest and triceps ",
        "Incline push-ups, knee push-ups",
        "Clap push-ups, Superman push-ups.",
        "Push-ups just require you to push your body away from the ground, supporting yourself on your hands and toes and keeping your midsection tense. Basic exercise of Calisthenics and Street Workout training. ",
        "",
        'push_ups'));
    prim.add(new Exercise(
        "Skipping in site",
        "⭐",
        "Quadriceps and abdomen. ",
        "-",
        "Lunges",
        "Standing, raise one knee to form a 90 degree angle, lower it and raise the other. At the same time bring the opposite arm of the elevated leg to a 90 degree flexion to obtain complete coordination. It is done as if we were doing a race with the knees raised on the spot.",
        "Keep the hip elevated at all times, preventing it from descending when placing the foot on the ground and maintaining the position of the trunk, which should be kept straight and slightly inclined forward.",
        'skipping'));
    prim.add(new Exercise(
        "Pseudo planche",
        "⭐⭐",
        "Chest, triceps and shoulders.",
        "Decline pushups, hindu push ups.",
        "Planche lean, frog stand, tucked planche.",
        "The hands are placed at the level of the navel and the common push-ups are done.",
        "",
        'pseudo_planche_push_up'));
    prim.add(new Exercise(
        "frog stand inside and outside",
        "⭐⭐",
        "Shoulders and triceps.",
        "Decline pushups.",
        "Turtle planche.",
        "In frog position take your feet back a little as if you were going to straddle and return to the frog",
        "",
        'frog'));
    prim.add(new Exercise(
        "Burpees",
        "⭐⭐",
        "Full body.",
        "Squats, push-ups, mountain climbers.",
        "Advanced exercises.",
        "Squatting with the hands on the ground, both legs are extended behind and at the same time an elbow flexion is made, returning to position 1 and from the previous position a vertical jump is made.",
        "",
        'burpees'));
    prim.add(new Exercise(
        "Planche to the wall",
        "⭐⭐",
        "Shoulders.",
        "Assisted handstand push-ups, frog stand.",
        "Straddle Planche, Full Planche",
        "Get into position as if you were going to perform a full planche, but in this case put the tips of your toes against the wall, at the height they would be if you supported yourself only with your hands.",
        "To place your feet on the wall, do a short back climb and lean as little as possible on your feet when you reach the position.",
        'full_planche'));
    prim.add(new Exercise(
        "Plank",
        "⭐",
        "Abs and psoas.",
        "Short floor crunches, full floor crunches. ",
        "Side plank, advanced abdominal plank.",
        "Place your forearms or hands on the floor, as you would for push-ups. Extend your feet behind your body and balance on your toes. Next, raise your hips until your shoulders, hips, knees, and ankles are in line. Hold this position as long as possible. ",
        "",
        'plank'));

    return prim;
  }

  List<Exercise> _getHefesto() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Mountain Climbers",
        "⭐",
        "Abs",
        "-",
        "Knee raises on parallel bars.",
        "Get into push-up position. Next, bring one of your knees as close to your chest as you can and return your leg to the starting position. Repeat the same movement with the other leg, alternating between both",
        "",
        'mountain_climbers'));
    prim.add(new Exercise(
        "Pull-ups",
        "⭐",
        "Back and biceps. ",
        "Australian pull ups, negative and short pull-ups. ",
        "Explosive pull-ups, muscle up, bar row. ",
        "On the pull-up bar, holding your palms forward, bend your arms until your chin goes over the bar and lower until your arms are straight.",
        "",
        'pull_ups'));
    prim.add(new Exercise(
        "Skipping in site",
        "⭐",
        "Quadriceps and abdomen. ",
        "-",
        "Lunges",
        "Standing, raise one knee to form a 90 degree angle, lower it and raise the other. At the same time bring the opposite arm of the elevated leg to a 90 degree flexion to obtain complete coordination. It is performed as if we were doing a race with the knees raised on the spot.",
        "Keep the hip elevated at all times, preventing it from descending when placing the foot on the ground and maintaining the position of the trunk, which should be kept straight and slightly inclined forward..",
        'skipping'));
    prim.add(new Exercise(
        "Dips",
        "⭐",
        "Chest and triceps.",
        "Bench dips, static dips, short dips, negative dips. ",
        "Explosive dips, clap dips, elbow dips, korean dips.",
        "On parallel bars, support yourself with your arms and go down until the elbow reaches at least a 90o angle, go up until you lock your elbows. Basic Calisthenics exercise. ",
        "",
        'dips'));
    prim.add(new Exercise(
        "Korean Dips",
        "⭐⭐",
        "Chest, shoulders and triceps.",
        "Dips, Straight bar dips.",
        "Back lever, hefesto. ",
        "Stand with your back to the bar with an overhand grip and do dips in this position, take advantage of the body's swing so you don't get stuck when trying to climb. ",
        "",
        'korean_dips'));
    prim.add(new Exercise(
        "Burpees",
        "⭐⭐",
        "Full body.",
        "Squats, push-ups, mountain climbers.",
        "Advanced exercises.",
        "Squatting with the hands on the ground, both legs are extended behind and at the same time an elbow flexion is made, returning to position 1 and from the previous position a vertical jump is made.",
        "",
        'burpees'));
    prim.add(new Exercise(
        "Tucked Planche Push Ups",
        "⭐⭐⭐",
        "Shoulders, triceps.",
        "Tucked planche.",
        "Advanced tucked planche.",
        "Get into a tucked planche position and do repetitions, bending your arms and trying not to touch the ground with your feet.",
        "",
        'tucked_planche'));
    prim.add(new Exercise(
        "Back Lever",
        "⭐⭐⭐⭐",
        "Shoulders, pectoral and lumbar.",
        "One leg Back Lever",
        "Hefesto.",
        "On the bar with an overhand grip, pass your legs between your hands and try to stay parallel to the ground.",
        "",
        'back_lever'));
    prim.add(new Exercise(
        "Skin the cat",
        "⭐",
        "Dorsal and shoulders.",
        "Knee raises.",
        "Back lever, hefesto.",
        "Hanging from the bar, pick up your legs and pass them between your arms, try to turn as much as possible until your feet point towards the ground.",
        "",
        'skin_the_cat'));

    return prim;
  }

  List<Exercise> _getFulPlan() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Tucked Planche",
        "⭐⭐",
        "Shoulders.",
        "Assisted handstand pushups, frog stand, planche lean.",
        "Tucked planche push ups, advanced tucked planche.",
        "Get into a frog position but with your arms outside your legs and lift your feet off the ground, usually delivered first with unlocked elbows and then with locked elbows. ",
        "",
        'tucked_planche'));
    prim.add(new Exercise(
        "Pseudo flexiones",
        "⭐⭐",
        "Chest, triceps and shoulders.",
        "Decline pushups, hindu push ups.",
        "Planche lean, frog stand, tucked planche.",
        "The hands are placed at the level of the navel and the normal push-ups are done.",
        "",
        'pseudo_planche_push_up'));
    prim.add(new Exercise(
        "Skipping in site",
        "⭐",
        "Quadriceps and abdomen. ",
        "-",
        "Lunges",
        "Standing, raise one knee to form a 90 degree angle, lower it and raise the other. At the same time bring the opposite arm of the elevated leg to a 90 degree flexion to obtain complete coordination. It is done as if we were doing a race with the knees raised on the spot.",
        "Keep the hip elevated at all times, preventing it from descending when placing the foot on the ground and maintaining the position of the trunk, which should be kept straight and slightly inclined forward.",
        'skipping'));
    prim.add(new Exercise(
        "Straddle Planche",
        "⭐⭐⭐⭐",
        "Shoulders",
        "Descent from handstand to straddle.",
        "Full planche. ",
        "Place your hands on the floor wider than shoulder-width apart, with your hands slightly pointing outwards, open your legs and lean forward until your feet are off the ground. ",
        "",
        'straddle_planche'));
    prim.add(new Exercise(
        "frog stand inside and outside",
        "⭐⭐",
        "Shoulders and triceps.",
        "Decline pushups.",
        "Turtle planche.",
        "In frog stand position take your feet back a little as if you were going to straddle and return to the frog",
        "",
        'frog'));
    prim.add(new Exercise(
        "Burpees",
        "⭐⭐",
        "Full body",
        "Squats, push-ups, mountain climbers.",
        "Advanced exercises.",
        "Squatting with the hands on the ground, both legs are extended behind and at the same time an elbow flexion is made, returning to position 1 and from the previous position a vertical jump is made.",
        "",
        'burpees'));
    prim.add(new Exercise(
        "Planche to the wall",
        "⭐⭐",
        "Shoulders.",
        "Assisted handstand pushups, frog stand.",
        "Straddle Planche, Full Planche",
        "Get into position as if you were going to perform a full planche, but in this case put the tips of your toes against the wall, at the height they would be if you supported yourself only with your hands.",
        "To place your feet on the wall, do a short back climb and lean as little as possible on your feet when you reach the position.",
        'full_planche'));
    prim.add(new Exercise(
        "Tucked Planche Push Ups",
        "⭐⭐⭐",
        "Shoulders, triceps.",
        "Tucked planche.",
        "Advanced tucked planche.",
        "Get into a tucked planche position and do repetitions, bending your arms and trying not to touch the ground with your feet.",
        "",
        'tucked_planche'));
    prim.add(new Exercise(
        "Plank",
        "⭐",
        "Abs and psoas.",
        "Short floor crunches, full floor crunches. ",
        "Side plank, advanced abdominal plank.",
        "Place your forearms or hands on the floor, like you would for a push-up. Extend your feet behind your body and balance on your toes. Then raise your hips until your shoulders, hips, knees and ankles are in line.Hold this position for as long as possible.",
        "",
        'plank'));

    return prim;
  }

  //Rutinas Generales
  List<Exercise> _getBeast() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Pull-ups",
        "⭐",
        "Back and biceps. ",
        "Australian pull ups, negative and short pull-ups. ",
        "Explosive pull-ups, muscle up, barbell rowing. ",
        "On the pull-up bar, holding your palms forward, bend your arms until your chin goes over the bar and lower until your arms are straight. ",
        "",
        'pull_ups'));
    prim.add(new Exercise(
        "Sprint",
        "⭐",
        "Legs",
        "Skipping in site",
        "-",
        "Carry out a race with an intensity level of 90% during the indicated time",
        "",
        'sprint'));
    prim.add(new Exercise(
        "Straigth bar dips",
        "⭐⭐",
        "Chest and triceps.",
        "Dips.",
        "Muscle up, one arm dips.",
        "Perform dips by placing both hands on the same bar. Try to go down until the chest grazes the bar. ",
        "",
        'dips'));
    prim.add(new Exercise(
        "Squats",
        "⭐",
        "Quadriceps and glutes",
        " Assisted squat, short squat.",
        "Explosive squat. ",
        "Stand with your heels shoulder-width apart and your arms hugging your chest or in front of your body. Bend your knees, keeping your back as straight as possible and looking straight ahead. Drive your hips back and down at the same time. As you lower your body, push your knees out and let your hips drop into the hollow of your knees. Also, make sure that your feet remain as flat as possible, and that no part of the sole leaves the ground at any time. Keep going as low as you physically can. From this lowest point, drive your hips up to the starting position. This counts as one repetition. ",
        " ",
        'squats'));
    prim.add(new Exercise(
        "Plank",
        "⭐",
        "Abs and psoas.",
        "Short floor crunches, full floor crunches. ",
        "Side plank, advanced abdominal plank.",
        "Place your forearms or hands on the floor, as you would for push-ups. Extend your feet behind your body and balance on your toes. Next, raise your hips until your shoulders, hips, knees, and ankles are in line. Hold this position as long as possible. ",
        "",
        'plank'));
    prim.add(new Exercise(
        "Knee Raises",
        "⭐",
        "Abs, psoas. ",
        "Knee raises on the floor.",
        "L sit raises on bar. ",
        "Hang from the bar and bring your knees to your chest, without bending your arms. In order to do repetitions correctly you must find the right rhythm.",
        "",
        'knee_raises'));
    prim.add(new Exercise(
        "Push-ups",
        "⭐",
        "Chest and triceps ",
        "Incline push-ups, knee push-ups",
        "Clap push-ups, Superman push-ups.",
        "Push-ups just require you to push your body away from the ground, supporting yourself on your hands and toes and keeping your midsection tense. Basic exercise of Calisthenics and Street Workout training. ",
        "",
        'push_ups'));

    return prim;
  }

  List<Exercise> _getBrePul() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Jumping Jacks",
        "⭐",
        "Legs, especially calves. Strengthens the whole body.",
        "-",
        "Explosive squat.",
        "Stand with your feet together and your arms at your sides. Jump up, moving your feet and arms to the sides as you do. Keep moving your feet and arms out, until you're back on the ground, at which point your feet are wide apart and your arms are raised above your head. From this position, jump back up and bring your feet back to center and arms back to your sides. ",
        "",
        'jumping_jacks'));
    prim.add(new Exercise(
        "One Arm Australian Pull Ups",
        "⭐⭐",
        "Back and biceps. ",
        "Start with a high bar and work your way down.",
        "Pull-ups",
        "On a low bar, do a rowing motion with an overhand grip, in this case done with one hand. ",
        "",
        'australian_pull_ups'));
    prim.add(new Exercise(
        "Headbangers",
        "⭐⭐",
        "Back and biceps.",
        "Chin-ups.",
        "L chin-ups, chin-up muscle up.",
        "In a supine pull-up position with your arms bent, perform short pull-ups trying to go down as little as possible, so that the movement is almost horizontal.",
        "",
        'headbangers'));
    prim.add(new Exercise(
        "Skipping in site",
        "⭐",
        "Quadriceps and abdomen. ",
        "-",
        "Lunges",
        "Standing, raise one knee to form a 90 degree angle, lower it and raise the other. At the same time bring the opposite arm of the elevated leg to a 90 degree flexion to obtain complete coordination. It is done as if we were doing a race with the knees raised on the spot.",
        "Keep the hip elevated at all times, preventing it from descending when placing the foot on the ground and maintaining the position of the trunk, which should be kept straight and slightly inclined forward.",
        'skipping'));
    prim.add(new Exercise(
        "Pullover",
        "⭐⭐",
        "Abdominals, psoas, dorsal, biceps.",
        "Leg raises, .",
        "L sit pullover. ",
        "Hanging on the bar, bring your feet to it and at the same time bend your arms, so that you rotate above the bar and turn around until you are in a bottom position on the bar. ",
        "",
        'leg_raises'));
    prim.add(new Exercise(
        "Straight bar dips",
        "⭐⭐",
        "Chest and triceps.",
        "Dips.",
        "Muscle up, one arm dips.",
        "Perform dips by placing both hands on the same bar. Try to lower yourself until your chest grazes the bar. ",
        "",
        'straight_bar_dips'));
    prim.add(new Exercise(
        "Chin-ups",
        "⭐",
        "Back and biceps. ",
        "Australian pull ups, negative and short pull-ups. ",
        "L chin-up pull-ups, chin-up muscle up. ",
        "On the pull-up bar, holding your palms towards you, bend your arms until your chin goes over the bar and lower until your arms are straight. ",
        "",
        'chin_ups'));
    prim.add(new Exercise(
        "Headbangers",
        "⭐⭐",
        "Back and biceps.",
        "Chin-ups",
        "L chin-ups, chin-up muscle up.",
        "In a supine pull-up position with your arms bent, perform short pull-ups trying to go down as little as possible, so that the movement is almost horizontal.",
        "",
        'headbangers'));

    return prim;
  }

  List<Exercise> _getBrePush() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Jumping Jacks",
        "⭐",
        "Legs, especially calves. Strengthens the whole body.",
        "-",
        "Explosive squat.",
        "Stand with your feet together and your arms at your sides. Jump up, moving your feet and arms to the sides as you do. Keep moving your feet and arms out, until you're back on the ground, at which point your feet are wide apart and your arms are raised above your head. From this position, jump back up and bring your feet back to center and arms back to your sides. ",
        "",
        'jumping_jacks'));
    prim.add(new Exercise(
        "Straight bar dips",
        "⭐⭐",
        "Chest and triceps.",
        "Dips.",
        "Muscle up, one arm dips.",
        "Perform dips by placing both hands on the same bar. Try to lower yourself until your chest grazes the bar. ",
        "",
        'straight_bar_dips'));
    prim.add(new Exercise(
        "Dips",
        "⭐",
        "Chest and triceps.",
        "Bench dips, static dips, short dips, negative dips. ",
        "Explosive dips, clap dips, elbow dips, Korean dips.",
        "On parallel bars, support yourself with your arms and go down until the elbow reaches at least a 90 degree angle, go up until you lock your elbows. Basic Calisthenics exercise. ",
        "",
        'dips'));
    prim.add(new Exercise(
        "Bench dips",
        "⭐",
        "Chest and triceps.",
        "Static positions, short repetitions, benches or bars with greater height.",
        "Static on dips, short dips, dips, korean dips.",
        "On a bench or low bar, lie on your back with your hands on the edge.",
        "On a bench or low bar, lie on your back with your hands on the edge. It is a good exercise for those who cannot do normal dips. ",
        'bench_dips'));
    prim.add(new Exercise(
        "Skipping in site",
        "⭐",
        "Quadriceps and abdomen. ",
        "-",
        "Lunges",
        "Standing, raise one knee to form a 90 degree angle, lower it and raise the other. At the same time bring the opposite arm of the elevated leg to a 90 degree flexion to obtain complete coordination. It is done as if we were doing a race with the knees raised on the spot.",
        "Keep the hip elevated at all times, preventing it from descending when placing the foot on the ground and maintaining the position of the trunk, which should be kept straight and slightly inclined forward.",
        'skipping'));
    prim.add(new Exercise(
        "Diamond Pushups",
        "⭐",
        "Chest and triceps",
        "Push-ups",
        "Elbow push-ups, sphinx push-ups.",
        "As a normal push-up but with the hands joined. The hands are joined so that the shape of a diamond is seen. Increase triceps work.",
        "",
        'diamond_push_up'));
    prim.add(new Exercise(
        "Explosive Pushups",
        "⭐⭐",
        "Chest and triceps ",
        "Push-ups.",
        "Clap push-ups.",
        "As you stretch your arms, your hands come off the ground. In order to do this exercise correctly, you must increase the speed of execution of your normal push-ups.",
        "",
        'push_ups_multi'));
    prim.add(new Exercise(
        "Wide grip push-ups",
        "⭐",
        "Chest and triceps",
        "Push-ups",
        "Archer push-ups.",
        "The hands are placed in a wider range than normal, at least twice the width of the shoulders.",
        "",
        'push_ups_multi'));
    prim.add(new Exercise(
        "Push-ups",
        "⭐",
        "Chest and triceps ",
        "Incline push-ups, knee push-ups",
        "Clap push-ups, Superman push-ups.",
        "Push-ups just require you to push your body off the ground, supporting yourself on your hands and toes and keeping your midsection tense. Basic exercise of Calisthenics and Street Workout training.",
        "",
        'push_ups'));

    return prim;
  }

  List<Exercise> _getExplosiv() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Mountain Climbers",
        "⭐",
        "ABS",
        "-",
        "Knee raises on parallel bars.",
        "Get into push-up position. Next, bring one of your knees as close to your chest as you can and return your leg to the starting position. Repeat the same movement with the other leg, alternating between both.",
        "",
        'mountain_climbers'));
    prim.add(new Exercise(
        "Explosive pull-ups",
        "⭐⭐",
        "Back and biceps. ",
        "Pull-ups.",
        "Clap pull-ups, muscle up. ",
        "Perform more energetic pull-ups, so that when you raise your chest you go towards the bar and your hands come off it. ",
        "",
        'pull_ups_multi'));
    prim.add(new Exercise(
        "Skipping in site",
        "⭐",
        "Quadriceps and abdomen. ",
        "-",
        "Lunges",
        "Standing, raise one knee to form a 90 degree angle, lower it and raise the other. At the same time bring the opposite arm of the elevated leg to a 90 degree flexion to obtain complete coordination. It is done as if we were doing a race with the knees raised on the spot.",
        "Keep the hip elevated at all times, preventing it from descending when placing the foot on the ground and maintaining the position of the trunk, which should be kept straight and slightly inclined forward.",
        'skipping'));
    prim.add(new Exercise(
        "Explosive Pushups",
        "⭐⭐",
        "Chest and triceps ",
        "Push-ups.",
        "Clap push-ups.",
        "As you stretch your arms, your hands come off the ground. In order to do this exercise correctly, you must increase the speed of execution of your normal push-ups.",
        "",
        'push_ups_multi'));
    prim.add(new Exercise(
        "Jumping Jacks",
        "⭐",
        "Legs, especially calves. Strengthens the whole body.",
        "-",
        "Explosive squat.",
        "Stand with your feet together and your arms at your sides. Jump up, moving your feet and arms to the sides as you do. Keep moving your feet and arms out, until you're back on the ground, at which point your feet are wide apart and your arms are raised above your head. From this position, jump back up and bring your feet back to center and arms back to your sides. ",
        "",
        'jumping_jacks'));
    prim.add(new Exercise(
        "Burpees",
        "⭐⭐",
        "Full body.",
        "Squats, push-ups, mountain climbers.",
        "Advanced exercises.",
        "Squatting with the hands on the ground, both legs are extended behind and at the same time an elbow flexion is made, returning to position 1 and from the previous position a vertical jump is made.",
        "",
        'burpees'));
    prim.add(new Exercise(
        "Dragon Flag",
        "⭐⭐⭐",
        "Dorsal and abdominal. ",
        "Dragon flag 1 leg.",
        "Front lever. ",
        "On a bar near the ground, on your back with your head close to it, use an overhand grip and stay at a 45° angle, with both legs straight and only your upper back on the ground. ",
        "",
        'dragon_flag'));
    prim.add(new Exercise(
        "Skin the cat",
        "⭐",
        "Dorsal and shoulders.",
        "Knee raises.",
        "Back lever, hefesto.",
        "Hanging from the bar, pick up your legs and pass them between your arms, try to turn as much as possible until your feet point towards the ground.",
        "",
        'skin_the_cat'));
    prim.add(new Exercise(
        "Sprint",
        "⭐",
        "Legs",
        "Skipping in site",
        "-",
        "Perform a run with an intensity level of 90% for 30 seconds",
        "",
        'sprint'));

    return prim;
  }

  List<Exercise> _getNextLevel() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Mountain Climbers",
        "⭐",
        "Abs",
        "-",
        "Knee raises en fondos.",
        "Get into push-up position. Next, bring one of your knees as close to your chest as you can and return your leg to the starting position. Repeat the same movement with the other leg, alternating between the two.",
        "",
        'mountain_climbers'));
    prim.add(new Exercise(
        "Pull-ups",
        "⭐",
        "Back and biceps. ",
        "Australian pull ups, negative and short pull-ups. ",
        "Explosive pull-ups, muscle up, bar row. ",
        "On the pull-up bar, holding your palms forward, bend your arms until your chin goes over the bar and lower until your arms are straight. ",
        "",
        'pull_ups'));
    prim.add(new Exercise(
        "Skipping in site",
        "⭐",
        "Quadriceps and abdomen. ",
        "-",
        "Lunges",
        "Standing, raise one knee to form a 90 degree angle, lower it and raise the other. At the same time bring the opposite arm of the elevated leg to a 90 degree flexion to obtain complete coordination. It is done as if we were doing a race with the knees raised on the spot.",
        "Keep the hip elevated at all times, preventing it from descending when placing the foot on the ground and maintaining the position of the trunk, which should be kept straight and slightly inclined forward.",
        'skipping'));
    prim.add(new Exercise(
        "Push-ups",
        "⭐",
        "Chest and triceps ",
        "Incline push-ups, knee push-ups",
        "Clap push-ups, Superman push-ups.",
        "Push-ups just require you to push your body off the ground, supporting yourself on your hands and toes and keeping your midsection tense. Basic exercise of Calisthenics and Street Workout training. ",
        "",
        'push_ups'));
    prim.add(new Exercise(
        "Burpees",
        "⭐⭐",
        "Full body.",
        "Squats, push-ups, mountain climbers.",
        "Advanced exercises.",
        "Squatting with the hands on the ground, both legs are extended behind and at the same time an elbow flexion is made, it returns to position 1 and from the previous position a vertical jump is made..",
        "",
        'burpees'));
    prim.add(new Exercise(
        "Chin-ups",
        "⭐",
        "Back and biceps. ",
        "Australian pull ups, negative and short pull-ups. ",
        "L chin-up pull-ups, chin-up muscle up. ",
        "On the pull-up bar, holding your palms towards you, bend your arms until your chin goes over the bar and lower until your arms are straight.  ",
        "",
        'chin_ups'));
    prim.add(new Exercise(
        "Sprint",
        "⭐",
        "Legs",
        "Skipping in site",
        "-",
        "Carry out a race with an intensity level of 90% during the indicated time",
        "",
        'sprint'));
    prim.add(new Exercise(
        "Australian Pull Ups",
        "⭐",
        "Back and biceps. ",
        "Start with a high bar and go lower.",
        "Pull-ups ",
        "On a low bar, do a rowing motion with an overhand grip. The difficulty can be adapted by varying the height of the bar. ",
        "",
        'australian_pull_ups'));

    return prim;
  }

  List<Exercise> _getJump() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Jumping Jacks",
        "⭐",
        "Legs, especially calves. Strengthens the whole body.",
        "-",
        "Explosive squat.",
        "Stand with your feet together and your arms at your sides. Jump up, moving your feet and arms to the sides as you do. Keep moving your feet and arms out, until you're back on the ground, at which point your feet are wide apart and your arms are raised above your head. From this position, jump back up and bring your feet back to center and arms back to your sides. ",
        "",
        'jumping_jacks'));
    prim.add(new Exercise(
        "Burpees",
        "⭐⭐",
        "Full body.",
        "Squats, push-ups, mountain climbers.",
        "Advanced exercises.",
        "Squatting with the hands on the ground, both legs are extended behind and at the same time an elbow flexion is made, returning to position 1 and from the previous position a vertical jump is made.",
        "",
        'burpees'));
    prim.add(new Exercise(
        "Plank",
        "⭐",
        "Abs and psoas.",
        "Short floor crunches, full floor crunches. ",
        "Side Plank, Advanced Ab Plank.",
        "Place your forearms or hands on the floor, as you would for push-ups. Extend your feet behind your body and balance on your toes. Next, raise your hips until your shoulders, hips, knees, and ankles are in line. Hold this position as long as possible. ",
        "",
        'plank'));
    prim.add(new Exercise(
        "Explosive squat",
        "⭐",
        "Quadriceps, glutes, calves.",
        "Squat, deep squat.",
        "Box jumps.",
        "Perform a normal squat but when going up add explosiveness to the movement, so that you jump, for greater difficulty bring your knees to your chest.",
        "",
        'explosive_squat'));
    prim.add(new Exercise(
        "Lunge-jump-squat",
        "⭐⭐",
        "Quadriceps and glutes.",
        "Squat, explosive squat, lunge.",
        "Bulgarian squat, explosive lunges with change.",
        "Stand with your feet shoulder-width apart, stride forward two steps, bring your feet together, and jump. Upon landing from the jump, perform a squat. ",
        "",
        'lunges_jump_squat'));
    prim.add(new Exercise(
        "Box jumps",
        "⭐⭐",
        "Quadriceps, glutes, calves.",
        "Squat, explosive squat.",
        "Explosive pistol squat.",
        "Facing a waist-high platform or bench, perform an explosive squat and step onto the platform with both feet at the same time, jump back down, and repeat.",
        "",
        'box_jump'));
    prim.add(new Exercise(
        "Sprint",
        "⭐",
        "Legs",
        "Skipping in site",
        "-",
        "Carry out a race with an intensity level of 90% during the indicated time",
        "",
        'sprint'));
    prim.add(new Exercise(
        "Pistol Squat",
        "⭐⭐⭐⭐",
        "Quadriceps, hamstrings, glutes.",
        "Deep squat, assisted pistol squat.",
        "Shotgun pistol squat, pistol squat explosiva.",
        "\tStand on one leg, with the other as horizontal as possible. Crouch down on the leg that is flat on the ground, keeping the heel planted. Putting your arms in front of your body can help you keep your balance. When you reach the bottom of the movement, push back up to the starting position. This counts as one repetition. ",
        "",
        'pistol_squat'));

    return prim;
  }

  List<Exercise> _getCorKil() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Jumping Jacks",
        "⭐",
        "Legs, especially calves. Strengthens the whole body.",
        "-",
        "Explosive squat.",
        "Stand with your feet together and your arms at your sides. Jump up, moving your feet and arms to the sides as you do. Keep moving your feet and arms out, until you're back on the ground, at which point your feet are wide apart and your arms are raised above your head. From this position, jump back up and bring your feet back to center and arms back to your sides. ",
        "",
        'jumping_jacks'));
    prim.add(new Exercise(
        "Push-ups",
        "⭐",
        "Chest and triceps",
        "Incline push-ups, knee push-ups",
        "Clap push-ups, Superman push-ups.",
        "Push-ups just require you to push your body off the ground, supporting yourself on your hands and toes and keeping your midsection tense. Basic exercise of Calisthenics and Street Workout training. ",
        "",
        'push_ups'));
    prim.add(new Exercise(
        "Mountain Climbers",
        "⭐",
        "Abs",
        "-",
        "Knee raises on parallel bars.",
        "Get into push-up position. Next, bring one of your knees as close to your chest as you can and return your leg to the starting position. Repeat the same movement with the other leg, alternating between both..",
        "",
        'mountain_climbers'));
    prim.add(new Exercise(
        "Flutter Kicks",
        "⭐⭐",
        "Abs and psoas",
        "Plank, full crunches on the floor.",
        "Leg raises on floor, windshield wipers on floor.",
        "Lying on your back, raise your legs just enough so that your heels do not touch the ground and start freestyle swimming kicks. ",
        "",
        'flutter_kicks'));
    prim.add(new Exercise(
        "Leg Raises",
        "⭐⭐",
        "abdominal, lower back, psoas.",
        "Knee raises on bar.",
        "Windshield wipers, pullover.",
        "Hanging on the bar, bring your feet to it, trying not to bend your knees. ",
        "",
        'leg_raises'));
    prim.add(new Exercise(
        "Forearm Stand",
        "⭐⭐⭐",
        "Shoulders. ",
        "Assisted handstand pushups.",
        "Changes to tiger bend, tiger bend.",
        " ́Instead of just placing your hands on the ground, place your forearms as well and come up on a handstand in this position. You will need some flexibility in your back to be able to do this. ",
        "",
        'handstand'));
    prim.add(new Exercise(
        "Plank",
        "⭐",
        "Abs and psoas.",
        "Short floor crunches, full floor crunches. ",
        "Side plank, advanced abdominal plank.",
        "Place your forearms or hands on the floor, as you would for push-ups. Extend your feet behind your body and balance on your toes. Next, raise your hips until your shoulders, hips, knees, and ankles are in line. Hold this position as long as possible. ",
        "",
        'plank'));
    prim.add(new Exercise(
        "Dragon Flag",
        "⭐⭐⭐",
        "Dorsal and abdominal. ",
        "Dragon flag 1 leg.",
        "Front lever. ",
        "On a bar near the ground, on your back with your head close to it, use an overhand grip and stay at a 45° angle, with both legs straight and only your upper back on the ground. ",
        "",
        'dragon_flag'));
    prim.add(new Exercise(
        "The Hollow",
        "⭐⭐",
        "Abs and psoas ",
        "Full floor crunches.",
        "floor leg raises .",
        "Lie on your back, with your legs extended and your arms by your sides. She lifts her shoulders and upper back off the ground, and lifts her hands off the ground. Then lift your legs off the ground, making sure your lower and mid-back stay off the ground. Imagine pressing your spine down as hard as you can, or trying to bring your navel toward the ground. Now hold the position for as long as you can. ",
        "",
        'hollow'));
    prim.add(new Exercise(
        "Russian Twist Crunches",
        "⭐⭐",
        "Abs and obliques.",
        "Full crunches on the floor.",
        "Knee raises on the bar with a wink.",
        " Lie on your back on the floor, resting on the upper part of your buttocks and with your knees bent. Join your hands in a \"prayer\" position and turn your torso from side to side. ",
        "",
        'russian_twists'));

    return prim;
  }

  List<Exercise> _getFulBod() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Plank",
        "⭐",
        "Abs and psoas.",
        "Short floor crunches, full floor crunches. ",
        "Side plank, advanced abdominal plank.",
        "Place your forearms or hands on the floor, as you would for push-ups. Extend your feet behind your body and balance on your toes. Next, raise your hips until your shoulders, hips, knees, and ankles are in line. Hold this position as long as possible. ",
        "",
        'plank'));
    prim.add(new Exercise(
        "Knee Raises",
        "⭐",
        "Abdominales, psoas. ",
        "Knee raises on the ground.",
        "L sit raises on bar. ",
        "Hang from the bar and bring your knees to your chest, without bending your arms. In order to do repetitions correctly you must find the right rhythm. ",
        "",
        'knee_raises'));
    prim.add(new Exercise(
        "Reverse Flutter Kicks",
        "⭐⭐",
        "Abs and psoas",
        "Plank, full floor crunches.",
        "Plank, full crunches on the floor, Leg raises on the floor, windshield wipers on the floor.",
        "Lying on your stomach, raise your legs just enough so that your feet are off the ground and start freestyle swimming kicks. ",
        "",
        'flutter_kicks'));
    prim.add(new Exercise(
        "Leg Raises",
        "⭐⭐",
        "Abs, lumbar, psoas.",
        "Knee raises on the bar.",
        "Windshield wipers, pullover.",
        "Hanging on the bar, bring your feet to it, trying not to bend your knees. ",
        "",
        'leg_raises'));
    prim.add(new Exercise(
        "Bulgarian Squat",
        "⭐",
        "Quadriceps and glutes.",
        "Lunges, squats",
        "Explosive lunges with change, short squats to 1 leg.",
        "With the ball of one foot resting on a bench or low bar, get into a lunge position and repeat.",
        "",
        'zancada'));
    prim.add(new Exercise(
        "Pseudo push-ups",
        "⭐⭐",
        "Chest, triceps and shoulders.",
        "Decline push-ups, hindu push ups.",
        "Planche lean, frog stand, tucked planche.",
        "The hands are placed at the level of the navel and the common push-ups are done.",
        "",
        'pseudo_planche_push_up'));
    prim.add(new Exercise(
        "Pull-ups",
        "⭐",
        "Back and biceps. ",
        "Australian pull ups, negative and short pull-ups. ",
        "Explosive pull-ups, muscle up, bar row. ",
        "On the pull-up bar, holding your palms forward, bend your arms until your chin goes over the bar and lower until your arms are straight. ",
        "",
        'pull_ups'));
    prim.add(new Exercise(
        "Archer push-ups",
        "⭐⭐",
        "Chest and triceps ",
        "Wide grip push-ups.",
        "push-ups with one arm.",
        "You flex one arm and the other is completely stretched.  ",
        "To master this exercise you must rotate your hands in accordance with the movement of your arms.",
        'archer_push_ups'));
    prim.add(new Exercise(
        "Pullover",
        "⭐⭐",
        "Abdominals, psoas, dorsal, biceps.",
        "Leg raises, pull-ups.",
        "L sit pullover. ",
        "Hanging on the bar, bring your feet to it and at the same time bend your arms, so that you rotate above the bar and turn around until you are in a bottom position on the bar. ",
        "",
        'leg_raises'));

    return prim;
  }

  List<Exercise> _get2Dominadas() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Pull-ups",
        "⭐",
        "Back and biceps. ",
        "Australian pull ups, negative and short pull-ups. ",
        "Explosive pull-ups, muscle up, bar row. ",
        "On the pull-up bar, holding your palms forward, bend your arms until your chin goes over the bar and lower until your arms are straight. ",
        "",
        'pull_ups'));
    prim.add(new Exercise(
        "Lunges",
        "⭐",
        "Quadriceps and glutes.",
        "short squat, squat.",
        "Bulgarian squat, explosive strides with change.",
        "Stand with your feet shoulder-width apart and your hands at your sides. Take a step forward with one leg, as if taking a long stride. Make sure your heel hits the ground first, followed by the rest of your foot. From this position, bend both legs until your rear knee is almost touching the ground. Try to keep your torso as upright as possible throughout the entire movement. From this lowest point, you can press hard with your front foot and return to the pi position, or you can press hard with your back leg and step forward. The first method can be done in a small area, obviously, since you are practically moving at one point, but the second requires a little more space, since you will have to move forward. ",
        "",
        'zancada'));
    prim.add(new Exercise(
        "Chin-ups",
        "⭐",
        "Back and biceps. ",
        "Australian pull ups, negative and short chin-ups. ",
        "L chin-up, chin-up muscle up. ",
        "On the pull-up bar, holding your palms towards you, bend your arms until your chin goes over the bar and lower until your arms are straight.  ",
        "",
        'chin_ups'));
    prim.add(new Exercise(
        "Flutter Kicks",
        "⭐⭐",
        "Abs and psoas",
        "Plank, full crunches on the floor.",
        "Leg raises on the floor, windshield wipers on the floor.",
        "Lying on your back, raise your legs just enough so that your heels do not touch the ground and start freestyle swimming kicks. ",
        "",
        'flutter_kicks'));
    prim.add(new Exercise(
        "Close-grip pull-ups",
        "⭐",
        "Back and biceps. ",
        "Pull-ups. ",
        "One arm pull up, close grip muscle up. ",
        "Normal pull-ups but with hands practically together. They do not need to touch as this can be stressful on the dolls. ",
        "",
        'pull_ups_multi'));
    prim.add(new Exercise(
        "Mountain Climbers",
        "⭐",
        "Abs",
        "-",
        "Knee raises on parallel bars.",
        "Get into push-up position. Next, bring one of your knees as close to your chest as you can and return your leg to the starting position. Repeat the same movement with the other leg, alternating between the two.",
        "-",
        'mountain_climbers'));

    return prim;
  }

  List<Exercise> _get2Flexiones() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Pike Push Ups",
        "⭐⭐",
        "Chest, triceps and shoulders.",
        "Push-ups, decline push-ups.",
        "Hindu push ups, Assisted handstand push-ups.",
        "Hands and feet come closer, raising the hip. ",
        " Preparatory exercise for work in handstand.",
        'pike_push_ups'));
    prim.add(new Exercise(
        "Jumping Jacks",
        "⭐",
        "Legs, especially calves. Strengthens the whole body.",
        "-",
        "Explosive squat.",
        "Stand with your feet together and your arms at your sides. Jump up, moving your feet and arms to the sides as you do. Keep moving your feet and arms out, until you're back on the ground, at which point your feet are wide apart and your arms are raised above your head. From this position, jump back up and bring your feet back to center and arms back to your sides. ",
        "",
        'jumping_jacks'));
    prim.add(new Exercise(
        "Pseudo flexiones",
        "⭐⭐",
        "Chest, triceps and shoulders.",
        "Decline pushups, hindu push ups.",
        "Planche lean, frog stand, tucked planche.",
        "The hands are placed at the level of the navel and the common push-ups are done.",
        "",
        'pseudo_planche_push_up'));
    prim.add(new Exercise(
        "Knee Raises",
        "⭐",
        "Abs, psoas. ",
        "Knee raises on the floor.",
        "L sit raises on bar. ",
        "Hang from the bar and bring your knees to your chest, without bending your arms. In order to do repetitions correctly you must find the right rhythm. ",
        "",
        'knee_raises'));
    prim.add(new Exercise(
        "Bench dips",
        "⭐",
        "Chest and triceps.",
        "Static positions, short repetitions, benches or bars with greater height.",
        "Static on dips, short dips, dips, korean dips.",
        "On a bench or low bar, lie on your back with your hands on the edge.",
        "On a bench or low bar, lie on your back with your hands on the edge. It is a good exercise for those who cannot do normal dips. ",
        'bench_dips'));
    prim.add(new Exercise(
        "Burpees",
        "⭐⭐",
        "Full body",
        "Squats, push-ups, mountain climbers.",
        "Advanced exercises.",
        "Squatting with the hands on the ground, both legs are extended behind and at the same time an elbow flexion is made, returning to position 1 and from the previous position a vertical jump is made.",
        "",
        'burpees'));

    return prim;
  }

  List<Exercise> _get2Core() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Mountain Climbers",
        "⭐",
        "Abs",
        "-",
        "Knee raises on parallel bars.",
        "Get into push-up position. Next, bring one of your knees as close to your chest as you can and return your leg to the starting position. Repeat the same movement with the other leg, alternating between both..",
        "",
        'mountain_climbers'));
    prim.add(new Exercise(
        "Leg Raises on the floor",
        "⭐⭐",
        "Abs, lumbar, psoas.",
        "Knee raises on the bar.",
        "Windshield wipers, pullover.",
        "Lying on the floor raise your feet until they form a 90 degree angle with your torso, when raising your feet keep your legs straight. ",
        "",
        'leg_raises_floor'));
    prim.add(new Exercise(
        "Plank",
        "⭐",
        "Abs and psoas.",
        "Short floor crunches, full floor crunches.",
        "Side Plank, Advanced Ab Plank.",
        "Place your forearms or hands on the floor, as you would for push-ups. Extend your feet behind your body and balance on your toes. Next, raise your hips until your shoulders, hips, knees, and ankles are in line. Hold this position as long as possible. ",
        "",
        'plank'));
    prim.add(new Exercise(
        "Windshield wipers on the floor",
        "⭐⭐",
        "Abs and obliques.",
        "Leg raises on floor.",
        "Windshield wipers.",
        "Lying on your back with your legs straight at 90°, bring them to one side until your feet graze the ground, then switch to the other side.",
        "",
        'windshield_wipers'));
    prim.add(new Exercise(
        "The Hollow",
        "⭐⭐",
        "Abs y psoas ",
        "Full floor crunches.",
        "Leg raises on the ground.",
        "Lie on your back, with your legs extended and your arms by your sides. She lifts her shoulders and upper back off the ground, and lifts her hands off the ground. Then lift your legs off the ground, making sure your lower and mid-back stay off the ground. Imagine pressing your spine down as hard as you can, or trying to bring your navel toward the ground. Now hold the position for as long as you can. ",
        "",
        'hollow'));
    prim.add(new Exercise(
        "Crunches",
        "⭐",
        "Abs.",
        "Short crunches on the floor.",
        "Knee raises on parallel bars.",
        "Lying face up on the floor, bend your knees and keep your feet on the ground, perform an abdominal contraction so that your back rises off the ground and your head goes to your knee. ",
        "",
        'crunches'));

    return prim;
  }

  List<Exercise> _get2Squat() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Side lunges",
        "⭐",
        "Quadriceps, femoral, glutes.",
        "Lunges",
        "Explosive lunges with change, short squats to 1 leg, deep squat.",
        "Stand up and take a long step to the side, bending your knee while keeping the other knee straight. ",
        "",
        'zancadas_laterales'));
    prim.add(new Exercise(
        "Squats 180°",
        "⭐",
        "Quadriceps and glutes",
        " Assisted squat, short squat.",
        "Explosive squat. ",
        "Perform a squat and when going up, take a small jump and turn 180 °",
        " ",
        'squats_multi'));
    prim.add(new Exercise(
        "Burpees",
        "⭐⭐",
        "Full body.",
        "Squats, push-ups, mountain climbers.",
        "Advanced exercises.",
        "Squatting with the hands on the ground, both legs are extended behind and at the same time an elbow flexion is made, returning to position 1 and from the previous position a vertical jump is made..",
        "",
        'burpees'));
    prim.add(new Exercise(
        "Squat",
        "⭐",
        "Quadriceps and glutes",
        " Assisted squat, short squat.",
        "Explosive squat. ",
        "Stand with your heels shoulder-width apart and your arms hugging your chest or in front of your body. Bend your knees, keeping your back as straight as possible and looking straight ahead. Drive your hips back and down at the same time. As you lower your body, push your knees out and let your hips drop into the hollow of your knees. Also, make sure that your feet remain as flat as possible, and that no part of the sole leaves the ground at any time. Keep going as low as you physically can. From this lowest point, drive your hips up to the starting position. This counts as one repetition. ",
        "The squat is a fairly complex movement, with a lot of play between muscles and joints, and it's actually quite easy to perform incorrectly. ",
        'squats'));
    prim.add(new Exercise(
        "Pistol Squat",
        "⭐⭐⭐⭐",
        "Quadriceps, hamstrings, glutes.",
        "Deep squat, assisted pistol squat.",
        "Shotgun pistol squat, explosive pistol squat.",
        "\tStand on one leg, with the other as horizontal as possible. Crouch down on the leg that is flat on the ground, keeping the heel planted. Putting your arms in front of your body can help you keep your balance. When you reach the bottom of the movement, push back up to the starting position. This counts as one repetition. ",
        "",
        'pistol_squat'));
    prim.add(new Exercise(
        "Jumping Jacks",
        "⭐",
        "Legs, especially calves. Strengthens the whole body.",
        "-",
        "Explosive squat.",
        "Stand with your feet together and your arms at your sides. Jump up, moving your feet and arms to the sides as you do. Keep moving your feet and arms out, until you're back on the ground, at which point your feet are wide apart and your arms are raised above your head. From this position, jump back up and bring your feet back to center and arms back to your sides. ",
        "",
        'jumping_jacks'));

    return prim;
  }

  List<Exercise> _getChalMusc() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Muscle Up",
        "⭐⭐⭐",
        "Dorsal, biceps, pectoral and triceps.",
        "Assisted muscle up, explosive pull-ups, bar dips. ",
        "Other muscle up exercises.",
        "Hanging from the bar, he goes up explosively, putting his head above the bar and being in a bottom position on the bar.",
        "",
        'straight_muscle_ups'));
    prim.add(new Exercise(
        "Wide Grip Muscle Up",
        "⭐⭐⭐",
        "Dorsal, biceps, pectoral and triceps.",
        "Muscle up, wide grip pull-ups. ",
        "Straight Muscle up",
        " Same as the muscle up but with a grip twice as wide as the shoulders. Focus more work on the dorsal.",
        "",
        'straight_muscle_ups'));
    prim.add(new Exercise(
        "Close Grip Muscle Up",
        "⭐⭐⭐",
        "Dorsal, biceps, pectoral and triceps.",
        "Muscle up, close grip pull-ups. ",
        "Straight muscle up, one arm muscle up.",
        " Same as the muscle up but with your hands joined, if it is uncomfortable for your wrists, separate your hands a little.",
        "",
        'straight_muscle_ups'));

    return prim;
  }

  List<Exercise> _getChalPul() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Pull-ups",
        "⭐",
        "Back and biceps. ",
        "Australian pull ups, negative and short pull-ups. ",
        "Explosive pull-ups, muscle up, bar row. ",
        "On the pull-up bar, holding your palms forward, bend your arms until your chin goes over the bar and lower until your arms are straight. ",
        "",
        'pull_ups'));
    prim.add(new Exercise(
        "Wide grip pull-ups",
        "⭐",
        "Back and biceps. ",
        "Pull-ups. ",
        "Explosive pull-ups, muscle up, bar row. ",
        "On the pull-up bar, holding your palms forward, bend your arms until your chin goes over the bar and lower until your arms are straight. ",
        "",
        'pull_ups'));
    prim.add(new Exercise(
        "Close-grip pull-ups",
        "⭐",
        "Back and biceps. ",
        "Pull-ups. ",
        "Typewriter, archer pull-ups, wide grip muscle up. ",
        "Normal pull-ups but with a wider width in the grip, usually twice the width of the shoulders. ",
        "",
        'pull_ups'));

    return prim;
  }

  List<Exercise> _getNoLimit() {
    List<Exercise> prim = [];

    prim.add(new Exercise(
        "Mountain Climbers",
        "⭐",
        "Abs",
        "-",
        "Knee raises on parallel bars.",
        "Get into push-up position. Next, bring one of your knees as close to your chest as you can and return your leg to the starting position. Repeat the same movement with the other leg, alternating between both.",
        "",
        'mountain_climbers'));
    prim.add(new Exercise(
        "Pull-ups",
        "⭐",
        "Back and biceps. ",
        "Australian pull ups, negative and short pull-ups. ",
        "Explosive pull-ups, muscle up, bar row. ",
        "On the pull-up bar, holding your palms forward, bend your arms until your chin goes over the bar and lower until your arms are straight. ",
        "",
        'pull_ups'));
    prim.add(new Exercise(
        "Skipping in site",
        "⭐",
        "Quadriceps and abdomen. ",
        "-",
        "Lunges",
        "Standing, raise one knee to form a 90 degree angle, lower it and raise the other. At the same time bring the opposite arm of the elevated leg to a 90 degree flexion to obtain complete coordination. It is done as if we were doing a race with the knees raised on the spot.",
        "Keep the hip elevated at all times, preventing it from descending when placing the foot on the ground and maintaining the position of the trunk, which should be kept straight and slightly inclined forward.",
        'skipping'));
    prim.add(new Exercise(
        "Push-ups",
        "⭐",
        "Chest and triceps ",
        "Incline push-ups, Knee push-ups",
        "Clap push-ups, Superman push-ups.",
        "Push-ups just require you to push your body away from the ground, supporting yourself on your hands and toes and keeping your midsection tense. Basic exercise of Calisthenics and Street Workout training. ",
        "",
        'push_ups'));
    prim.add(new Exercise(
        "Sprint",
        "⭐",
        "Legs",
        "Skipping in site",
        "-",
        "Carry out a race with an intensity level of 90% during the indicated time",
        "",
        'sprint'));
    prim.add(new Exercise(
        "Dips",
        "⭐",
        "Chest and triceps.",
        "Bench dips, static dips, short dips, negative dips. ",
        "Explosive dips, clap dips, elbow dips, korean dips.",
        "On parallel bars, support yourself with your arms and go down until the elbow reaches at least a 90 degree angle, go up until you lock your elbows. Basic Calisthenics exercise. ",
        "",
        'dips'));
    prim.add(new Exercise(
        "Burpees",
        "⭐⭐",
        "Full body.",
        "Squats, push-ups, mountain climbers.",
        "Squat Advanced Exercises.",
        "Squatting with the hands on the ground, both legs are extended behind and at the same time an elbow flexion is made, returning to position 1 and from the previous position a vertical jump is made.",
        "",
        'burpees'));
    prim.add(new Exercise(
        "Straight bar dips",
        "⭐⭐",
        "Chest and triceps.",
        "Dips.",
        "Muscle up, one arm dips.",
        "Perform dips by placing both hands on the same bar. Try to go down until the chest grazes the bar. ",
        "",
        'straight_bar_dips'));
    prim.add(new Exercise(
        "Chin-ups",
        "⭐",
        "Back and biceps. ",
        "Australian pull ups, negative and short pull-ups. ",
        "L chin-up, chin-up muscle up. ",
        "On the pull-up bar, holding your palms towards you, bend your arms until your chin goes over the bar and lower until your arms are straight. ",
        "",
        'chin_ups'));
    prim.add(new Exercise(
        "Jumping Jacks",
        "⭐",
        "Legs, especially calves. Strengthens the whole body.",
        "-",
        "Explosive squat.",
        "Stand with your feet together and your arms at your sides. Jump up, moving your feet and arms to the sides as you do. Keep moving your feet and arms out, until you're back on the ground, at which point your feet are wide apart and your arms are raised above your head. From this position, jump back up and bring your feet back to center and arms back to your sides.",
        "",
        'jumping_jacks'));
    prim.add(new Exercise(
        "Australian Pull Ups",
        "⭐",
        "Back and biceps. ",
        "Start with a high bar and work your way down.",
        "Pull-ups ",
        "On a low bar, do a rowing motion with an overhand grip. The difficulty can be adapted by varying the height of the bar. ",
        "",
        'australian_pull_ups'));
    prim.add(new Exercise(
        "Leg Raises",
        "⭐⭐",
        "Abs, lumbar, psoas.",
        "Knee raises on the bar.",
        "Windshield wipers, pullover.",
        "Hanging on the bar, bring your feet to it, trying not to bend your knees. ",
        "",
        'leg_raises'));
    prim.add(new Exercise(
        "Plank",
        "⭐",
        "Abdominals and psoas.",
        "Short floor crunches, full floor crunches. ",
        "Side plank, advanced abdominal plank.",
        "Place your forearms or hands on the floor, as you would for push-ups. Extend your feet behind your body and balance on your toes. Next, raise your hips until your shoulders, hips, knees, and ankles are in line. Hold this position as long as possible. ",
        "",
        'plank'));
    prim.add(new Exercise(
        "Windshield wipers on the floor",
        "⭐⭐",
        "Abs and obliques.",
        "Leg raises on floor.",
        "Windshield wipers.",
        "Lying on your back with your legs straight at 90°, bring them to one side until your feet graze the ground, then switch to the other side.",
        "",
        'windshield_wipers'));
    prim.add(new Exercise(
        "Deep handstand pushups",
        "⭐⭐⭐⭐",
        "Shoulder and triceps.",
        "Assisted handstand pushups, handstand pushups",
        "Straddle Press to handstand.",
        "Do handstand push-ups on parallel bars, so that your head drops below the level of the bars. Try to keep your body straight (rather than arched) so you don't lose your balance. ",
        "",
        'handstand_paralelas'));
    prim.add(new Exercise(
        "Muscle Up",
        "⭐⭐⭐",
        "Dorsal, biceps, pectoral and triceps.",
        "Assisted muscle up, explosive pull-ups, bar dips. ",
        "Other muscle up exercises.",
        "Hanging from the bar, he goes up explosively, putting his head above the bar and being in a bottom position on the bar.",
        "",
        'straight_muscle_ups'));
    prim.add(new Exercise(
        "Pistol Squat",
        "⭐⭐⭐⭐",
        "Quadriceps, femoral, glutes.",
        "Deep squat, assisted pistol squat.",
        "Shotgun pistol squat, explosive pistol squat.",
        "\tStand on one leg, with the other as horizontal as possible. Crouch down on the leg that is flat on the ground, keeping the heel planted. Putting your arms in front of your body can help you keep your balance. When you reach the bottom of the movement, push back up to the starting position. This counts as one repetition. ",
        "",
        'pistol_squat'));
    prim.add(new Exercise(
        "Korean Dips",
        "⭐⭐",
        "Chest, shoulders and triceps.",
        "Dips, straigth bar dips",
        "Back lever, hefesto. ",
        "Stand with your back to the bar with an overhand grip and do dips in this position, take advantage of the body's swing so you don't get stuck when trying to climb. ",
        "",
        'korean_dips'));

    return prim;
  }

  List<int> getRep(String nomser) {
    List<int> rep = [];
    if (nomser == "First steps") {
      List<int> repe = [10, 5, 10010, 2, 20, 15, 5];
      rep = repe;
    } else if (nomser == "Back, Abdominals and Triceps") {
      List<int> repe = [5, 15, 50, 15, 10];
      rep = repe;
    } else if (nomser == "Chest, Abs and Biceps") {
      List<int> repe = [4, 5, 30, 10, 10, 10, 5];
      rep = repe;
    } else if (nomser == "Shoulders, Abs and Forearms") {
      List<int> repe = [8, 7, 30, 10, 12, 10005, 10];
      rep = repe;
    } else if (nomser == "Iron abdominal") {
      List<int> repe = [10020, 20, 25, 6, 5, 10];
      rep = repe;
    } else if (nomser == "It's leg day friends!") {
      List<int> repe = [20, 10020, 20, 15, 50, 8];
      rep = repe;
    } else if (nomser == "Full Max Cardio") {
      List<int> repe = [30, 40, 30, 10, 10, 20, 8];
      rep = repe;
    } else if (nomser == "Chest, arms and back at home") {
      List<int> repe = [10, 8, 10];
      rep = repe;
    } else if (nomser == "Pistol Squat") {
      List<int> repe = [20, 10020, 10020, 5, 10, 5, 40, 10030, 4];
      rep = repe;
    } else if (nomser == "L Sit") {
      List<int> repe = [10, 7, 10005, 10020, 10, 10, 40, 15];
      rep = repe;
    } else if (nomser == "Superman Push Ups") {
      List<int> repe = [8, 40, 10, 10020, 5, 10030, 40, 10];
      rep = repe;
    } else if (nomser == "Pull Over") {
      List<int> repe = [10, 5, 10004, 10015, 20, 10, 40];
      rep = repe;
    } else if (nomser == "Muscle Up") {
      List<int> repe = [5, 10, 10020, 10, 10, 10, 40];
      rep = repe;
    } else if (nomser == "Back Lever") {
      List<int> repe = [60, 10020, 10, 10, 10, 40, 10030, 10];
      rep = repe;
    } else if (nomser == "Front Lever") {
      List<int> repe = [50, 5, 10020, 10, 5, 5, 40, 10020];
      rep = repe;
    } else if (nomser == "Handstand") {
      List<int> repe = [20, 3, 10020, 10020, 10, 40, 30, 5];
      rep = repe;
    } else if (nomser == "Human Flag") {
      List<int> repe = [5, 3, 10020, 10010, 10, 20, 50, 60, 20, 20];
      rep = repe;
    } else if (nomser == "Straddle Planche") {
      List<int> repe = [10015, 10, 10020, 10010, 10, 10, 10010, 10060];
      rep = repe;
    } else if (nomser == "Hefesto") {
      List<int> repe = [60, 6, 10025, 15, 10, 8, 5, 10010, 10010];
      rep = repe;
    } else if (nomser == "Full Planche") {
      List<int> repe = [10015, 10, 10025, 10005, 15, 10, 10020, 7, 60];
      rep = repe;
    } else if (nomser == "Beast Mode") {
      List<int> repe = [8, 10020, 15, 50, 10060, 20, 30];
      rep = repe;
    } else if (nomser == "Breathe and pull") {
      List<int> repe = [30, 5, 5, 10025, 3, 10, 5, 5];
      rep = repe;
    } else if (nomser == "Breathe and push") {
      List<int> repe = [30, 10, 5, 15, 10020, 5, 5, 10, 5];
      rep = repe;
    } else if (nomser == "Legs, Abdomen, Cardio and Pull/Push Ups") {
      List<int> repe = [200, 5, 10020, 10, 20, 10, 3, 5, 10030];
      rep = repe;
    } else if (nomser == "Next Level Routine: Max") {
      List<int> repe = [60, 9999, 10020, 9999, 10, 9999, 10030, 9999];
      rep = repe;
    } else if (nomser == "Jumper") {
      List<int> repe = [30, 10, 10040, 10, 10, 15, 10015, 5];
      rep = repe;
    } else if (nomser == "Core Killer") {
      List<int> repe = [30, 50, 60, 300, 20, 10, 10180, 8, 10045, 60];
      rep = repe;
    } else if (nomser == "Full Body") {
      List<int> repe = [10020, 15, 60, 15, 10, 10, 20, 10, 20];
      rep = repe;
    } else if (nomser == "2 by 2 Full Body - Pull-ups") {
      List<int> repe = [5, -20, 5, -40, 5, -40];
      rep = repe;
    } else if (nomser == "2 by 2 Full Body - Push-ups") {
      List<int> repe = [8, -30, 12, -20, 10, -10];
      rep = repe;
    } else if (nomser == "2 by 2 Full Body - Core") {
      List<int> repe = [50, -10, 10030, -10, 10020, -15];
      rep = repe;
    } else if (nomser == "2 by 2 Full Body - Squats") {
      List<int> repe = [10, -10, 10, -30, 5, -15];
      rep = repe;
    } else if (nomser == "Challenge - Muscle Up") {
      List<int> repe = [1, 1, 1];
      rep = repe;
    } else if (nomser == "Challenge - Pull Ups") {
      List<int> repe = [1, 1, 1];
      rep = repe;
    } else if (nomser == "Next Level Routine: !!No limits!!") {
      List<int> repe = [
        50,
        9999,
        10020,
        9999,
        10030,
        9999,
        10060,
        9999,
        9999,
        10080,
        9999,
        9999,
        10060,
        9999,
        9999,
        9999,
        9999,
        9999
      ];
      rep = repe;
    }

    return rep;
  }
}
