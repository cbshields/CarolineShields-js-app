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
view rake routes in browser: http://192.168.56.101:3000/rails/info/routes

nested routes for new forms, put both resources:
<%= form_for([@post, @comment], :remote => true) do |f|  %>
  <%= f.text_area :content %>

  <p><%= f.submit %></p>
<% end %>

when you don't know what "this" will render, do a console.log(this)

remember to use back ticks when using console.log and variable: ie: console.log(`${players}`)

if JS is not debugging properly, close the browser, then restart. May need to shut down rs as well
