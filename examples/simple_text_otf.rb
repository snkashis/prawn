# encoding: utf-8

$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
require "prawn"

Prawn::Document.generate "hello-otf.pdf" do
  fill_color "0000ff"
  font "#{Prawn::BASEDIR}/data/fonts/inconsolata.otf"
  text "Hello World", :at => [200,720], :size => 32

  pad(20) do
    text "This is inconsolata wrapping " * 20
  end
end
