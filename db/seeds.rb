# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all
Task.destroy_all

file_name = File.join(File.dirname(__FILE__), 'seeds.txt')
content_by_date = File.read(file_name).split("\n\n").map{|lines| lines.split("\n")}
content_by_date.each do |date_content|
  date_str, *task_strs = date_content
  date = Date.parse(date_str)
  task_strs.each do |task_str|
    match = /(.+) - (.+): (\d.\d+)/.match(task_str)
    if match
      category_name = match[1]
      description = match[2]
      duration = match[3].to_f
      category = Category.find_or_create_by(name: category_name)
      task = category.tasks.create(description: description, duration_in_hours: duration * 8, date: date)
      byebug unless task.valid?
    end
  end
end
