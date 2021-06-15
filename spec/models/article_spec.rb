require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "DBテスト" do
    let(:job_offer){Article.new}

    it "urlが一意である" do
      Chewy.strategy(:atomic) do
        Article.create(url: "https://example.com", title: "テストサンプル")
      end
      job_offer.url = "https://example.com"
      job_offer.title = "テストサンプル"
      expect do
        job_offer.save!
      end.to raise_error( ActiveRecord::RecordNotUnique )
    end

    it "titleがNULLでない" do
      job_offer.url = "https://example.com"
      job_offer.title = nil
      expect do
        job_offer.save!
      end.to raise_error( ActiveRecord::NotNullViolation )
    end

    it "urlがNULLでない" do
      job_offer.url = nil
      job_offer.title = "サンプルテスト"
      expect do
        job_offer.save!
      end.to raise_error( ActiveRecord::NotNullViolation )
    end

  end
end
