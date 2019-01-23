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

  start ssl: thin start --ssl
debug erb: <% debugger %>
