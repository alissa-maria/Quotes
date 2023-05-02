module GenieAuthenticationViewHelper

using GenieAuthentication.GenieSession
using GenieAuthentication.GenieSessionFileSession
using GenieAuthentication.GenieSession.Flash

export output_flash

function output_flash() :: String
  flash_has_message() ? """<div class="alert">$(flash())</div>""" : ""
end

end