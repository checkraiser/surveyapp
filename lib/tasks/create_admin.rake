namespace :db do
  desc "Create admin"
  task :create_admin => :environment do
    while true
      puts "\n Your full name?"
      full_name = STDIN.gets.chomp
      puts "\n Your email address?"
      email = STDIN.gets.chomp
      puts "\n Your password?"
      password = STDIN.gets.chomp
      puts "\n Your password again?"
      password2 = STDIN.gets.chomp
      if password == password2 and email.length > 0 and password.length > 0 and password2.length > 0
        User.create(full_name: full_name, email: email, password: password, password_confirmation: password, admin: true)
        puts "\n Your account was created successfully. You can now login as admin"
        break
      else
        continue
      end

    end
  end
end