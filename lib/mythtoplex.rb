#!/usr/bin/env ruby
#require "mythtoplex/version"
require 'streamio-ffmpeg'
require 'ap'
require 'ruby-progressbar'
require 'logger'

logger = Logger.new('log.txt')
logger.level = Logger::WARN

# logger.debug("Created logger")
# logger.info("Program started")
# logger.warn("Nothing to do!")

module MythToPlex
  class Recording
    # /path/to/handofmyth.sh "%DIR%" "%FILE%" "%CHANID%" "%STARTTIMEUTC%"
    # "%TITLE%" "%SUBTITLE%" "%CATEGORY%" "%SEASON%" "%EPISODE%" "%ORIGINALAIRDATE%"

    def initialize(metadata)
      #initialize object with path
      @path = "#{metadata[:dir]}#{metadata[:file]}"
      @video = FFMPEG::Movie.new("#{@path}")
      #use printf formatting
      @filename = "assets/%s S%02dE%02d %s.mkv" % [metadata[:title], metadata[:season],
                                        metadata[:episode], metadata[:subtitle], ]
      puts @video.valid?
      #ap @video.methods.sort
    end #initialize
    def transcode(filename)
      progressbar = ProgressBar.create(:format => '%e %B %p%% %t',)
      puts @video.bitrate
      #options = {}
      options = { custom: "-vb #{@video.bitrate/2}k" }
      # encode with options and show progress bar
      @video.transcode(@filename, options) do |progress|
        progressbar.increment if progressbar.progress < (progress * 100).to_i
      end # transcode
    end # transcode

  end # Recording
end # MythToPlex

### Begin script
test = MythToPlex::Recording.new( {:dir   => "assets/",
                                   :file  => "small.mpg",
                                   :title => "Title",
                                   :episode => 2,
                                   :season => 1,
                                   :subtitle => "Subtitle"} )
test.transcode("movie.mkv")
