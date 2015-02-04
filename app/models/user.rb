class User < ActiveRecord::Base
  has_secure_password

  FORMAT_EMAIL = /
    \A
    [a-z0-9]+([._][a-z0-9]+)*(\+[ˆ@]+)?
    @
    ([a-z0-9]+[-.][a-z0-9]+)*
    \.[a-z]{2,4}
    \z
  /xi

  validates_presence_of :name
  validates_format_of :email, with: FORMAT_EMAIL
  validates_uniqueness_of :email
  validates_confirmation_of :password

end
