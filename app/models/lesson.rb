class Lesson < ActiveRecord::Base
 belongs_to :section

  validates :name, :presence => true
  validates :content, :presence => true
  validates :number, :presence => true

  default_scope {order(:number)}

  def next
   if self == Lesson.last
    return self
    #  return Lesson.first
   else
     return Lesson.where("number > ?", self.number).first
   end
  end

  def prev
   if self == Lesson.first
     return self
   else
     return Lesson.where("number < ?", self.number).last
   end
  end

  # def self.sort_lessons
  #   return Lesson.order(:number)
  # end
end
