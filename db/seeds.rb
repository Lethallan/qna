User.create!(
  [
    { nickname: 'Gollum', email: 'gollum_gollum@bla.com', password: 'myprescious' },
    { nickname: 'Morgoth', email: 'melkor_the_best@bla.com', password: 'silmarilsaremine' },
    { nickname: 'Sauron', email: 'mairon@bla.com', password: 'maironrules' },
    { nickname: 'Gandalf', email: 'gandalf@bla.com', password: 'oldbastard' }
  ]
)

Question.create!(
  [
    {
      title: 'Where is my prescious?',
      body: 'Somebody has stolen it!',
      user_id: User.find_by(email: 'gollum_gollum@bla.com').id
    },

    { title: 'Why nobody loves me?',
      body: 'I am all alone...',
      user_id: User.find_by(email: 'melkor_the_best@bla.com').id },

    {
      title: 'What can I do??!?!?!!!!!111',
      body: 'Go back to Angband and get drunk...',
      user_id: User.find_by(email: 'melkor_the_best@bla.com').id
    },

    {
      title: 'Is anybody here?',
      body: 'I heard somebody singing...',
      user_id: User.find_by(email: 'gandalf@bla.com').id
    },

    {
      title: 'Hobbits?',
      body: 'I hate hobbits',
      user_id: User.find_by(email: 'mairon@bla.com').id
    }
  ]
)

Answer.create!(
  [
    { body: 'Fucking hobbits!',
      user_id: User.find_by(email: 'mairon@bla.com').id,
      question_id: 1 },

    {
      body: 'I love you, Morgoth!',
      user_id: User.find_by(email: 'mairon@bla.com').id,
      question_id: 2
    },

    {
      body: 'Go kill yourself',
      user_id: User.find_by(email: 'gandalf@bla.com').id,
      question_id: 3
    },

    {
      body: 'Kiss me, my love!',
      user_id: User.find_by(email: 'mairon@bla.com').id,
      question_id: 3
    },

    {
      body: 'Gollum! Gollum!',
      user_id: User.find_by(email: 'gollum_gollum@bla.com').id,
      question_id: 4
    },

    {
      body: 'Gollum! Gollum!',
      user_id: User.find_by(email: 'gollum_gollum@bla.com').id,
      question_id: 5
    },

    {
      body: 'Fuck it, bro...',
      user_id: User.find_by(email: 'mairon@bla.com').id,
      question_id: 1
    },

    {
      body: 'Gollum! Gollum!',
      user_id: User.find_by(email: 'gollum_gollum@bla.com').id,
      question_id: 2
    },

    {
      body: 'Gollum! Gollum!',
      user_id: User.find_by(email: 'gollum_gollum@bla.com').id,
      question_id: 3
    }

  ]
)