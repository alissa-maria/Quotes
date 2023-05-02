module AuthenticationController

using Genie, Genie.Renderer, Genie.Renderer.Html
using SearchLight
using Logging

using ..Main.UserApp.Users
using ..Main.UserApp.GenieAuthenticationViewHelper

using GenieAuthentication
using GenieAuthentication.GenieSession
using GenieAuthentication.GenieSession.Flash
using GenieAuthentication.GenieSessionFileSession


function show_login()
  html(:authentication, :login, context = @__MODULE__)
end

function login()
  try
    username = "general" # params(:username)
    password = Users.hash_password(params(:password))

    user = findone(User, username = username, password = password)
    authenticate(user.id, GenieSession.session(params()))

    redirect(:home)
  catch ex
    flash("Wachtwoord onjuist! ")

    redirect(:show_login)
  end
end

function logout()
  deauthenticate(GenieSession.session(params()))

  flash("Doei! ")

  redirect(:show_login)
end

function add_user(username::String, password::String)
  User(username  = username, password  = password |> Users.hash_password) |> save!
end

end