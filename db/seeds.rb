require 'sinatra'
require 'sinatra/activerecord'

require_relative '../models/user.rb'
require_relative '../models/match.rb'
require_relative '../models/player.rb'
require_relative '../models/player_match.rb'
require_relative '../models/tournament.rb'
require_relative '../models/pool.rb'

User.create([
  {user_name: "Alice", email: "alice@email.com", password: "a"},
  {user_name: "Bob", email: "bob@email.com", password: "b"}
])

Tournament.create([
  {name: "Capitol Grapple", user_id: 1}
])

Player.create(
  {name: "Alice", weight: 55, age: 20, gender: "female", rank: "advanced", tournament_id: 1},
  {name: "Becky", weight: 55, age: 20, gender: "female", rank: "advanced", tournament_id: 1},
  {name: "Chelsea", weight: 55, age: 20, gender: "female", rank: "advanced", tournament_id: 1},
  {name: "Debra", weight: 55, age: 20, gender: "female", rank: "advanced", tournament_id: 1},
  {name: "Arthur", weight: 70, age: 20, gender: "male", rank: "advanced", tournament_id: 1},
  {name: "Bob", weight: 70, age: 20, gender: "male", rank: "advanced", tournament_id: 1},
  {name: "Charlie", weight: 70, age: 20, gender: "male", rank: "advanced", tournament_id: 1},
  {name: "Dan", weight: 70, age: 20, gender: "male", rank: "advanced", tournament_id: 1}
])

Pool.create([
  {name:"Women's Lightweight", gender: "female", rank: "advanced", min_age: 18, max_age: 35, min_weight: 52, max_weight: 57, tournament_id: 1},
  {name:"Men's Lightweight", gender: "male", rank: "advanced", min_age: 18, max_age: 35, min_weight: 66, max_weight: 73, tournament_id: 1},
])