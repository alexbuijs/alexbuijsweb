module ApplicationHelper
  def years_old
    ((Time.now - Date.new(1974, 5, 17).to_time)/1.year).floor
  end

  def years_experience
    ((Time.now - Date.new(2006, 1, 1).to_time)/1.year).floor
  end
end
