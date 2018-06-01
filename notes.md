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
    -Field_with_errors (_form) : is that what they want - YES
    -player\_form: should I even have sport and position as nested forms, or only have sport? - have both
    -player\_form: edit link/delete button?
    -player\show:  how to have the sport and position listed
