require 'spec_helper'

RSpec.describe Esq::SortElement do
  describe 'renders to {field => direction}' do
    subject { described_class.new field: :f, direction: :asc }

    let(:expected) do
      {f: :asc}
    end

    it { expect(subject.render).to eq expected }
  end

  describe 'without direction' do
    subject { described_class.new field: :f }

    let(:expected) do
      {f: :asc}
    end

    it 'will use :asc as direction' do
      expect(subject.render).to eq expected
    end
  end

  describe 'direction valid values' do
    [:asc, 'asc', 'ASC', :desc, 'desc', 'DESC'].each do |v|
      context "with #{v.inspect} as direction" do
        let(:expected) { v.to_s.downcase.to_sym }
        subject { described_class.new field: :f, direction: v }

        it { expect(subject.render.values.first).to eq expected }
      end
    end

    context 'with anything else' do
      subject { described_class.new field: :f, direction: 'blah' }

      it do
        expect(subject).not_to be_valid
      end
    end
  end


  describe 'field' do
    subject { described_class.new field: 'f', direction: :asc }

    it 'converted to symbol' do
      expect(subject.render.keys.first).to eq :f
    end
  end
end