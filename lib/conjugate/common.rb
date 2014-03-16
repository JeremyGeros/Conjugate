# -*- coding: utf-8 -*-
module Common
  @@dividing_infinitive_regex = /\{{3}\d+\}{3}([[:alpha:]]+)/

  def conjugate(opts ={})
    template = template(opts)
    tense = tense(opts[:tense])
    verb = opts[:verb]
    infinitive = template[:infinitive].dup

    verb_parts = divide_infinitive(infinitive, verb)

    return nil if (tense != :passe_compose) && (template[tense].nil? || template[tense][opts[:pronoun].to_sym].nil?)

    conjugation_template = nil

    if defined? conjugation_template_finder
      conjugation_template = conjugation_template_finder(template, tense, opts).dup
    else
      conjugation_template = template[tense][opts[:pronoun].to_sym].dup
    end

    positions = conjugation_template.scan(/\{{3}(\d+)\}{3}/).flatten

    positions.each do |p|
      if opts[:highlight]
        conjugation_template.gsub!(/\{{3}#{p}\}{3}/, "<span class='regular'>#{ verb_parts[p.to_i - 1] }</span>")
      else
        conjugation_template.gsub!(/\{{3}#{p}\}{3}/, verb_parts[p.to_i - 1])
      end
    end
    conjugation_template
  end

  # def conjugation_template_finder(template, tense, opts)
  #
  # end

  def regular_ending(verb)
    verb[-2..-1]
  end

  def tense(t)
    (common_name(t) || :present).to_sym
  end

  def divide_infinitive(infinitive, verb)
    inserts = infinitive.scan(@@dividing_infinitive_regex).flatten
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
end
