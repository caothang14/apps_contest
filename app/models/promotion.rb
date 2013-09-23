class Promotion < ActiveRecord::Base
  belongs_to :category
  belongs_to :store

  validates :description, presence: true
  validate :valid_dates

  private
    def valid_dates
      if begin_date >= end_date
        self.errors.add :begin_date, ' has to be after end date'
      end
    end

end
