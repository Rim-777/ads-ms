module ApplicationLoader
  extend self

  def load_app!
    require_app
  end

  private

  def require_app
    require_file('config/application')
  end

  def init_app
    require_dir('config/initializers')
  end

  def require_file(file_path)
    require global_path_to(file_path)
  end

  def require_dir(dir_path)
    Dir["#{global_path_to(dir_path)}/**/*.rb"].each { |f| require f }
  end

  def root
    File.expand_path('..', __dir__)
  end

  def global_path_to(dir_or_file)
    File.join(root, dir_or_file)
  end
end
