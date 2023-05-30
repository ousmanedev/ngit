class Init
  NGIT_DIRECTORY_PATH = ".ngit".freeze

  def call
    raise("Existing NGit repository") if Dir.exists?(NGIT_DIRECTORY_PATH)

    Dir.mkdir(NGIT_DIRECTORY_PATH)
    create_directories(%w(objects objects/info objects/pack refs refs/heads refs/tags))
    create_files(%w(HEAD config))

    $stdout.puts "NGit initialized in #{NGIT_DIRECTORY_PATH}"
  end

  private

  def create_directories(paths)
    paths.each { |path| Dir.mkdir("#{NGIT_DIRECTORY_PATH}/#{path}") }
  end

  def create_files(paths)
    paths.each { |path| File.open("#{NGIT_DIRECTORY_PATH}/#{path}", "w") {} }
  end
end
