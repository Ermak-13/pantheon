require 'sinatra/base'

require 'settings'
require 'models/init'


module CMS
  class Application < Sinatra::Base
    get '/page/new' do
      %Q(
      <html>
        <head><title>Welcom To CMS</title></head>
        <body>
          <h1>New Page</h1>
          <form action="#{CMS_MOUNTED_URL}/page/create" method="post">
            <div class="input-field">
              <input type="text" name="page[url]" id="page-url" />
            </div>
            <div class="input-field">
              <textarea name="page[content]" id="page-content" style="width:700px; height:500px"></textarea>
            </div>
            <div class="input-field">
              <input type="text" name="page[author]" id="page-author" />  
            </div>
            <input type="submit" />
          </form>
        </body>
      </html>
      )
    end

    post '/page/create' do
      Page.create params['page']
      redirect to('/page/new')
    end
  end
end
