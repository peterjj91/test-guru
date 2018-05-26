# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
                { name: 'Tyler', email: 'tyler@mail.com' },
                { name: 'Adam', email: 'adam@mail.com'},
                { name: 'Elizabeth', email: 'elizabeth@mail.com'},
                { name: 'Sandy', email: 'sandy@mail.com'}
            ])

Category.create([
                    { title: 'ruby' },
                    { title: 'sql'  },
                    { title: 'html' },
                    { title: 'css'  },
                    { title: 'js'   }
                ])

Test.create([
                { title: 'Синтаксис Ruby', level: 1, category_id: 1 },
                { title: 'Синтаксис SQL', level: 1, category_id: 2 },
                { title: 'Синтаксис HTML', level: 5, category_id: 3 },
                { title: 'Синтаксис CSS', level: 5, category_id: 4 },
                { title: 'Синтаксис JS', level: 3, category_id: 5 }
            ])

Question.create([
                    { body: 'What operator begins the function description?', test_id: 1 },
                    { body: 'What command is used to create the table?', test_id: 1 },
                    { body: 'Which tag is used to describe the first level header?', test_id: 1 }
                ])

Answer.create([
                  { body: 'def', correct: true, question_id: 1 },
                  { body: 'func', correct: false, question_id: 1 },
                  { body: 'proc', correct: false, question_id: 1 }
              ])