#Seeds

#Runs
  #Training Paces
  TrainingPace.destroy_all
  
  TrainingPace.create(name: 'easy',
                      description:  'Top coaches and exercise physiologists believe that most ' +
                                    'runners should do 80 to 90 per cent of their weekly training ' +
                                    'at the easy run pace (this includes your long runs, done at ' +
                                      'approximately the same pace', 
                      multiplier_vo2: 0.7)
  TrainingPace.create(name: 'tempo',
                      description:  'Tempo runs help you improve your running economy and your running '+
                                    'form. You should do tempo runs no more than once a week, and they ' + 
                                    'should make up no more than 10 to 15 per cent of your total training' ,
                      multiplier_vo2: 0.88)
  TrainingPace.create(name: 'max',
                      description:  'VO2-max training helps you improve your running economy and your ' +
                                    'racing sharpness. You should do VO2-max workouts no more than once a ' +
                                    'week, and they should make up no more than 6 to 10 per cent of your total ' +
                                    'training',
                      multiplier_vo2: 1.0)
  TrainingPace.create(name: 'speed',
                      description:  'Speed-form workouts help you improve your running economy, ' +
                                    'form and leg speed. You should do speed-form sessions no ' +
                                    'more than once a week, and they should make up no more than ' +
                                    '4 to 8 per cent of your total training',
                      multiplier_vo2: 1.1)
  TrainingPace.create(name: 'long',
                      description:  'long runs form the foundation of all marathon training programs. ' +
                                    'long runs build everything from your confidence to your discipline ' +
                                    'to your fat-burning. In general, we believe that slower is better than ' +
                                    'faster. Let your long runs be your slow runs, and save your legs for ' +
                                    'other days of the week. The important thing is building up the distance.' ,
                      multiplier_vo2: 0.6)