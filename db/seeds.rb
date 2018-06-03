# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

player1 = Player.create(name: "Rob Falton", age: 15, address: "1 wok way, chinatown, PA", password: "iloverails")
player2 = Player.create(name: "Cary Grant", age: 13, address: "444 Hollywood Ave, Hollywood, CA", password: "iloverails")
player3 = Player.create(name: "Don Johnson", age: 21, address: "44 Sunset Lane, Portland, OR", password: "iloverails")
player4 = Player.create(name: "Jimmy Li", age: 12, address: "8973 Windsor St, San Francisco, CA", password: "iloverails")

sport1 = Sport.create(name: "Volleyball")
sport2 = Sport.create(name: "Baseball")
sport3 = Sport.create(name: "Basketball")
sport4 = Sport.create(name: "Hockey")
sport5 = Sport.create(name: "Curling")

Position.create(name: "middle back", player_id: player1.id, sport_id: sport1.id)
Position.create(name: "right field", player_id: player2.id, sport_id: sport2.id)
Position.create(name: "libero", player_id: player3.id, sport_id: sport1.id)
Position.create(name: "forward", player_id: player4.id, sport_id: sport3.id)
Position.create(name: "main", player_id: player2.id, sport_id: sport5.id)
