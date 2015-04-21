require_relative 'version'

#
# VCDetect - detect version control software for file paths
#
# Assumes version control data is stored on the file system in
# plain, unambiguous, per-project fashion. This precludes
# the ability to detect arcane and offbeat version control
# software such as cvsnt, svk, and vss.
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
    admsconsole: 'Vault',
    arx: '_arx',
    bk: 'BitKeeper',
    bzr: '.bzr',
    cleartool: 'default.magic',
    cmvc: 'vc',
    cvs: 'CVS',
    darcs: '_darcs',
    dcvs: 'DCVSMETA',
    fossil: '_FOSSIL_',
    git: '.git',
    hci: 'harvest.sig',
    hg: '.hg',
    mcvs: 'MCVS',
    mtn: '_MTN',
    p4: 'depot',
    plastic: '.plastic',
    qvcs: 'qvcsMetaData',
    razor: 'RAZOR_UNIVERSE',
    rcs: 'RCS',
    scss: 'SCSS',
    svn: '.svn',
    teamware: 'Codemgr_wsdata'
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
        software.map do |s| FILE2VC[s] end
      end
    end
  end
end
