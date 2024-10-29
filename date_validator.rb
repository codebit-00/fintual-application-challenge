module DateValidator
  def validate_dates(start_date, end_date)
    raise StandardError.new "Ensure that dates are different than nil" if [start_date, end_date].any?(nil)

    raise StandardError.new "Start date can't be major thant end date" if start_date > end_date
  end  
end
