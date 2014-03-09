# -*- coding: utf-8 -*-
require 'conjugate/french_templates/templates'
require 'conjugate/french_templates/irregular_verbs'
require 'conjugate/common'

module Conjugate
  module French
    @@language = 'french'

    extend Common
    extend self



    def generate_list_of_know_irregular_verbs
      puts "- " + FrenchIrregularVerbs.keys.sort.join("\n- ")
    end

    def find_irregular(verb)
      FrenchIrregularVerbs[verb.downcase]
    end

    def template(opts)
      FrenchTemplates[(opts[:template] || find_irregular(opts[:verb]) || regular_ending(opts[:verb])).to_sym]
    end

    def conjugation_template_finder(template, tense, opts)
      if tense == :passe_compose
        if is_etre_verb(opts[:verb])
          debug(FrenchTemplates[:être])
          debug(FrenchTemplates[:être][:present])
          debug(FrenchTemplates[:être][:present][opts[:pronoun].to_sym])
          debug(template)
          FrenchTemplates[:être][:present][opts[:pronoun].to_sym] + ' ' + template[:past_participle]
        else
          FrenchTemplates[:avoir][:present][opts[:pronoun].to_sym] + ' ' + template[:past_participle]
        end
      else
        template[tense][opts[:pronoun].to_sym]
      end
    end

    def is_etre_verb(verb)
      ['monter', 'rester', 'sortir', 'venir', 'aller', 'naître', 'descendre', 'entrer', 'retourner', 'tomber', 'renter', 'arriver', 'mourir', 'partir', 'passer', 'décéder', 'redescendre', 'rentrer', 'remonter', 'repartir', 'renaître', 'retomber', 'ressortir', 'devenir', 'parvenir', 'revenir', 'survenir', 'provenir', 'intervenir', 'convenir', 'contrevenir', 'advenir'].include? verb.downcase
    end

    # stubbed method individual languages override this to support multiple tenses names
    def common_name(t)
      return nil unless t
      actual_tense = t.to_s.gsub(' ', '_').to_sym
      @changable_names ||= {:past => :passe_compose, :passé_composé => :passe_compose}
      actual_tense = @changable_names[actual_tense] || actual_tense
      actual_tense
    end

  end
end
