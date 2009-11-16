# encoding: utf-8
#
# This sample demonstrates the use of the :template option when generating
# a new Document. The template PDF file is imported into a new document.

require "#{File.dirname(__FILE__)}/../example_helper.rb"

filename = "#{Prawn::BASEDIR}/data/pdfs/hexagon.pdf"
#filename = "#{Prawn::BASEDIR}/reference_pdfs/curves.pdf"
#filename = "#{Prawn::BASEDIR}/reference_pdfs/fancy_table.pdf"

pdf = Prawn::Document.new(:template => filename)
pdf.render_file "template.pdf"
