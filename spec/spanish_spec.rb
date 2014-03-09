# -*- coding: utf-8 -*-
require 'rspec'
require 'conjugate'


describe 'French Conjugations' do

  describe 'methods testing' do

    it '.find_irregular' do
      type = Conjugate::French.find_irregular('ventar')
      expect(type).to eq(:ar_e_ie)

      type = Conjugate::French.find_irregular('haber')
      expect(type).to eq(:er_haber)
    end

    it '.template' do
      template = Conjugate::French.template({verb: 'ventar'})
      expect(template[:present][:yo]).to eq('{{{1}}}ie{{{2}}}o')

      template = Conjugate::French.template({verb: 'placer'})
      expect(template[:present][:yo]).to eq('{{{1}}}ie{{{2}}}o')
    end
    it '.conjugate regular er' do
      verb = Conjugate::French.conjugate({verb: 'jouer', tense: :present, pronoun: :je})
      expect(verb).to eq('joue')

      verb = Conjugate::French.conjugate({verb: 'jouer', tense: :present, pronoun: :tu})
      expect(verb).to eq('joues')

      verb = Conjugate::French.conjugate({verb: 'jouer', tense: :present, pronoun: :il})
      expect(verb).to eq('joue')

      verb = Conjugate::French.conjugate({verb: 'jouer', tense: :present, pronoun: :nous})
      expect(verb).to eq('jouons')

      verb = Conjugate::French.conjugate({verb: 'jouer', tense: :present, pronoun: :vous})
      expect(verb).to eq('jouez')

      verb = Conjugate::French.conjugate({verb: 'jouer', tense: :present, pronoun: :ils})
      expect(verb).to eq('jouent')

      verb = Conjugate::French.conjugate({verb: 'jouer', tense: :past, pronoun: :je})
      expect(verb).to eq('ai joué')

      verb = Conjugate::French.conjugate({verb: 'jouer', tense: :future, pronoun: :je})
      expect(verb).to eq('jouerai')
    end

    it '.conjugate regular ir' do
      verb = Conjugate::French.conjugate({verb: 'choisir', tense: :present, pronoun: :je})
      expect(verb).to eq('choisis')

      verb = Conjugate::French.conjugate({verb: 'choisir', tense: :present, pronoun: :tu})
      expect(verb).to eq('choisis')

      verb = Conjugate::French.conjugate({verb: 'choisir', tense: :present, pronoun: :il})
      expect(verb).to eq('choisit')

      verb = Conjugate::French.conjugate({verb: 'choisir', tense: :present, pronoun: :nous})
      expect(verb).to eq('choisissons')

      verb = Conjugate::French.conjugate({verb: 'choisir', tense: :present, pronoun: :vous})
      expect(verb).to eq('choisissez')

      verb = Conjugate::French.conjugate({verb: 'choisir', tense: :present, pronoun: :ils})
      expect(verb).to eq('choisissent')

      verb = Conjugate::French.conjugate({verb: 'choisir', tense: :past, pronoun: :je})
      expect(verb).to eq('ai choisi')

      verb = Conjugate::French.conjugate({verb: 'choisir', tense: :future, pronoun: :je})
      expect(verb).to eq('choisirai')
    end

    it '.conjugate regular re' do
      verb = Conjugate::French.conjugate({verb: 'perdre', tense: :present, pronoun: :je})
      expect(verb).to eq('perds')

      verb = Conjugate::French.conjugate({verb: 'perdre', tense: :present, pronoun: :tu})
      expect(verb).to eq('perds')

      verb = Conjugate::French.conjugate({verb: 'perdre', tense: :present, pronoun: :il})
      expect(verb).to eq('perd')

      verb = Conjugate::French.conjugate({verb: 'perdre', tense: :present, pronoun: :nous})
      expect(verb).to eq('perdons')

      verb = Conjugate::French.conjugate({verb: 'perdre', tense: :present, pronoun: :vous})
      expect(verb).to eq('perdez')

      verb = Conjugate::French.conjugate({verb: 'perdre', tense: :present, pronoun: :ils})
      expect(verb).to eq('perdent')

      verb = Conjugate::French.conjugate({verb: 'perdre', tense: :past, pronoun: :je})
      expect(verb).to eq('ai perdu')

      verb = Conjugate::French.conjugate({verb: 'perdre', tense: :future, pronoun: :je})
      expect(verb).to eq('perdrai')
    end

    it '.conjugate_irregular avoir verb' do
      verb = Conjugate::French.conjugate({verb: 'faire', tense: :present, pronoun: :je})
      expect(verb).to eq('fais')

      verb = Conjugate::French.conjugate({verb: 'faire', tense: :past, pronoun: :je})
      expect(verb).to eq('ai fait')

      verb = Conjugate::French.conjugate({verb: 'faire', tense: :future, pronoun: :je})
      expect(verb).to eq('ferai')
    end


    it '.conjugate_irregular etre verb' do
      verb = Conjugate::French.conjugate({verb: 'aller', tense: :present, pronoun: :je})
      expect(verb).to eq('vais')

      verb = Conjugate::French.conjugate({verb: 'aller', tense: :past, pronoun: :je})
      expect(verb).to eq('suis allé‎')

      verb = Conjugate::French.conjugate({verb: 'aller', tense: :future, pronoun: :je})
      expect(verb).to eq('irai')
    end
  end
end
