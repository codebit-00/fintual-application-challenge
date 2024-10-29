require_relative 'date_validator'

class Portfolio
  include DateValidator

  attr_accessor :stocks

  def initialize(stocks: nil)
    @stocks = stocks
  end

  def profit(start_date: nil, end_date: nil)
    validate_dates(start_date, end_date)

    total_invested = stocks.price(start_date)

    gross_profit = stocks.price(end_date) - total_invested

    gross_profit * 100 / total_invested
  rescue StandardError => e
    return e
  end

  def annualized_return(start_date: nil, end_date: nil)
    days_of_period = (Date.parse(end_date) - Date.parse(start_date)).to_f
    fractional_months = days_of_period / 30
    annualized_factor = 12 / fractional_months
    (annualized_factor * profit(start_date, end_date)).round(2)
  rescue StandardError => e
    return e
  end
end
