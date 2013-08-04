module FellowshipOne

	class Search

    def self.search_for_contributions_by_date(start_date, end_date, page=1, per_page=500)
      options = {:start_date => start_date, :end_date => end_date, :per_page => per_page}
      reader = FellowshipOne::ContributionListReader.new(options)
      ContributionList.new({:reader => reader})
    end

    def self.search_for_person_by_name(name, page=1)
      options = {:page => page, :search_for => name}
      reader = FellowshipOne::PersonListReader.new(options)
      PersonList.new({:reader => reader})
    end

    def self.search_for_person_created_on_or_after(created_date, page=1)
      options = {:page => page, :created_date => created_date}
      reader = FellowshipOne::PersonListReader.new(options)
      PersonList.new({:reader => reader})
    end    

    def self.search_for_household_by_name(name, page=1)
      options = {:page => page, :search_for => name}
      reader = FellowshipOne::HouseholdListReader.new(options)
      HouseholdList.new({:reader => reader})
    end

	end

end