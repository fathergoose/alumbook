json.array!(@cohorts) do |cohort|
  json.extract! cohort, :id, :name, :campus, :cohort_date, :instructor
  json.url cohort_url(cohort, format: :json)
end
