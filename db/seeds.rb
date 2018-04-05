# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
                { name: 'Tyler' },
                { name: 'Adam'},
                { name: 'Elizabeth'},
                { name: 'Sandy'}
            ])

Category.create([
                    { title: 'ruby' },
                    { title: 'sql' },
                    { title: 'html' },
                    { title: 'css'},
                    { title: 'js'}
                ])

Question.create([
                    { body: 'What operator begins the function description?'},
                    { body: 'What command is used to create the table?'},
                    { body: 'Which tag is used to describe the first level header?'}
                ])

Answer.create([
                  { body: 'def', correct: true },
                  { body: 'func', correct: false },
                  { body: 'proc', correct: false },
                  { body: 'h1', correct: true },
                  { body: 'header1', correct: false },
                  { body: 'title', correct: false }
              ])

Test.create([
                { title: 'Синтаксис Ruby', level: 1 },
                { title: 'Синтаксис SQL', level: 1 },
                { title: 'Синтаксис HTML', level: 5 },
                { title: 'Синтаксис CSS', level: 5 },
                { title: 'Синтаксис JS', level: 3 }
            ])