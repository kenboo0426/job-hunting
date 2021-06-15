class ArticlesIndex < Chewy::Index
  settings analysis: {
    analyzer: {
      exact: {
        tokenizer: 'keyword',
        filter: ['lowercase']
      }
    }
  }
  define_type Article do
    field :title, type: 'text'
    field :place, type: 'text'
    field :company_name, type: 'text'
  end
end