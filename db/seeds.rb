user = User.create!(
  email: 'marlon.jf12@gmail.com',
  name: 'Marlon',
  last_name: 'Jordan'
)

goals = {
  'Lose Weight' => ['Running', 'Gym', 'Eat Health'],
  'Read More' => ['Buy Books', 'Kindle', 'Read Everyday'],
  'Travel' => ['Buy Ticket', 'Plan', 'Vacation'],
}

goals.each do |goal, habits|
  goal = user.goals.create!(name: goal)
  habits.map { |habit| goal.habits.create(name: habit) }
end
