require 'vcdetect'

describe VCDetect, '#VC2DIR' do
  it 'contains common version control software with directories' do
    expect(VCDetect::VC2DIR[:git]).to eq('.git')
    expect(VCDetect::VC2DIR[:hg]).to eq('.hg')
    expect(VCDetect::VC2DIR[:svn]).to eq('.svn')
  end
end

describe VCDetect, '#DIR2VC' do
  it 'contains common version control directories with software' do
    expect(VCDetect::DIR2VC['.git']).to eq(:git)
    expect(VCDetect::DIR2VC['.hg']).to eq(:hg)
    expect(VCDetect::DIR2VC['.svn']).to eq(:svn)
  end
end

describe VCDetect, '#VCS' do
  it 'contains common version control software' do
    expect(VCDetect::VCS).to include(:git)
    expect(VCDetect::VCS).to include(:hg)
    expect(VCDetect::VCS).to include(:svn)
  end
end

describe VCDetect, '#DIRS' do
  it 'contains common version control directories' do
    expect(VCDetect::DIRS).to include('.git')
    expect(VCDetect::DIRS).to include('.hg')
    expect(VCDetect::DIRS).to include('.svn')
  end
end
