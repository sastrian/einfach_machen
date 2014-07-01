namespace :db do
  
  desc "drops all tables"  
  task local_reset: :environment do
    User.delete_all
    puts "deleted all users"
    
    Pearl.delete_all
    puts "deleted all pearls"     
    
    FileUtils.rm_rf(Rails.root.join('public', 'uploads'))
    puts "deleting upload folder"
  end
  
  desc "create n_users new random users"
  task :create_users, [:n_users] => :environment do |t, args| # task with two arguments
    args.with_defaults(:n_users => 5)           
    password  = "password"
    User.create!(username: "sastrian", email: "maro.bader@gmail.com",
               password: password,password_confirmation: password)
    args.n_users.times do |n|
      name  = Faker::Name.name()
      email = Faker::Internet.email(name)      
      User.create!(username: name, email: email,
                 password: password,
                 password_confirmation: password)
    end     
    puts "added " + args.n_users.to_s + " users"
  end
   
  desc "create :n_pearls new random pearls"
  task :create_pearls, [:n_pearls] => :environment do |t, args| # task with two arguments
    args.with_defaults(:n_pearls => 25)          	
  	users = User.all  	
  	
    args.n_pearls.times do |n|        
        body = Faker::Lorem.sentences(rand(10..20)).to_sentence()
  	    title = Faker::Company.name()
  	    image = File.open(File.join(Rails.root,"app/assets/images/p" + (1 + (n.modulo(18))).to_s + ".jpg"  ))
        pearl = Pearl.create!(title: title, body: body, user: users.sample(1).first, image: image) 	 
    end
    
    puts "added " + args.n_pearls.to_s + " pearls"    
  end
  
  desc "fills table with small amount of random values"
  task populate_small: :environment do
    Rake::Task["db:local_reset"].invoke()
    Rake::Task["db:create_users"].invoke(7)    
    Rake::Task["db:create_pearls"].invoke(35)   
  end
  
  desc "fills table with large amount of random values"
  task populate_large: :environment do
    Rake::Task["db:local_reset"].invoke()
    Rake::Task["db:create_users"].invoke(100)    
    Rake::Task["db:create_pearls"].invoke(2000)   
  end
  
end