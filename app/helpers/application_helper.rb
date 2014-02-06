module ApplicationHelper
  def years_ago(date)
    ((Time.now - Date.parse(date).to_time)/1.year).floor
  end

  def skills
    skills = YAML::load(File.open('config/skills.yml'))
    skills = skills['skills'].values.flatten
    skills = skills.map{ |skill| skill.map{ |k, v| "text:'#{k}',weight:#{v}" }}.join('},{')

    javascript_tag "window.word_list = [{#{skills}}];"
  end
end