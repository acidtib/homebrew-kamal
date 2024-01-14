class Kamal < Formula
  desc "Deploy web apps anywhere."
  homepage "https://kamal-deploy.org"
  license "MIT"

  # latest stable release
  stable do
    url "https://github.com/basecamp/kamal.git", :tag => "v1.3.1"
  end

  # install from main branch
  head do
    url "https://github.com/basecamp/kamal.git", :branch => "main"
  end

  depends_on "ruby" => '3.2'
  uses_from_macos "ruby"

  def install
    # Parse version from lib/kamal/version.rb
    version = `grep -m1 -o 'VERSION = ".*"' lib/kamal/version.rb`.gsub(/[^0-9+\.]/, "")

    ENV["GEM_HOME"] = libexec

    system "gem", "build", "#{name}.gemspec"
    system "gem", "install", "#{name}-#{version}.gem"
    bin.install libexec/"bin/#{name}"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  # Provide instructions for how to use the 'kamal' CLI tool
  def caveats
    <<~EOS
      The 'kamal' command-line tool is used to deploy web apps anywhere.

      To install 'kamal', run the following command:

        $ brew tap acidtib/kamal
        $ brew install kamal

      Once installed, you can create a configuration file using the 'kamal init' command:

        $ kamal init

      This will create a new configuration file at the specified path with some default settings.

      You can then use the 'kamal deploy' command to deploy your app:

        $ kamal deploy

      For more information, visit the 'kamal' website at https://kamal-deploy.org.
    EOS
  end

  test do
    # Test that the 'kamal version' command returns a version number
    version_output = shell_output("#{bin}/kamal version")
    assert_match(/\d+\.\d+\.\d+/, version_output)
  end
end
