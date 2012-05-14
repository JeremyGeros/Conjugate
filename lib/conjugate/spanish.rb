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
    
    def common_name(t)
      return nil unless t
      changable_names = {:past => :preterite}
      tense = changable_names[t.to_sym] || t
      tense
    end
    
  end
end