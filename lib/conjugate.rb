# -*- coding: utf-8 -*-
require 'yaml'
require 'conjugate/spanish'
require 'conjugate/french'

module Conjugate

  def self.conjugate(opts = {})
    if opts[:language].downcase == 'french' || opts[:language].downcase == 'fr'
      Conjugate::French.conjugate(opts)
    elsif opts[:language].downcase == 'spanish' || opts[:language].downcase == 'es'
      Conjugate::Spanish.conjugate(opts)
    else
      raise ArgumentError.new("Langauge: #{ opts[:language] } is not able to be conjugated")  
    end
  end

end
