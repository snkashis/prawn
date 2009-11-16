# encoding: utf-8
#
# This sample demonstrates the use of the :template option when generating
# a new Document. The template PDF file is imported into a new document.

require "#{File.dirname(__FILE__)}/../example_helper.rb"

filename = "#{Prawn::BASEDIR}/data/pdfs/hexagon.pdf"

pdf = Prawn::Document.new(:template => filename)

pdf.fill_color "00ff00"
pdf.fill_polygon [200, 350], [300, 400], [400, 350],
                 [400, 250], [300, 200], [200, 250]

pdf.render_file "template.pdf"
