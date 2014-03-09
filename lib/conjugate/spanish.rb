# -*- coding: utf-8 -*-
require 'conjugate/spanish_templates/templates'
require 'conjugate/spanish_templates/irregular_verbs'
require 'conjugate/common'

module Conjugate
  module Spanish
    extend self
    extend Common

    def generate_list_of_know_irregular_verbs
      puts "- " + SpanishIrregularVerbs.keys.sort.join("\n- ")
    end

    def find_irregular(verb)
      SpanishIrregularVerbs[verb.downcase]
    end

    def template(opts)
      SpanishTemplates[(opts[:template] || find_irregular(opts[:verb]) || regular_ending(opts[:verb])).to_sym]
    end

  end
end
