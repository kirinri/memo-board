require 'sinatra'
require 'sinatra/reloader'
require 'date'
require 'active_record'
require 'rack/csrf'

# セッションの活用を定義
use Rack::Session::Cookie, :secret => "thisissomethingsecret" 
# csrfの使用を宣言
use Rack::Csrf, raise: true

Time.zone_default = Time.find_zone! 'Tokyo'
ActiveRecord::Base.default_timezone = :local

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3", 
  "database" => "./table.db" 
)


class Users < ActiveRecord::Base
  validates :name, presence: true
  has_many :todos
end

class Todos < ActiveRecord::Base
  validates :body, presence: true
  # ★
  belongs_to :user
end



get '/' do
  @title = "やることリスト"
  @todos = Todos.all
  # ★　エラーになる
  # @todos = Todos.includes(:user).all
  @users = Users.all
  erb :index
end



post '/create' do
  # 二行で書くと、うまくいかない。,で区切って複数指定
  Todos.create(body: params[:body],users_userName: params[:user])

  redirect to('/')
end


post '/destroy' do
  Todos.find(params[:id]).destroy
end
