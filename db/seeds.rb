User.create!(
  [
    { nickname: 'Gollum', email: 'gollum_gollum@bla.com', password: 'myprescious' },
    { nickname: 'Morgoth', email: 'melkor_the_best@bla.com', password: 'silmarilsaremine' }
  ]
)

Question.create!(
  [
    { title: 'Where is my prescious?', body: 'Somebody has stolen it!', user_id: User.find_by(email: 'gollum_gollum@bla.com').id },
    { title: 'Why nobody loves me?', body: 'I am all alone...', user_id: User.find_by(email: 'melkor_the_best@bla.com').id },
    { title: 'What can I do??!?!?!!!!!111', body: 'Go to back Angband and get drunk...', user_id: User.find_by(email: 'melkor_the_best@bla.com').id }
  ]
)