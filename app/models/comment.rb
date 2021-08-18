class Comment < ActiveRecord::Base
  include Visible
  belongs_to :article
end
