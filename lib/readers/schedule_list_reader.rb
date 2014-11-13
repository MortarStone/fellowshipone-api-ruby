module FellowshipOne

  class ScheduleListReader < ApiReader

    # Constructor.    
    def initialize(options = {})
      raise 'activity_id not specified' if options[:activity_id].nil?

      activity_id = options[:activity_id]
      page = options[:page] || 1
      per_page = options[:per_page] || 50

      @url_data_params = {}
      @url_data_params.merge!({page: page}) if page
      @url_data_params.merge!({pageSize: per_page}) if per_page   
      @url_data_path = options[:url_data_path] || "/activities/v1/activities/#{activity_id}/schedules"
    end

  end

end