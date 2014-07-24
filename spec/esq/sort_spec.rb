require 'spec_helper'

RSpec.describe Esq::Sort do
  describe 'renders to [{field => direction}]' do
    subject { described_class.new.add(field: :f, direction: :asc) }

    let(:expected) do
      [{f: :asc}]
    end

    it { expect(subject.render).to eq expected }
  end
end