task :all_approved => :environment do
  desc "approving all advertisements"
  Advertising.update_all status: 'approved'
end

task :all_pending => :environment do
  desc "pending change to all advertisements"
  Advertising.update_all status: 'pending'
end
