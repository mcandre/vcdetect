require 'rubygems'
require 'version'

#
# VCDetect - detect version control software for file paths
#
module VCDetect
  HOME = ENV['HOME']
  PARENT_OF_HOME = File.expand_path('..', HOME)

  #
  # Version Control Software names (command line tools, as symbols)
  # to version control internal data directory (omitting trailing slashes)
  #
  VC2DIR = {
    bzr: '.bzr',
    cvs: 'CVS',
    darcs: '_darcs',
    git: '.git',
    hg: '.hg',
    rcs: 'RCS',
    scss: 'SCSS',
    svn: '.svn'
  }

  #
  # Version control internal data directory (omitting trailing slashes)
  # to version Control Software names (command line tools, as symbols)
  #
  DIR2VC = VC2DIR.invert

  #
  # Version Control Software names (command line tools, as symbols)
  #
  VCS = VC2DIR.keys

  #
  # Version control internal data directory (omitting trailing slashes)
  #
  DIRS = VC2DIR.values

  #
  # Detect version control software managing a file path
  #
  # Assumes path exists.
  # Assuems path is reltive to $HOME.
  #
  # @path a file path (String)
  #
  def self.detect(path)
    parent = File.expand_path('..', path)

    if !File.directory?(path)
      detect(parent)
    elsif path == PARENT_OF_HOME
      :unknown
    else
      software = DIRS.select do |vc_dir|
        Dir.new(path).entries.include?(vc_dir)
      end

      if software.length == 0
        detect(parent)
      elsif software.length == 1
        DIR2VC[software.first]
      else
        :mix
      end
    end
  end
end
