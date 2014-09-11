require 'rubygems'
require 'version'

#
# VCDetect - detect version control software for file paths
#
module VCDetect
  HOME = ENV['HOME']
  PARENT_OF_HOME = File.expand_path('..', HOME)

  #
  # Version control software names (command line tools, as symbols)
  # to version control internal data file
  #
  VC2FILE = {
    accurev: 'site_slice',
    bzr: '.bzr',
    admsconsole: 'Vault',
    cvs: 'CVS',
    darcs: '_darcs',
    git: '.git',
    hci: 'harvest.sig',
    hg: '.hg',
    rcs: 'RCS',
    scss: 'SCSS',
    svn: '.svn'
  }

  #
  # Version control internal data file
  # to version control software names (command line tools, as symbols)
  #
  FILE2VC = VC2FILE.invert

  #
  # Version control software names (command line tools, as symbols)
  #
  VCS = VC2FILE.keys

  #
  # Version control internal data files
  #
  FILES = VC2FILE.values

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
      software = FILES.select do |vc_dir|
        Dir.new(path).entries.include?(vc_dir)
      end

      if software.length == 0
        detect(parent)
      elsif software.length == 1
        FILE2VC[software.first]
      else
        :mix
      end
    end
  end
end
