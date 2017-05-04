class User < ActiveRecord::Base
  ##
   #make a favicon, test
  #check where rails sets defaul port and make sure it allows to check for heroku port
  #download locally, install git/heroku, push, test
  #research c9 disc space, maybe install linux and run from there or upgrade plan
  #download another student's rails project and see if you can host, https://github.com/kvoshell/Bloccit
  #check digital ocean
  has_many :wikis
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         
  after_initialize { self.role ||= :standard }
  enum role: [:standard, :admin]
end
