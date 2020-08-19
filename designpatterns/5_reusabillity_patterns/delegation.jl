using Dates
using Lazy: @forward


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

# Forward accesors
#accountnumber(sa::SavingsAccount) = accountnumber(sa.acct)
#balance(sa::SavingsAccount) = balance(sa.acct)
#dateopened(sa::SavingsAccount) = dateopened(sa.acct)
@forward SavingsAccount.acct accountnumber, balance, dateopened


# Forward methods
#deposit!(sa::SavingsAccount, amount::Real) = deposit!(sa.acct, amount)
#withdraw!(sa:SavingsAccount, amount::Real) = withdraw!(sa.acct, amount)
@forward SavingsAccount.acct deposit!, withdraw!

transfer!(sa1::SavingsAccount, sa2::SavingsAccount, amount::Real) = transfer!(
	sa1.acct, sa2.acct, amount)


# New accessor
interestrate(sa::SavingsAccount) = sa.interestrate

# New behavior
function accrue_daily_interest!(sa::SavingsAccount)
	interest = balance(sa.acct) * interestrate(sa) / 365
	deposit!(sa.acct, interest)
end

