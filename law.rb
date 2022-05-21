require 'docx'
folder = File.expand_path('.', __dir__)
$:.unshift(folder) unless $:.include?(folder)
require 'cn_num_convert'




doc = Docx::Document.open('/home/whx/民法典.docx')

# Retrieve and display paragraphs
doc.paragraphs.each do |p|
  str = p.to_s
  if str =~ /^第[\u4e00-\u9fa5]*条/
      puts str
  end
end