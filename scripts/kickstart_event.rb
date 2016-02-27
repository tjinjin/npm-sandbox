def manifest_path
  's3://tjinjin-upload-cirlcleci/manifests'
end

def environment
  'development'
end

def consul_host
  'test-deploy.tjinjin.net'
end

system <<-EOC
  curl -X PUT -d "#{manifest_path}/manifest_web_#{environment}.yml" http://#{consul_host}:8500/v1/event/fire/deploy_web_#{environment}.yml\?pretty
EOC
