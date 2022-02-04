class User < ApplicationRecord
    before_save {self.email = email.downcase} #used to convert email in downcase before save
    has_many :articles # has_many is an association which user to specify user has many articles and its associate user table to  articles table
    validates :username, presence: true, # username always require 
               uniqueness: {case_sensitive: false}, # username always unique
               length:{minimum: 3, maximum: 25} # length of username is b/w 3-25

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i  # Specify email format using regex 

    validates :email, presence: true, # email always require 
              uniqueness: {case_sensitive: false}, # always unique
              length:{ maximum: 25}, #email max length is 25
              format:{with: VALID_EMAIL_REGEX} # validate email in specify formate
              
    has_secure_password
end
