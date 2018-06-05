MODELS:
  -Player
    -has_many :positions
    -has_many :sports, :through positions
    -Fields: Name, Password, Password_Confirmation, Age, Address
  -Sport
    -has_many :positions
    -has_many :players, through :positions
    -Fields: Name,
  -Position
    -belongs_to :player
    -belongs_to :sport
    -Fields: Name, player_id, sport_id

    ========================================================
  Facebook Authentication (Facebook dev)
  -change the website address to work pc ip Address
  -change Valid Oauth redirect URI to use:
  work: https://192.168.56.101:3000/auth/facebook/callback
  home:  https://192.168.1.175:3000/auth/facebook/callback
