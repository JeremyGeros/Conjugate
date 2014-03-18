# -*- coding: utf-8 -*-
require 'rspec'
require 'conjugate'


describe 'French Conjugations' do

  describe 'methods testing' do

    it '.find_irregular' do
      type = Conjugate::French.find_irregular('aller')
      expect(type).to eq(:aller)

      type = Conjugate::French.find_irregular('placer')
      expect(type).to eq(:cer)
    end

    it '.template' do
      template = Conjugate::French.template({verb: 'aller'})
      expect(template[:present][:je]).to eq('vais')

      template = Conjugate::French.template({verb: 'placer'})
      expect(template[:present][:je]).to eq('{{{1}}}ce')
    end

    it '.regular_ending' do
      ending = Conjugate::French.regular_ending('aller')
      expect(ending).to eq('er')

      ending = Conjugate::French.regular_ending('vair')
      expect(ending).to eq('ir')
    end

    it '.tense' do
      tense = Conjugate::French.tense(:present)
      expect(tense).to eq(:present)

      tense = Conjugate::French.tense(:passé_composé)
      expect(tense).to eq(:passe_compose)

      tense = Conjugate::French.tense(:past)
      expect(tense).to eq(:passe_compose)
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

    it '.conjugates acheter correctly' do
      verb = Conjugate::French.conjugate({verb: 'acheter', tense: :present, pronoun: :je})
      expect(verb).to eq('achète')

      verb = Conjugate::French.conjugate({verb: 'acheter', tense: :present, pronoun: :tu})
      expect(verb).to eq('achètes')

      verb = Conjugate::French.conjugate({verb: 'acheter', tense: :present, pronoun: :il})
      expect(verb).to eq('achète')

      verb = Conjugate::French.conjugate({verb: 'acheter', tense: :present, pronoun: :nous})
      expect(verb).to eq('achetons')

      verb = Conjugate::French.conjugate({verb: 'acheter', tense: :present, pronoun: :vous})
      expect(verb).to eq('achetez')

      verb = Conjugate::French.conjugate({verb: 'acheter', tense: :present, pronoun: :ils})
      expect(verb).to eq('achètent')



      verb = Conjugate::French.conjugate({verb: 'acheter', tense: :conditional, pronoun: :je})
      expect(verb).to eq('achèterais')

      verb = Conjugate::French.conjugate({verb: 'acheter', tense: :conditional, pronoun: :tu})
      expect(verb).to eq('achèterais')

      verb = Conjugate::French.conjugate({verb: 'acheter', tense: :conditional, pronoun: :il})
      expect(verb).to eq('achèterait')

      verb = Conjugate::French.conjugate({verb: 'acheter', tense: :conditional, pronoun: :nous})
      expect(verb).to eq('achèterions')

      verb = Conjugate::French.conjugate({verb: 'acheter', tense: :conditional, pronoun: :vous})
      expect(verb).to eq('achèteriez')

      verb = Conjugate::French.conjugate({verb: 'acheter', tense: :conditional, pronoun: :ils})
      expect(verb).to eq('achèteraient')

    end
  end
end
