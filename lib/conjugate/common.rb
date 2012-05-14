module Common
  def global_conjugate(opts ={})
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
  
end