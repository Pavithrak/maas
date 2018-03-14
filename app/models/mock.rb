class Mock < ApplicationRecord
  before_save :default_values
  def default_values
    self.body ||= "{}"
    self.query ||= "{}"
  end
end
