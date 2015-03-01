class Book < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :user

  scope :completeness, -> {
    order('completed_at nulls first')
  }

  def status
    if completed_at
      'completed'
    else
      'pending'
    end
  end
end
