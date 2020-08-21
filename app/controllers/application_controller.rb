class ApplicationController < ActionController::Base
def render_top_page
   render template: "tests/index"
 end
end
