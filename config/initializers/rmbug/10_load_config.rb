GIT_HOST = YAML.load_file("#{Rails.root}/config/rmbug.yml")["git_host"]
EMAIL_OPTS = YAML.load_file("#{Rails.root}/config/rmbug.yml")["email"]
GIT_OPTS = YAML.load_file("#{Rails.root}/config/rmbug.yml")["git"]
