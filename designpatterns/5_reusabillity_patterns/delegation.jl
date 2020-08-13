mutable struct Account
	accountnumber::String
	balance::Float64
	dateopened::Date
end

# Accessors
accountnumber(a::Account) = a.accountnumber
balance(a::Account) = a.balance
dateopened(a::Account) = a.dateopened

# Functions
function deposit!(a::Account, amount::Real)
	a.balance += amount
	return a.balance
end

function withdraw!(a::Account, amount::Real)
	return deposit!(a, -amount)
end

function transfer!(from::Account, to::Account, amount::Real)
	withdraw!(from, amount)
	deposit!(to, amount)
	return amount # ok...?
end


struct SavingsAccount
	acct::Account
	interestrate::Float64

	SavingsAccount(accountnumber, balance, dateopened, interestrate) = new(
		Account(accountnumber, balance, dateopened), interestrate)
end

