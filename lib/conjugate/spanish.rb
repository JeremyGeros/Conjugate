require 'conjugate/templates/spanish_templates'
require 'conjugate/templates/spanish_irregular_verbs'

module Conjugate
  module Spanish
    extend self
    
    def generate_list_of_know_irregular_verbs
      puts "- " + SpanishIrregularVerbs.keys.sort.join("\n- ")
    end
    
    @dividing_infinitive_regex = /\{{3}\d+\}{3}(\w+)/
    
    
    def conjugate(opts ={})
      @debug = opts[:debug].nil? ? false : true
      
      template = template(opts)
      debug(template)
      tense = tense(opts[:tense])
      
      verb = opts[:verb]
      debug(verb)
      
      infinitive = template[:infinitive].dup
      debug(infinitive)
      
      verb_parts = divide_infinitive(infinitive, verb)
      debug(verb_parts)
      
      return nil if template[tense].nil? || template[tense][opts[:pronoun].to_sym].nil?
      
      conjugation_template = template[tense][opts[:pronoun].to_sym].dup
      debug(conjugation_template)
      
      positions = conjugation_template.scan(/\{{3}(\d+)\}{3}/).flatten
      debug(positions)
      
      positions.each do |p|
        if opts[:highlight]
          conjugation_template.gsub!(/\{{3}#{p}\}{3}/, "<span class='regular'>#{ verb_parts[p.to_i - 1] }</span>")
        else
          conjugation_template.gsub!(/\{{3}#{p}\}{3}/, verb_parts[p.to_i - 1])
        end
      end
      conjugation_template
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