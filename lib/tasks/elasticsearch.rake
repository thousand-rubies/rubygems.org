namespace :elasticsearch do
  task drop: :environment do
    Rubygem.searchkick_index.delete
  end
  task create: :environment do
    Rubygem.searchkick_index.create
  end

  task import: :environment do
    res = Searchkick.client.count index: Rubygem.searchkick_index_name
    puts "Count before import: #{res['count']}"

    Rubygem.reindex

    res = Searchkick.client.count index: Rubygem.searchkick_index_name
    puts "Count after import: #{res['count']}"
  end
end
