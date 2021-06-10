user = User.create!(
  email: "marlon.jf12@gmail.com",
  name: "Marlon",
  last_name: "Jordan"
)

lose_weight = Goal.create!(name: 'Lose Weight', user: user)

running = Habit.create!(name: "Running", goal: lose_weight)
studying = Habit.create!(name: "Studying", user: user)

running_scores = Score.create!(habit: Habit.first)
studying_scores = Score.create!(habit: Habit.first, created_at: 1.week.ago)
