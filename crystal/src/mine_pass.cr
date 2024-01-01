# This is a random password generator
module MinePass
  VERSION = "0.1.0"

  def self.generate_password(length : Int32) : String
    chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-=_+"
    password = String.new

    length.times do
      password += chars.chars.sample.to_s
    end

    password
  end

  def main(argc : Int32, argv : Pointer(Pointer(UInt8)))
    puts "Welcome to the random password generator in Crystal !"

    length = nil

    while length.nil? || length <= 0
      puts "Please enter the length of the password you wish to generate: "

      if input = gets
        if input.chomp =~ /\A-?\d+\z/
          length = input.chomp.to_i
        else
          puts "Invalid input. Please enter a valid number."
        end
      end
    end

    password = generate_password(length)

    puts "Your password is: #{password}"
  end
end
