require "guard"
require "guard/guard"
require "guard/watcher"
require "sprockets"
require "fileutils"

module Guard
  class Jsx < Guard

    DEFAULTS = {
      :target => "#target InDesign-7.0",
      :main_jsx => 'index.jsx',
      :build_folder => './build'
    }

    def initialize watchers=[], opt={}
      watchers = [] if !watchers
      defaults = DEFAULTS.clone

      super(watchers, defaults.merge(opt))

      target_folder = Dir.glob("**/{,/*/**}/*.jsx").map{|x| File.expand_path(File.dirname x)}.uniq
      
      ENV["INDESIGN_VERSION"] = options[:target]

      @env = Sprockets::Environment.new Dir.pwd
      @env.register_mime_type 'application/javascript', '.jsx'
      target_folder.each{|x| @env.append_path x }

      @bd = File.expand_path(options[:build_folder])
      unless File.exists? @bd
        FileUtils.mkdir_p @bd
      end

      @manifest = Sprockets::Manifest.new @env, @bd
      
    end

    def run_on_change paths
      all_jsx = Dir.glob("**/{,/*/**}/*.jsx")
      @manifest.compile all_jsx
      
      jsx = @env[options[:main_jsx]]
      open(File.join(File.expand_path(@bd), options[:main_jsx]),'w'){|f| f.write jsx }
    end

  end
end
