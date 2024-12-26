import 'package:calistenico/src/models/exercise_model.dart';

class ExercisesDB {
  ExercisesDB();

  List<Exercise> getSuelo() {
    List<Exercise> floor = [];

    floor.add(new Exercise(
        "Push-ups",
        "⭐",
        "Chest and triceps",
        "Incline push-ups, knee push-ups",
        "Clap push-ups, Superman push-ups.",
        "Push-ups just require you to push your body away from the ground, supporting yourself on your hands and toes and keeping your midsection tense. Basic exercise of Calisthenics and Street Workout training. ",
        "-",
        'push_ups'));
    floor.add(new Exercise(
        "Decline push-ups",
        "⭐",
        "Chest, triceps and shoulders.",
        "Push-ups",
        "Pike push ups, hindu push ups, assisted handstand pushups.",
        "Hands on the ground, feet elevated and the same movement as push-ups.",
        "-",
        'decline_push_ups'));
    floor.add(new Exercise(
        "Pike Push Ups",
        "⭐⭐",
        "Chest, triceps and shoulders.",
        "Push-ups, decline push-ups.",
        "Hindu push ups, Assisted handstand pushups.",
        "Bring your hands and feet closer, raising your hips. ",
        " Preparatory exercise for handstand work.",
        'pike_push_ups'));
    floor.add(new Exercise(
        "Archer push-ups",
        "⭐⭐",
        "Chest and triceps",
        "Wide grip push-ups.",
        "one arm push-ups.",
        "You flex one arm and the other is completely stretched.  ",
        "To master this exercise you must rotate your hands in accordance with the movement of your arms..",
        'archer_push_ups'));
    floor.add(new Exercise(
        "Pseudo push-ups",
        "⭐⭐",
        "Chest, triceps and shoulders.",
        "Decline push-ups, hindu push ups.",
        "Planche lean, frog stand, tucked planche.",
        "The hands are placed at the level of the navel and the common push-ups are done.",
        "-",
        'pseudo_planche_push_up'));
    floor.add(new Exercise(
        "360° push-ups",
        "⭐⭐⭐",
        "Chest and triceps.",
        "T push-ups, clap push-ups.",
        "Push-up freestyle.",
        "When you go up, you cross one leg behind and rest it on the ground, this allows you to turn 360° and fall back into the flexed position.",
        "It is not very difficult to do if you place the sole of the foot of the leg that you cross on the ground.",
        'push_ups_multi'));
    floor.add(new Exercise(
        "Superman push-ups",
        "⭐⭐⭐",
        "Chest and triceps.",
        "Clap push-ups, thigh clap push-ups.",
        "Superman with back slap.",
        "On each rep you lift your hands and feet off the ground.",
        "To learn to do this exercise, first help yourself with the swing of the hip. ",
        'superman_push_ups'));
    floor.add(new Exercise(
        "Jumping Jacks",
        "⭐",
        "Legs, especially calves. Strengthens the whole body.",
        "-",
        "Explosive squat.",
        "Stand with your feet together and your arms at your sides. Jump up, moving your feet and arms to the sides as you do. Keep moving your feet and arms out, until you're back on the ground, at which point your feet are wide apart and your arms are raised above your head. From this position, jump back up and bring your feet back to center and arms back to your sides.",
        "-",
        'jumping_jacks'));
    floor.add(new Exercise(
        "Wall sit",
        "⭐",
        "Quadriceps.",
        "Assisted squat.",
        "Squat.",
        "Stand with your back against the wall and your knees bent, forming a 90° angle, hold in that position.",
        "-",
        'wall_sit'));
    floor.add(new Exercise(
        "Sprint",
        "⭐",
        "Legs",
        "Skipping in site",
        "-",
        "Perform a run with an intensity level of 90% for 30 seconds or the amount of time chosen.",
        "-",
        'sprint'));
    floor.add(new Exercise(
        "Squat",
        "⭐",
        "Quadriceps and glutes",
        " Assisted squat, short squat.",
        "Explosive squat. ",
        "Stand with your heels shoulder-width apart and your arms hugging your chest or in front of your body. Bend your knees, keeping your back as straight as possible and looking straight ahead. Drive your hips back and down at the same time. As you lower your body, push your knees out and let your hips drop into the hollow of your knees. Also, make sure that your feet remain as flat as possible, and that no part of the sole leaves the ground at any time. Keep going as low as you physically can. From this lowest point, drive your hips up to the starting position. This counts as one repetition. ",
        "The squat is a fairly complex movement, with a lot of play between muscles and joints, and it's actually quite easy to perform incorrectly. ",
        'squats'));
    floor.add(new Exercise(
        "Skipping in site",
        "⭐",
        "Quadriceps and abdomen. ",
        "-",
        "Lunges",
        "Standing, raise one knee to form a 90 degree angle, lower it and raise the other. At the same time, bring the opposite arm of the raised leg to a 90-degree flexion for complete coordination. It is performed as if we were doing a race with the knees raised on the spot.",
        "Keep the hip elevated at all times, preventing it from descending when placing the foot on the ground and maintaining the position of the trunk, which should be kept straight and slightly inclined forward.",
        'skipping'));
    floor.add(new Exercise(
        "Calf Lift",
        "⭐",
        "Calves",
        "Short movement at the beginning and increase the range.",
        "Shotgun pistol squat assisted.",
        "Stand on the edge of a step or low bar, on one foot. Contract the calf to get on your toes and then come back down. ",
        "-",
        'pantorilla'));
    floor.add(new Exercise(
        "Lunge",
        "⭐",
        "Quadriceps and glutes.",
        "Short squat, squat.",
        "Bulgarian squat, Explosive lunges with change.",
        "Stand with your feet shoulder-width apart and your hands at your sides. Take a step forward with one leg, as if taking a long stride. Make sure your heel hits the ground first, followed by the rest of your foot. From this position, bend both legs until your rear knee is almost touching the ground. Try to keep your torso as upright as possible throughout the entire movement. From this lowest point, you can press hard with your front foot and return to a standing position, or you can press hard with your back leg and step forward. The first method can be done in a small area, obviously, since you are practically moving at one point, but the second requires a little more space, since you will have to move forward.",
        "-",
        'zancada'));
    floor.add(new Exercise(
        "Side lunges",
        "⭐",
        "Quadriceps, hamstrings, glutes.",
        "Lunges",
        "Explosive switch lunges, 1-leg short squats, deep squats.",
        "Stand up and take a long step to the side, bending your knee while keeping the other knee straight. ",
        "-",
        'zancadas_laterales'));
    floor.add(new Exercise(
        "Leg Curl",
        "⭐",
        "Femoral and gluteal. ",
        "Do short repetitions and increase the range. ",
        "One Leg Hamstring Curl.",
        "Lie face up on the floor, bend your knees and lift your hips until your back is in line with your thighs.",
        "-",
        'curl_femoral'));
    floor.add(new Exercise(
        "Leg Plank",
        "⭐",
        "Lower back and glutes.",
        "-",
        "Hyperextensions",
        "Get into a push-up position and lift one of your legs as much as you can, until you notice the gluteus contracted well. Same with the other leg.",
        "-",
        'leg_plank'));
    floor.add(new Exercise(
        "Front Kicks",
        "⭐",
        "Quadriceps and abdomen. ",
        "-",
        "Front kicks with squats.",
        "Standing, raise one knee to form a 90 degree angle and kick forward, return to the starting position and repeat with the other leg.",
        "-",
        'front_kicks'));
    floor.add(new Exercise(
        "One leg short squat",
        "⭐⭐",
        "Quadriceps and glutes.",
        "Squat, bulgarian squat, side lunges.",
        "Assisted pistol squat, airborne squat.",
        "Balance on one leg and perform short repetitions, going down to 45°",
        "-",
        'short_single_leg_sqaut'));
    floor.add(new Exercise(
        "Explosive Squat",
        "⭐⭐",
        "Quadriceps, glutes, calves.",
        "Squat, deep squat.",
        "Box jumps. ",
        "Perform a normal squat but when going up add explosiveness to the movement, so that you jump, for greater difficulty bring your knees to your chest. ",
        "-",
        'explosive_squat'));
    floor.add(new Exercise(
        "Pistol Squat",
        "⭐⭐⭐⭐",
        "Quadriceps, hamstrings, glutes.",
        "Deep squat, assisted pistol squat.",
        "Shotgun pistol squat, explosive squat pistol.",
        "\tStand on one leg, with the other as horizontal as possible. Crouch down on the leg that is flat on the ground, keeping the heel planted. Putting your arms in front of your body can help you keep your balance. When you reach the bottom of the movement, push back up to the starting position. This counts as one repetition. ",
        "Just like the one-arm push-ups and one-arm pull-ups, the single-leg squat is a unilateral exercise, and as such, builds large amounts of strength and sports experience. The progressions to achieve the correct movement of the exercise are:\n" +
            "1. Single leg squat with assistance. \n" +
            "2. Single leg squat, on a box. \n" +
            "3. Single leg squat. \n" +
            "4. Single leg squat, with additional weight. ",
        'pistol_squat'));

    floor.add(new Exercise(
        "Plank",
        "⭐",
        "ABS y psoas.",
        "Short crunches, crunches. ",
        "Side Plank, Advanced Ab Plank.",
        "Place your forearms or hands on the floor, as you would for push-ups. Extend your feet behind your body and balance on your toes. Next, raise your hips until your shoulders, hips, knees, and ankles are in line. Hold this position as long as possible.",
        "-",
        'plank'));
    floor.add(new Exercise(
        "Side Plank",
        "⭐",
        "Abdominals, mainly the obliques. ",
        "Plank.",
        "Windshield wipers on ground, Human flag.",
        "Place one forearm on the ground and extend your legs to 0 degrees of this arm. Place the bottom foot on its side, and the other foot on top of the first. Next, lift your hips up to form a straight line that can be drawn by joining your shoulders, hips, knees, and ankles. Your midsection should be parallel to the ground, and you should feel tension in your obliques closest to the ground.",
        "-",
        'side_plank'));
    floor.add(new Exercise(
        "Crunches",
        "⭐",
        "ABS.",
        "Short crunches on the floor.",
        "Knee raises in dips.",
        "Lying face up on the floor, bend your knees and keep your feet on the ground, perform an abdominal contraction so that your back rises off the ground and your head goes to your knee.",
        "-",
        'crunches'));
    floor.add(new Exercise(
        "Mountain Climbers",
        "⭐",
        "ABS",
        "-",
        "Knee raises in dips.",
        "Get into push-up position. Next, bring one of your knees as close to your chest as you can and return your leg to the starting position. Repeat the same movement with the other leg, alternating between both.",
        "-",
        'mountain_climbers'));
    floor.add(new Exercise(
        "Burpees",
        "⭐⭐",
        "Full body.",
        "Squats, push-ups, mountain climbers.",
        "Advanced exercises.",
        "Squatting with the hands on the ground, both legs are extended behind and at the same time an elbow flexion is made, returning to position 1 and from the previous position a vertical jump is made.",
        "-",
        'burpees'));
    floor.add(new Exercise(
        "The Hollow",
        "⭐⭐",
        "Abdominals and psoas ",
        "Full crunches on the floor.",
        "Leg lifts on the floor.",
        "Lie on your back, with your legs extended and your arms by your sides. She lifts her shoulders and upper back off the ground, and lifts her hands off the ground. Then lift your legs off the ground, making sure your lower and mid-back stay off the ground. Imagine pressing your spine down as hard as you can, or trying to bring your navel toward the ground. Now hold the position for as long as you can.",
        "-",
        'hollow'));
    floor.add(new Exercise(
        "Flutter Kicks",
        "⭐⭐",
        "Abdominals and psoas",
        "Plank, crunches.",
        "Leg raises on floor, windshield wipers on floor.",
        "Lying on your back, raise your legs just enough so that your heels do not touch the ground and start freestyle swimming kicks. ",
        "-",
        'flutter_kicks'));
    floor.add(new Exercise(
        "Scissors",
        "⭐⭐",
        "Abs and psoas ",
        "Plank, crunches.",
        "Leg raises on floor, windshield wipers on floor.",
        "Lying on your back, raise your legs just enough so that your heels do not touch the ground, keep them there and cross them over and over again.",
        "-",
        'scissors'));
    floor.add(new Exercise(
        "Russian Twist Crunches",
        "⭐⭐",
        "abdominals and obliques.",
        "Full crunches on the floor.",
        "Knee raises on the bar with a wink.",
        " Lie on your back on the floor, resting on the upper part of your buttocks and with your knees bent. Join your hands in a \"prayer\" position and turn your torso from side to side.",
        "-",
        'russian_twists'));
    floor.add(new Exercise(
        "Assisted handstand against the wall",
        "⭐",
        "Shoulder and triceps ",
        "Decline push-ups, pike push ups.",
        "Assisted handstand pushups, handstand.",
        "Place your hands on the floor and push off with your legs to stand in a handstand against the wall (with your back to the wall). ",
        "This version allows you to rest your feet on a wall, so you don't have to worry about losing your balance. This is what most people are most concerned about when they start training to do a handstand, as falling onto your back makes you feel like you've lost control, and in that case it can be very difficult to regain your balance. self-confidence.",
        'wall_handstand'));
    floor.add(new Exercise(
        "Assisted handstand pushups",
        "⭐⭐",
        "Shoulder and triceps",
        " Pike push ups, short assisted handstand pushups.",
        "Most handstand and planches exercises.",
        "Make a handstand against the wall and bend your arms until your forehead touches the ground, go back up until your arms are fully stretched. Basic exercise for most shoulder exercises. ",
        "-",
        'wall_handstand'));
    floor.add(new Exercise(
        "Handstand",
        "⭐⭐⭐",
        "Shoulder, triceps and core.",
        "Handstand push-ups, assisted handstand push-ups, handstand walk.",
        "Deep handstand pushups, handstand downs to pseudo planche.",
        "Make a handstand and when you are in balance stretch your arms to the maximum and squeeze your abdomen, retracting the pelvis so that you are in a \"hollow\" position, this will make the handstand completely straight.",
        "Handstand without support is best learned in phases: \n" +
            "\n" +
            "1. The handstand leaning against a wall. \n" +
            "2. Return to normal state from the handstand position. \n" +
            "3. Do a handstand on low parallel bars.\n" +
            "4. Do a handstand on the floor. ",
        'handstand'));
    floor.add(new Exercise(
        "Handstand to PseudoPlanche",
        "⭐⭐⭐⭐",
        "Shoulder, triceps, core. ",
        "Deep handstand pushups.",
        "Straddle press to handstand, tiger bend.",
        "From a handstand position, bend your elbows and let your legs drop, keeping your body straight, try to stop yourself parallel to the floor",
        "-",
        'handstand_pseudo_planche'));
    floor.add(new Exercise(
        "Handstand push-up with clap",
        "⭐⭐⭐⭐⭐",
        "Shoulder and triceps. ",
        "Frog to handstand, assisted handstand push-ups.",
        "Tiger bend.",
        "Climb from frog to handstand in the most explosive way you can, so that you jump and clap your hands in the air. Wait until your legs are all the way up before taking the jump to avoid losing your balance as you land. ",
        "-",
        'handstand_push_ups'));
    floor.add(new Exercise(
        "Tiger Bend",
        "⭐⭐⭐⭐⭐",
        "Shoulder and triceps. ",
        "Pine on forearms, changes to tiger bend with one hand.",
        "Planche exercises.",
        "Get into handstand and lower to handstand with forearms, then give a short push to come back up to handstand with both arms at the same time. ",
        "The key is to get your head far enough forward when you push off. ",
        'tiger_bend'));
    floor.add(new Exercise(
        "Frog stand",
        "⭐",
        "Shoulders and triceps.",
        "Decline pushups.",
        "Turtle planche.",
        "Squat on the ground with your arms inside your thighs, support your hands and lean forward until your feet are off the ground. The elbows remain flexed.",
        "",
        'frog'));
    floor.add(new Exercise(
        "Tucked Planche",
        "⭐⭐",
        "Shoulders.",
        "Assisted handstand pushups, frog stand, planche lean.",
        "Tucked planche push ups, advanced tucked planche.",
        "Get into a frog position but with your arms outside your legs and lift your feet off the ground, usually delivered first with unlocked elbows and then with locked elbows.",
        "-",
        'tucked_planche'));
    floor.add(new Exercise(
        "Dragon Flag",
        "⭐⭐⭐",
        "Dorsal and abdominal. ",
        "Dragon flag 1 leg.",
        "Front lever. ",
        "On a bar near the ground, on your back with your head close to it, use a supine grip and stay at a 45° angle, with both legs straight and only your upper back on the ground. ",
        "-",
        'dragon_flag'));
    floor.add(new Exercise(
        "Handstand to Straddle Planche",
        "⭐⭐⭐⭐",
        "Shoulders",
        "Descent from handstand to pseudo planche.",
        "Straddle Planche. ",
        "Get into a handstand position, open your legs and try to go down little by little, until you get a position parallel to the ground. ",
        "It is recommended to first learn to do it with unlocked elbows and then improve until blocking. ",
        'handstand_straddle'));
    floor.add(new Exercise(
        "Straddle Planche",
        "⭐⭐⭐⭐",
        "Shoulders",
        "Descent from handstand to straddle.",
        "Full planche. ",
        "Place your hands on the floor wider than shoulder-width apart, with your hands slightly pointing outwards, open your legs and lean forward until your feet are off the ground. ",
        "-",
        'straddle_planche'));
    floor.add(new Exercise(
        "Full Planche",
        "⭐⭐⭐⭐⭐",
        "Hombros",
        "Handstand to full planche, straddle planche.",
        "Full maltese planche. ",
        "Place your hands on the floor wider than shoulder-width apart, with your hands slightly pointing outwards, bring your legs together and lean forward until your feet are off the ground. Ideally, the scapulae are protected and there is not too much lumbar curve. ",
        "To do the planche you can use four hand positions:\n" +
            "• Fingers facing forward \n" +
            "• With low parallel bars \n" +
            "• Fingers looking back \n" +
            "• With the tips of the fingers ",
        'full_planche'));
    return floor;
  }

  List<Exercise> getParalelas() {
    List<Exercise> parallel_bars = [];

    parallel_bars.add(new Exercise(
        "Dips",
        "⭐",
        "Chest and triceps.",
        "Bench dips, statics, short dips, negative dips. ",
        "Explosive dips, clap dips, elbow dips, korean dips.",
        "On parallel bars, support yourself with your arms and go down until the elbow reaches at least a 90° angle, go up until you lock your elbows. Basic Calisthenics exercise. ",
        "-",
        'dips'));
    parallel_bars.add(new Exercise(
        "Bench dips",
        "⭐",
        "Chest and triceps.",
        "Static positions, short repetitions, benches or bars with greater height.",
        "Statics on parallel bars, short dips, dips, korean dips.",
        "On a bench or low bar, lie on your back with your hands on the edge.",
        "On a bench or low bar, lie on your back with your hands on the edge. It is a good exercise for those who cannot do normal dips. ",
        'bench_dips'));
    parallel_bars.add(new Exercise(
        "Trapezius shrugs",
        "⭐⭐",
        "Trapeze",
        "Static in parallel bars.",
        " Assisted Handstand Trapeze Shrugs.",
        "In a static dip position, contract and relax the trapezius. Always keep your arms straight and do a high number of repetitions.",
        "-",
        'dips_multi'));
    parallel_bars.add(new Exercise(
        "Dips to Tucked Planche",
        "⭐⭐⭐",
        "Chest, triceps and shoulders.",
        "Dips, frog stand, planche lean, tucked planche.",
        "Handstand in parallel bars, straddle planche.",
        "Do a dip and as you go up, lift your hips and bring your knees to your chest, until your feet reach at least the height of the bars. ",
        "-",
        'dips_multi'));
    parallel_bars.add(new Exercise(
        "Clap dips",
        "⭐⭐⭐⭐",
        "Pectorals and triceps.",
        "Explosive dips, spartan explosive dips with change, dips with jump in supports.",
        "180° dips, 270° dips, freestyle in dips.",
        "Perform explosive dips by clapping your hands in the air",
        "Help yourself by lifting your knees when jumping, over time you will reduce this help. ",
        'dips_multi'));
    parallel_bars.add(new Exercise(
        "180° dips",
        "⭐⭐⭐⭐⭐",
        "Chest and triceps.",
        "Explosive dips, with clap, with jump in boxes. ",
        "Dips 270°, freestyle on dips.",
        "Perform a bottom and turn in the air until you are facing the opposite side.",
        "Help yourself by lifting your knees when jumping, over time you will reduce this help. ",
        'dips_multi'));
    parallel_bars.add(new Exercise(
        "Static L Sit on Dips",
        "⭐⭐",
        "Abdominals, psoas.",
        "L sit raises in dips.",
        "L sit raises on dips with a wink.",
        "Get into dips and lift your legs straight up to form a 90° angle, hold this position as long as you can.",
        "-",
        'l_sit_parallels'));
    parallel_bars.add(new Exercise(
        "Deep handstand pushups",
        "⭐⭐⭐⭐",
        "Shoulders and triceps.",
        "Assisted handstand pushups, handstand pushups",
        "Straddle press to handstand.",
        "Do handstand push-ups on parallel bars, so that your head drops below the level of the bars. Try to keep your body straight (rather than arched) so you don't lose your balance. ",
        "-",
        'handstand_paralelas'));
    parallel_bars.add(new Exercise(
        "L Sit to Handstand",
        "⭐⭐⭐⭐",
        "Shoulders, triceps and core.",
        "Tucked planche to handstand, L sit on parallel bars.",
        "Straddle press to handstand, press to handstand.",
        "Using parallel bars or push-up grips, get into an L-sit position and pick up your legs to switch to handstand.",
        "-",
        'l_sit_handstand'));

    return parallel_bars;
  }

  List<Exercise> getBarra() {
    List<Exercise> bar = [];

    bar.add(new Exercise(
        "Australian Pull Ups",
        "⭐",
        "Back and biceps. ",
        "Start with a high bar and work your way down.",
        "Pull-ups ",
        "On a low bar, do a rowing motion with an overhand grip. The difficulty can be adapted by varying the height of the bar. ",
        "-",
        'australian_pull_ups'));
    bar.add(new Exercise(
        "Pull-ups",
        "⭐",
        "Back and biceps. ",
        "Australian pull ups, negative and short pull-ups. ",
        "Explosive pull-ups, muscle up, bar row. ",
        "On the pull-up bar, holding your hands palms forward, bend your arms until your chin goes over the bar and lower until your arms are straight.. ",
        "-",
        'pull_ups'));
    bar.add(new Exercise(
        "Chin-ups",
        "⭐",
        "Back and biceps. ",
        "Australian pull ups, negative and short pull-ups. ",
        "L chin-up pull-ups, chin-up muscle up. ",
        "On the pull-up bar, holding your palms towards you, bend your arms until your chin goes over the bar and lower until your arms are straight. ",
        "-",
        'chin_ups'));
    bar.add(new Exercise(
        "Straight bar dips",
        "⭐⭐",
        "Chest and triceps.",
        "Dips.",
        "Muscle up, one arm dips.",
        "Perform dips by placing both hands on the same bar. Try to lower yourself until your chest grazes the bar. ",
        "-",
        'straight_bar_dips'));
    bar.add(new Exercise(
        "Korean Dips",
        "⭐⭐",
        "Chest, shoulders and triceps.",
        "Dips, straight bar dips.",
        "Back lever, hefesto. ",
        "Stand with your back to the bar with an overhand grip and do dips in this position, take advantage of the body's swing so you don't get stuck when trying to climb. ",
        "-",
        'korean_dips'));
    bar.add(new Exercise(
        "Pull-ups with steps",
        "⭐⭐",
        "Back, biceps and abs.",
        "Pull-ups",
        "Freestyle on bar",
        "Normal pull-ups but moving your feet, simulating that there is a ladder, can also be applied to any other type of pull-ups, especially archers. ",
        "-",
        'archer_pull_up'));
    bar.add(new Exercise(
        "Archer pull-ups",
        "⭐⭐",
        "Back and biceps. ",
        "Wide grip pull-ups, asymmetrical pull-ups",
        "Typewriter, freestyle on bar.",
        "Same as asymmetrical pull-ups, but when you go up to one arm, you fully stretch the other, so that the forearm and the hand are above the bar. ",
        "-",
        'archer_pull_up'));
    bar.add(new Exercise(
        "Chin-up pull-ups Artem Morozov",
        "⭐⭐⭐",
        "Back and biceps. ",
        "Chin-up pull-ups, L chin-up pull-ups.",
        "Front lever. ",
        "Perform chin-up pull-ups so explosive that the bar reaches navel height. Try to keep your abs locked and your legs forward. ",
        "-",
        'pull_ups_multi'));
    bar.add(new Exercise(
        "Clap Pull-Ups",
        "⭐⭐⭐",
        "Back and biceps. ",
        "Explosive pull-ups.",
        "Muscle up, pull-ups with clap between the legs. ",
        "Perform explosive pull-ups, clapping your hands above the bar. ",
        "-",
        'pull_ups_multi'));
    bar.add(new Exercise(
        "Knee Raises",
        "⭐",
        "Abs, psoas. ",
        "knee raises on the floor.",
        "L sit raises on bar. ",
        "Hang from the bar and bring your knees to your chest, without bending your arms. In order to do repetitions correctly you must find the right rhythm. ",
        "-",
        'knee_raises'));
    bar.add(new Exercise(
        "Leg Raises",
        "⭐⭐",
        "Abs, lumbar, psoas.",
        "Knee raises on the bar.",
        "Windshield wipers, pullover.",
        "Hanging on the bar, bring your feet to it, trying not to bend your knees. ",
        "-",
        'leg_raises'));
    bar.add(new Exercise(
        "Pullover",
        "⭐⭐",
        "Abdominals, psoas, dorsal, biceps.",
        "Leg raises, pull-ups.",
        "L sit pullover. ",
        "Hanging on the bar, bring your feet to it and at the same time bend your arms, so that you rotate above the bar and turn around until you are in a bottom position on the bar. ",
        "-",
        'leg_raises'));
    bar.add(new Exercise(
        "Jump Assisted Muscle Up",
        "⭐",
        "Dorsal, pectoral and triceps.",
        "Pull-ups, bar dips.",
        "Muscle up.",
        "In a bar at medium-low height, help yourself with a jump to go up and stay in a dip position on the bar. ",
        "-",
        'muscle_up'));
    bar.add(new Exercise(
        "Olympic Muscle Up",
        "⭐⭐⭐",
        "Dorsal, pectoral and triceps. ",
        "Muscle up assisted with jump ",
        "Muscle up, freestyle. ",
        "Hang from the bar and take a strong chest forward, use that momentum to bring your feet to the bar and generate a lever that allows you to rise above it, keeping your arms as straight as possible. ",
        "-",
        'muscle_up'));
    bar.add(new Exercise(
        "Muscle Up",
        "⭐⭐⭐",
        "Dorsal, biceps, pectoral and triceps.",
        "Assisted muscle up, explosive pull-ups, bar dips. ",
        "Other muscle up exercises.",
        "Hanging from the bar, go up explosively, putting your head above the bar and being in a bottom position on the bar.",
        "-",
        'muscle_up'));
    bar.add(new Exercise(
        "Straight Muscle Up",
        "⭐⭐⭐⭐",
        "Dorsal, biceps, pectoral and triceps.",
        "Muscle up, slow muscle up.",
        "Muscle up with change",
        "Normal muscle up but keeping the legs straight, without bending the knees or moving the feet forward more than 30 cm with respect to the bar.",
        "-",
        'straight_muscle_ups'));
    bar.add(new Exercise(
        "Muscle Up with jump",
        "⭐⭐⭐⭐",
        "Dorsal, biceps, pectoral and triceps.",
        "Muscle up, explosive dips.",
        "Muscle up 360.",
        " You do a normal muscle up but when you get to the top you swing your legs, resting your hips on the bar, so you can jump and land back in a pull-up position.",
        "-",
        'straight_muscle_ups'));
    bar.add(new Exercise(
        "Muscle Up 360°",
        "⭐⭐⭐⭐⭐",
        "Dorsal, biceps, pectoral and triceps.",
        "Muscle up with jump, explosive dips.",
        "Freestyle on bar.",
        "Same as the jumping muscle up but turning on yourself, so that you make a 360° turn and land in a dominated position. ",
        " Try to jump up and not back.",
        'straight_muscle_ups'));
    bar.add(new Exercise(
        "Handstand bar",
        "⭐⭐⭐⭐",
        "Shoulder and triceps.",
        "Tucked handstand planche, assisted handstand push-ups, handstand.",
        "Freestyle on bar.",
        "Stand on a bar and go up to handstand, either frog to handstand or tucked planche to handstand. ",
        "Concentrate on the movement of the wrists to be able to maintain the balance.",
        'handstand_bar'));
    bar.add(new Exercise(
        "Skin the cat",
        "⭐",
        "Dorsal and shoulders.",
        "Knee raises.",
        "Back lever, hefesto.",
        "Hanging from the bar, pick up your legs and pass them between your arms, try to turn as much as possible until your feet point towards the ground.",
        "-",
        'skin_the_cat'));
    bar.add(new Exercise(
        "Tucked Human Flag",
        "⭐⭐",
        "Dorsal and shoulders.",
        "Wide and mixed grip pull-ups, assisted handstand push-ups.",
        "Fallen Human Flag.",
        "On some monkey bars or a vertical bar, place one hand higher than your head and the other at waist height, bring your knees to your chest and try to stay in that position.",
        "-",
        'human_flag'));
    bar.add(new Exercise(
        "Tucked Front Lever",
        "⭐⭐",
        "Dorsal and abdominal.",
        "Pull-ups and leg raises.",
        "1 leg front lever.",
        "Stand on the bar with an overhand grip and bring your knees to your chest, keeping your arms straight and trying to keep your back parallel to the ground.",
        "-",
        'tuck_front_lever'));
    bar.add(new Exercise(
        "Back Lever",
        "⭐⭐⭐⭐",
        "Shoulders, pectoral and lumbar.",
        "1 leg back lever.",
        "Hefesto.",
        "On the bar with an overhand grip, pass your legs between your hands and try to stay parallel to the ground.",
        "-",
        'back_lever'));
    bar.add(new Exercise(
        "Human Flag",
        "⭐⭐⭐⭐",
        "Shoulders, dorsal and obliques.",
        "Fallen Human Flag.",
        "Freestyle.",
        "On some monkey bars or a vertical bar, place one hand higher than your head and the other at waist level and try to stay parallel to the floor.",
        "-",
        'human_flag'));
    bar.add(new Exercise(
        "Front Lever",
        "⭐⭐⭐⭐",
        "Dorsal, abdominal and upper back.",
        " Tucked front lever, one leg and half front lever.",
        "Freestyle on bar.",
        "On a bar with an overhand grip, stand parallel to the ground with both legs straight..",
        "-",
        'front_lever'));
    bar.add(new Exercise(
        "Hefesto",
        "⭐⭐⭐⭐⭐",
        "Biceps, shoulders, lower back.",
        "Hefesto with feet on the floor.",
        "Freestyle on bar.",
        "On a supine grip bar, pass your legs between your hands and try to bend your elbows until you are above the bar, with your lower back resting on it.",
        "-",
        'hefesto'));

    return bar;
  }

  List<Exercise> getAll() {
    List<Exercise> listAll = [];

    for (int i = 0; i < getSuelo().length; i++) {
      listAll.add(getSuelo()[i]);
    }
    for (int i = 0; i < getParalelas().length; i++) {
      listAll.add(getParalelas()[i]);
    }
    for (int i = 0; i < getBarra().length; i++) {
      listAll.add(getBarra()[i]);
    }

    return listAll;
  }
}
