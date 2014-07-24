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

  describe '.build_from' do
    subject { described_class.build_from(call_argument) }
    let(:field) { :f }
    let(:direction) { :direction }

    context 'given a 2 elements array' do
      let(:call_argument) { [field, direction] }
      it 'builds a SortElement with field = first and direction = second' do
        expect(subject).to be_a Esq::SortElement
        expect(subject.field).to eq field
        expect(subject.direction).to eq direction
      end
    end

    context 'given nil' do
      let(:call_argument) { nil }
      it 'builds a SortElement with field = first and direction = second' do
        expect(subject).to be_nil
      end
    end

    context 'given a string or symbol' do
      let(:call_argument) { field }
      it 'builds a SortElement with field = the argument and empty direction' do
        expect(subject).to be_a Esq::SortElement
        expect(subject.field).to eq field
        expect(subject.direction).to be_blank
      end
    end

    context 'given a hash' do
      let(:call_argument) { {'field' => field, 'direction' => direction} }
      it 'builds a SortElement with field = h[:field] and direction = h[:direction]' do
        expect(subject).to be_a Esq::SortElement
        expect(subject.field).to eq field
        expect(subject.direction).to eq direction
      end
    end

    context 'given a SortElement' do
      let(:call_argument) { Esq::SortElement.new field: field, direction: direction }
      it 'returns the same SortElement' do
        expect(subject).to be_a Esq::SortElement
        expect(subject).to be call_argument
        expect(subject.field).to eq field
        expect(subject.direction).to eq direction
      end
    end
  end
end