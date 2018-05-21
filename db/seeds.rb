# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

player1 = Player.create(name: "Rob Falton", age: 27, address: "1 wok way, chinatown, PA")
player2 = Player.create(name: "Cary Grant", age: 44, address: "444 Hollywood Ave, Hollywood, CA")
player3 = Player.create(name: "Don Johnson", age: 34, address: "44 Sunset Lane, Portland, OR")
player4 = Player.create(name: "Jimmy Li", age: 40, address: "8973 Windsor St, San Francisco, CA")

sport1 = Sport.create(name: "Volleyball")
sport2 = Sport.create(name: "Baseball")
sport3 = Sport.create(name: "Basketball")
sport4 = Sport.create(name: "Hockey")
sport5 = Sport.create(name: "Curling")

Position.create(name: "middle back", player_id: player1_id, sport_id: sport1_id)
Position.create(name: "right field", player_id: player2_id, sport_id: sport2_id)
Position.create(name: "libero", player_id: player3_id, sport_id: sport1_id)
Position.create(name: "forward", player_id: player4_id, sport_id: sport3_id)
Position.create(name: "main", player_id: player2_id, sport_id: sport5_id)
