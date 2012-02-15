require 'conjugate/templates/spanish_templates'
require 'conjugate/templates/spanish_irregular_verbs'

module Conjugate
  module Spanish
    extend self
    
    def conjugate(opts ={})
      unless opts[:template]
        irregular_template = SpanishIrregularVerbs[opts[:verb]]
        opts[:template] = irregular_template || opts[:verb][-2..-1]
      end
      opts[:tense] ||= "present"
      
      word = opts[:verb]
      
      infinitive = SpanishTemplates[opts[:template].to_sym][:infinitive]
      inserts = infinitive.scan(/\{{3}\d+\}{3}(\w+)/).flatten
      word_parts = []
      word_copy = word.dup
      inserts.each do |letters|
        sub_word = word_copy.scan(/(.+)#{letters}/).flatten.first
        puts "Sub word #{ sub_word.inspect }"
        if sub_word.nil? || sub_word == ""
          word_parts << ""
        else
          word_parts << sub_word
          word_copy = word_copy.gsub(/^#{sub_word}#{letters}/, '') 
        end
      end
      word_parts << word_copy unless word_copy == ""
      puts word_parts.inspect
      puts infinitive
      puts inserts.inspect
      puts word
      puts opts[:template]
      
      conjugation_template = SpanishTemplates[opts[:template].to_sym][opts[:tense].to_sym][opts[:pronoun].to_sym]
      positions = conjugation_template.scan(/\{{3}(\d+)\}{3}/).flatten
      verb = conjugation_template
      positions.each do |p|
        verb.gsub!(/\{{3}#{p}\}{3}/, word_parts[p.to_i - 1])
      end
      verb
      
    end
    
  end
end