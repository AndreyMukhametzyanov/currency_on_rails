# frozen_string_literal: true
require 'net/http'
require 'uri'
require 'rexml/document'
require 'json'

class Parser
  CRB_PATH = 'https://www.cbr.ru/scripts/XML_daily.asp'

  def xml_into_hash
    crb_uri = URI.parse(CRB_PATH)
    response = Net::HTTP.get_response(crb_uri)
    doc = REXML::Document.new(response.body)
    doc.root.map do |element|
      {
        NumCode: element.elements['NumCode'].text,
        CharCode: element.elements['CharCode'].text,
        Nominal: element.elements['Nominal'].text,
        Name: element.elements['Name'].text,
        Value: element.elements['Value'].text
      }
    end
  end
end
