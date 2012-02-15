require 'templates/spanish_templates'

module Conjugate
  module Spanish
    extend self

    puts Hi
    
    def conjugate(opts ={})
      template = opts[:template].to_sym
      word = opts[:verb]
      
      infinitive = @templates[template][:infinitive]
      inserts = infinitive.scan(/\{{3}\d+\}{3}(\w+)/).flatten
      word_parts = []
      word_copy = word.dup
      inserts.each do |letters|
        sub_word = word_copy.scan(/(.+)#{letters}/).flatten.first
        word_parts << sub_word
        word_copy = word_copy.gsub(/^#{sub_word}#{letters}/, '')
      end
      word_parts << word_copy unless word_copy == ""
      
      conjugation_template = @templates[template][opts[:tense]][opts[:pronoun]]
      positions = conjugation_template.scan(/\{{3}(\d+)\}{3}/).flatten
      verb = conjugation_template
      positions.each do |p|
        verb.gsub!(/\{{3}#{p}\}{3}/, word_parts[p.to_i - 1])
      end
      verb
      
    end
    
  end
end