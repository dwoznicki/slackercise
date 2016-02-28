class User < ActiveRecord::Base

  def self.update_or_create_by(args, attributes)
    self.find_or_create_by(args)
    self.update(attributes)
  end
end
