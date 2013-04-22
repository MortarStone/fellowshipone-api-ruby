module FellowshipOne

	class Search

    def self.search_for_contributions_by_date(start_date, end_date)
      options = {:url_data_params => {:startReceivedDate => start_date, :endReceivedDate => end_date},
                 :url_data_path => "/giving/v1/contributionreceipts/search"}
      reader = FellowshipOne::ContributionListReader.new(options)
      ContributionList.new(reader.load_feed)
    end

    def self.search_for_person_by_name(name)
      options = {:url_data_params => {:searchFor => name}, 
                 :url_data_path => "/v1/People/Search"}
      reader = FellowshipOne::PersonListReader.new(options)
      PersonList.new(reader.load_feed)
    end

	end

end