# -*- coding: utf-8 -*-
require 'rspec'
require 'conjugate'


describe 'Spanish Conjugations' do

  describe 'methods testing' do

    it '.find_irregular' do
      type = Conjugate::Spanish.find_irregular('ventar')
      expect(type).to eq(:ar_e_ie)

      type = Conjugate::Spanish.find_irregular('haber')
      expect(type).to eq(:er_haber)
    end

    it '.template' do
      template = Conjugate::Spanish.template({verb: 'ventar'})
      expect(template[:present][:yo]).to eq('{{{1}}}ie{{{2}}}o')

      template = Conjugate::Spanish.template({verb: 'placer'})
      expect(template[:present][:yo]).to eq('{{{1}}}ie{{{2}}}o')
    end
    it '.conjugate regular ar' do
      verb = Conjugate::Spanish.conjugate({verb: 'comprar', tense: :present, pronoun: :yo})
      expect(verb).to eq('compro')

      verb = Conjugate::Spanish.conjugate({verb: 'comprar', tense: :present, pronoun: :tu})
      expect(verb).to eq('compras')

      verb = Conjugate::Spanish.conjugate({verb: 'comprar', tense: :present, pronoun: :el})
      expect(verb).to eq('compra')

      verb = Conjugate::Spanish.conjugate({verb: 'comprar', tense: :present, pronoun: :nosotros})
      expect(verb).to eq('compramos')

      verb = Conjugate::Spanish.conjugate({verb: 'comprar', tense: :present, pronoun: :vosotros})
      expect(verb).to eq('compráis')

      verb = Conjugate::Spanish.conjugate({verb: 'comprar', tense: :present, pronoun: :ellos})
      expect(verb).to eq('compran')

      verb = Conjugate::Spanish.conjugate({verb: 'comprar', tense: :past, pronoun: :yo})
      expect(verb).to eq('compré')

      verb = Conjugate::Spanish.conjugate({verb: 'comprar', tense: :future, pronoun: :yo})
      expect(verb).to eq('compraré')
    end

    it '.conjugate regular er' do
      verb = Conjugate::Spanish.conjugate({verb: 'beber', tense: :present, pronoun: :yo})
      expect(verb).to eq('bebo')

      verb = Conjugate::Spanish.conjugate({verb: 'beber', tense: :present, pronoun: :tu})
      expect(verb).to eq('bebes')

      verb = Conjugate::Spanish.conjugate({verb: 'beber', tense: :present, pronoun: :el})
      expect(verb).to eq('bebe')

      verb = Conjugate::Spanish.conjugate({verb: 'beber', tense: :present, pronoun: :nosotros})
      expect(verb).to eq('bebemos')

      verb = Conjugate::Spanish.conjugate({verb: 'beber', tense: :present, pronoun: :vosotros})
      expect(verb).to eq('bebéis')

      verb = Conjugate::Spanish.conjugate({verb: 'beber', tense: :present, pronoun: :ellos})
      expect(verb).to eq('beben')

      verb = Conjugate::Spanish.conjugate({verb: 'beber', tense: :past, pronoun: :yo})
      expect(verb).to eq('bebí')

      verb = Conjugate::Spanish.conjugate({verb: 'beber', tense: :future, pronoun: :yo})
      expect(verb).to eq('beberé')
    end

    it '.conjugate regular re' do
      verb = Conjugate::Spanish.conjugate({verb: 'vivir', tense: :present, pronoun: :yo})
      expect(verb).to eq('vivo')

      verb = Conjugate::Spanish.conjugate({verb: 'vivir', tense: :present, pronoun: :tu})
      expect(verb).to eq('vives')

      verb = Conjugate::Spanish.conjugate({verb: 'vivir', tense: :present, pronoun: :el})
      expect(verb).to eq('vive')

      verb = Conjugate::Spanish.conjugate({verb: 'vivir', tense: :present, pronoun: :nosotros})
      expect(verb).to eq('vivimos')

      verb = Conjugate::Spanish.conjugate({verb: 'vivir', tense: :present, pronoun: :vosotros})
      expect(verb).to eq('vivís')

      verb = Conjugate::Spanish.conjugate({verb: 'vivir', tense: :present, pronoun: :ellos})
      expect(verb).to eq('viven')

      verb = Conjugate::Spanish.conjugate({verb: 'vivir', tense: :past, pronoun: :yo})
      expect(verb).to eq('viví')

      verb = Conjugate::Spanish.conjugate({verb: 'vivir', tense: :future, pronoun: :yo})
      expect(verb).to eq('viviré')
    end

    it '.conjugate_irregular verb' do
      verb = Conjugate::Spanish.conjugate({verb: 'ir', tense: :present, pronoun: :yo})
      expect(verb).to eq('voy')

      verb = Conjugate::Spanish.conjugate({verb: 'faire', tense: :past, pronoun: :yo})
      expect(verb).to eq('fui')

      verb = Conjugate::Spanish.conjugate({verb: 'faire', tense: :future, pronoun: :yo})
      expect(verb).to eq('iré')
    end

  end
end
