require 'spec_helper'

describe Gitguard::Runner do
  around do |ex|
    Dir.mktmpdir do |dir|
      Dir.chdir(dir) do
        Cmd.run('git init')
        Cmd.run("echo 'gitguard test for #{__FILE__}' > README.md")
        Cmd.run('git add . && git commit -m "Initial commit"')
        Cmd.run("mkdir -p lib")
        Cmd.run("echo 'module Foo' >> lib/foo.rb")
        Cmd.run("echo 'end'        >> lib/foo.rb")
        Cmd.run('git add lib/foo.rb && git commit -m "Add Foo module"')
        ex.run
      end
    end
  end

  describe :checking do
    let(:runner){ Gitguard::Runner.new([]) }

    context "no changes" do
      ['.', 'lib'].each do |dir|
        context "at #{dir}" do
          around{|ex| Dir.chdir(dir){ ex.run } }
          it do
            expect(runner).to be_clean
            expect(runner).not_to be_changed
            expect(runner).not_to be_untracked_files
          end
        end
      end
    end

    context "with changes" do
      ['.', 'lib'].each do |dir|
        context "at #{dir}" do
          around do |ex|
            Cmd.run("echo '## Summary' >> README.md")
            Dir.chdir(dir){ ex.run }
          end
          it do
            expect(runner).not_to be_clean
            expect(runner).to be_changed
            expect(runner).not_to be_untracked_files
          end
        end
      end
    end

    context 'with untraced_files' do
      ['.', 'lib'].each do |dir|
        context "at #{dir}" do
          around do |ex|
            Cmd.run("echo '# Memo' >> MEMO.md")
            Dir.chdir(dir){ ex.run }
          end
          it do
            expect(runner).not_to be_clean
            expect(runner).not_to be_changed
            expect(runner).to be_untracked_files
          end
        end
      end
    end
  end
end
