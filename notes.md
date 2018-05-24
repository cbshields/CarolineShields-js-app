MODELS:
  -Player
    -has_many :teams
    -has_many :sports, :through teams
    -Fields: Name, Age, Address
  -Sport
    -has_many :teams
    -has_many :players, through :teams
    -Fields: Name,
  -Position
    -belongs_to :player
    -belongs_to :sport
    -Fields: Name, player_id, sport_id

    ========================================================
    -Field_with_errors (_form) : is that what they want
    -player\_form: should I even have sport and position as nested forms, or only have sport?
    -player\_form: edit link/delete button?
    -player\show:  how to have the sport and position listed
    -can’t search github to save my life/what is the best way to search for code
