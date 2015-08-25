class ReportsController < ApplicationController

    def day_wise_result
	    @readings = current_user.patients.today_result
@total = [@readings.minimum(:reading_value),@readings.maximum(:reading_value),@readings.average(:reading_value).to_i]

    end

    def month_to_date_result
    	@readings = Patient.month_to_date_wise(current_user,params)



    end

    def month_wise_result
    	@readings = Patient.month_wise(current_user,params)
    end
end
