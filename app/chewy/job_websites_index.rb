class JobWebsitesIndex < Chewy::Index
  define_type JobWebsite do
    field :title, type: 'text'
    field :place, type: 'text'
    field :company_name, type: 'text'
  end
end