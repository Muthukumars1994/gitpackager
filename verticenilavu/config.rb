module MegamPkg
  class Ger
    attr_accessor :halwa, :build_halwa
    CONFIG =  { os: %w(trusty jessie centos7), branch: '1.5', name: 'verticenilavu' }

    #    imgaf !Gem::Specification::find_all_by_name('pkgr').any?
    #         puts "gem install pkgr"
    #         system 'gem install pkgr'
    #end

    def os_ok!(build_os)
      raise "--- You have two horns. \nUnsupported os: #{build_os}" unless CONFIG[:os].include? build_os
    end
  end
end
