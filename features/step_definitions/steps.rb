require 'vcdetect'

Given(/^the program has finished$/) do
  @cucumber_larry = `vcdetect examples/larry/`
  @cucumber_moe = `vcdetect examples/moe/`
  @cucumber_curly = `vcdetect examples/curly/`
  @cucumber_curly_readme = `vcdetect examples/curly/README.md`
  @cucumber_shemp = `vcdetect examples/shemp/`
  @cucumber_examples = `vcdetect examples/`
  @cucumber_parent_of_home = `vcdetect #{VCDetect::PARENT_OF_HOME}`
  @cucumber_version = `vcdetect -v`
end

Then(/^the output is correct for each test$/) do
  lines_larry = @cucumber_larry.split("\n")
  expect(lines_larry.length).to eq(1)
  expect(lines_larry[0]).to match(%r(^examples/larry/\: hg$))

  lines_moe = @cucumber_moe.split("\n")
  expect(lines_moe.length).to eq(1)
  expect(lines_moe[0]).to match(%r(^examples/moe/\: svn$))

  lines_curly = @cucumber_curly.split("\n")
  expect(lines_curly.length).to eq(1)
  expect(lines_curly[0]).to match(%r(^examples/curly/\: cvs$))

  lines_curly_readme = @cucumber_curly_readme.split("\n")
  expect(lines_curly_readme.length).to eq(1)
  expect(lines_curly_readme[0]).to match(%r(^examples/curly/README.md\: cvs$))

  lines_shemp = @cucumber_shemp.split("\n")
  expect(lines_shemp.length).to eq(1)
  expect(lines_shemp[0]).to match(%r(^examples/shemp/\: cvs, hg$))

  lines_examples = @cucumber_examples.split("\n")
  expect(lines_examples.length).to eq(1)
  expect(lines_examples[0]).to match(%r(^examples/\: git$))

  lines_parent_of_home = @cucumber_parent_of_home.split("\n")
  expect(lines_parent_of_home.length).to eq(1)
  expect(lines_parent_of_home[0]).to match(%r(^#{VCDetect::PARENT_OF_HOME}\: unknown$))

  lines_version = @cucumber_version.split("\n")
  expect(lines_version.length).to eq(1)
  expect(lines_version[0]).to match(%r(^vcdetect .+$))
end
