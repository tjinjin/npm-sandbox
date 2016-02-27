require 'erb'
require 'yaml'

def template_file
  'manifest_web_development.yml.erb'
end

def file_path
  "#{ENV['CIRCLE_ARTIFACTS']}/manifest_web_development.yml"
end

def checksum
    %x(openssl sha256 #{ENV['CIRCLE_ARTIFACTS']}/resource.tgz | awk -F' ' '{print $2}').chomp
end

def time
  Time.now.strftime("%Y%m%d%H%M%S")
end

yaml = YAML.load(ERB.new(%x(cat config/#{template_file})).result(binding))

open(file_path,"w") do |file|
  YAML.dump(yaml,file)
end
