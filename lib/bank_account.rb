class BankAccount
    attr_reader :name, :status
    attr_accessor :balance, :status

    @@all = []

    def initialize(name)
        @name = name
        @balance = 1000
        @status = 'open'

        @@all << self
    end

    def display_balance
        "Your balance is $#{@balance}."
    end

    def deposit(deposited_amount)
        @balance += deposited_amount
    end

    def valid?
        @status == 'open' && @balance > 0
    end

    def close_account
        @status = 'closed'
    end

    def self.all
        @@all
    end
end
