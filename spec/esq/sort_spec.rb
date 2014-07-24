require 'spec_helper'

RSpec.describe Esq::Sort do
  describe 'renders to [{field => direction}, ...]' do
    subject do
      described_class.new
      .add(field: :f, direction: :desc)
      .add([:f2])
      .add([:f3, :desc])
      .add(:f4)
      .add(Esq::SortElement.new(field: :f5))
    end

    let(:expected) do
      [
        {f: :desc},
        {f2: :asc},
        {f3: :desc},
        {f4: :asc},
        {f5: :asc},
      ]
    end

    it { expect(subject.render).to eq expected }
  end

  describe 'fails if any element does not validate' do
    subject do
      described_class.new
      .add(field: :f, direction: :desc)
      .add([])
      .add(:f3)
    end

    it { expect { subject.render }.to raise_error }
  end
end