class Lesson < ActiveRecord::Base


  validates :name, :presence => true
  validates :content, :presence => true
  validates :number, :presence => true

  def next
   if self.number >= Lesson.sort_lessons.last.number
     return self
   else
     return Lesson.sort_lessons.where("number > ?", self.number).first
   end
  end

  def prev
   if self.number <= Lesson.sort_lessons.first.number
     return self
   else
     return Lesson.sort_lessons.where("number < ?", self.number).last
   end
  end

  def self.sort_lessons
    return Lesson.order(:number)
  end
end
