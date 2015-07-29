class Ebook < ActiveRecord::Base
  belongs_to :user
  def generate_epub(dir, filename)
    dump_markdown("#{dir}/#{filename}.md")
    dump_config(dir + "/config.yml")
    Dir.chdir(dir) { %x[rpub compile] }
  end

  def dump_config dest
    file = File.open(dest, "w")
    file.puts "---"
    file.puts "creator: " + user.full_name if user
    file.puts "language: " + language if language
    file.puts "title: " + title if language
    file.puts "publisher: " + publisher if language
    file.puts "subject: " + subject if subject
    file.puts "rights: " + rights if rights
    file.puts "description: " + description if description
    file.close
  end

  def dump_markdown dest
    file = File.open(dest, "w")
    file.puts markdown
    file.close
  end
end
