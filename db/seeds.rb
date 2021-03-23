marlon = User.create!(
  email: "marlon.jf12@gmail.com",
  first_name: "Marlon",
  last_name: "Jordan"
)

running = Habit.create!(name: "Running", user: marlon)
studying = Habit.create!(name: "Studying", user: marlon)

running_scores = Score.create!(habit: Habit.first)
studying_scores = Score.create!(habit: Habit.first, created_at: 1.week.ago)
