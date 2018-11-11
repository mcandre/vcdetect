require 'vcdetect'

describe VCDetect, '#VC2FILE' do
    it 'contains common version control software with directories' do
        expect(VCDetect::VC2FILE[:git]).to eq('.git')
        expect(VCDetect::VC2FILE[:hg]).to eq('.hg')
        expect(VCDetect::VC2FILE[:svn]).to eq('.svn')
    end
end

describe VCDetect, '#FILE2VC' do
    it 'contains common version control directories with software' do
        expect(VCDetect::FILE2VC['.git']).to eq(:git)
        expect(VCDetect::FILE2VC['.hg']).to eq(:hg)
        expect(VCDetect::FILE2VC['.svn']).to eq(:svn)
    end
end

describe VCDetect, '#VCS' do
    it 'contains common version control software' do
        expect(VCDetect::VCS).to include(:git)
        expect(VCDetect::VCS).to include(:hg)
        expect(VCDetect::VCS).to include(:svn)
    end
end

describe VCDetect, '#FILES' do
    it 'contains common version control directories' do
        expect(VCDetect::FILES).to include('.git')
        expect(VCDetect::FILES).to include('.hg')
        expect(VCDetect::FILES).to include('.svn')
    end
end
