class User < ActiveRecord::Base 

    has_many :posts
    validates :username, presence: true
    validates :email, presence: true
    validates :password, presence: true
    has_secure_password

    validates_uniqueness_of :username
    validates_uniqueness_of :email


    def slug
        name = self.username.split(" ")
        name.join("-").downcase
    end
    
    def self.find_by_slug(slug)
        name = slug.split("-")
        name = name.join(" ")
        User.where("username LIKE ?",name).first
    end
end 