class Promotion < ActiveRecord::Base
  belongs_to :category
  belongs_to :store

  validates :description, presence: true
  validate :valid_dates

  before_save :convert_tags_to_id

  def convert_tags_to_string
    s = self.tags
    if self.tags
      self.tags.split(",").each do |tag_id|
        s = s.gsub(tag_id, Tag.find(tag_id.to_i).name)
      end
    end
    s
  end

  private
  def valid_dates
    if begin_date >= end_date
      self.errors.add :begin_date, ' has to be after end date'
    end
  end
  def convert_tags_to_id
    s = self.tags
    self.tags.split(",").each do |tag_name|
      if Tag.find_by(name: tag_name)
        s = s.gsub(tag_name, Tag.find_by(name: tag_name).id.to_s)
      else
        s = s.gsub(tag_name, Tag.create(name: tag_name).id.to_s)
      end
    end
    self.tags = s
  end

end
