require 'conjugate/templates/spanish_templates'
require 'conjugate/templates/spanish_irregular_verbs'
require 'conjugate/common'

module Conjugate
  module Spanish
    extend self
    include Common
    
    def generate_list_of_know_irregular_verbs
      puts "- " + SpanishIrregularVerbs.keys.sort.join("\n- ")
    end
    
    @dividing_infinitive_regex = /\{{3}\d+\}{3}(\w+)/
    
    
    def conjugate(opts = {})
      global_conjugate(opts)
    end
    
    def find_irregular(verb)
      SpanishIrregularVerbs[verb.downcase]
    end
    
    def regular_ending(verb)
      verb[-2..-1]
    end
    
    def template(opts)
      SpanishTemplates[(opts[:template] || find_irregular(opts[:verb]) || regular_ending(opts[:verb])).to_sym]
    end
    
    def tense(t)
      (common_name(t) || :present).to_sym
    end
    
    def common_name(t)
      return nil unless t
      changable_names = {:past => :preterite}
      tense = changable_names[t.to_sym] || t
      tense
    end
    
    def divide_infinitive(infinitive, verb)
      inserts = infinitive.scan(@dividing_infinitive_regex).flatten
      debug(inserts)
      
      word_parts = []
      word_copy = verb.dup
      
      inserts.each do |letters|
        sub_word = ""
        if letters.length <= 1
          sub_word = word_copy.scan(/(.[^#{letters}]*)#{letters}/).flatten.first
        else
          sub_word = word_copy.scan(/(.+)#{letters}/).flatten.first
        end
        sub_word ||= ""
        
        word_parts << sub_word
        word_copy = word_copy.gsub(/^#{sub_word}#{letters}/, '') 
      end
      word_parts << word_copy unless word_copy == ""
      word_parts
    end
    
    def debug(info)
      if @debug
        puts info.inspect
      end
    end
    
  end
end