module FellowshipOne

  include Enumerable

  class Person < ApiObject
    # Gender = {:male => 'Male', :female => 'Female'}
    # PhoneType = {:home => 'Home', :work => 'Work', :mobile => 'Mobile'}
    # MaritalStatus = {:never_married => 'Never Married', :engaged => 'Engaged', 
    #                  :married => 'Married', :separated => 'Separated', 
    #                  :divorced => 'Divorced', :remarried => 'Re-Married',
    #                  :widowed => 'Widowed', :cohabiting => 'Cohabiting'}

    f1_attr_accessor :title,
                     :salutation,
                     :prefix,
                     :first_name, #required
                     :last_name,  #required
                     :suffix,
                     :middle_name,
                     :goes_by_name,
                     :former_name,
                     :gender,
                     :date_of_birth,
                     :marital_status,
                     :household_member_type, #required
                     :is_authorized,
                     :status, #required
                     :occupation,
                     :employer,
                     :school,
                     :denomination,
                     :former_church,
                     :bar_code,
                     :member_envelope_code,
                     :default_tag_comment,
                     :weblink,
                     :solicit,
                     :thank,
                     :first_record,
                     :last_match_date,
                     :created_date,
                     :last_updated_date,
                     :id,
                     :uri,
                     :image_uri,
                     :old_id,
                     :i_code,
                     :household_id,
                     :old_household_id,
                     :attributes,
                     :addresses,
                     :communications

    # Loads the user by the specified ID.
    #
    # @param user_id The ID of the user to load.
    #
    # Returns a new {Person} object.
    def self.load_by_id(person_id)
      reader = PersonReader.new(person_id)
      self.new(reader.load_feed['person'])
    rescue
      nil      
    end


    # Constructor.
    #
    # @param json_data (optional) The object that has the data.  This can be a {UserReader} or Hash object.
    # @param options (optional) Options for including more information.
    def initialize(json_data = nil, options = {})    
      @writer_object = PersonWriter
      initialize_from_json_object(json_data) unless json_data.nil?
    end
    

    # # The first and last name of the user.
    # #
    # # @return A string of the full name
    # def full_name
    #   use_name = self.nickname.to_s.empty? ? self.first : self.nickname
    #   [use_name, self.last].compact.join(' ')
    # end


    # # Address information.
    # #
    # # @param force_reload (optional) Data is cached on first call.  If data needs to be 
    # #                                reloaded from the server on a subsequent call then 
    # #                                a force reload is need.
    # #
    # # @return [UserAddressList]
    # def addresses(force_reload = false)
    #   unless force_reload
    #     return @address_list unless @address_list.nil?  
    #   end
    #   return nil unless self.id
         
    #   @address_list = UserAddressList.new({:user_id => self.id})
    #   return @address_list
    # end


    # # The family information.
    # #
    # # @return [UserFamilyList]
    # def family(force_reload = false)
    #   unless force_reload
    #     return @family_list unless @user_list.nil?  
    #   end
    #   return nil unless self.id
  
    #   @family_list = UserFamilyList.new({:user_id => self.id})
    #   return @family_list
    # end


    # # The notes for this user.
    # #
    # # @return [UserNoteList]
    # def notes(force_reload = false)
    #   unless force_reload
    #     return @note_list unless @note_list.nil?  
    #   end
    #   return nil unless self.id
  
    #   @note_list = UserNoteList.new({:user_id => self.id})
    #   return @note_list
    # end    


    # # The roles for this user.
    # #
    # # @return [UserRoleList]
    # def roles(force_reload = false)
    #   unless force_reload
    #     return @role_list unless @role_list.nil?  
    #   end
    #   return nil unless self.id
  
    #   @role_list = UserRoleList.new({:user_id => self.id})
    #   return @role_list
    # end      


    # # The skills for this user.
    # #
    # # @return [UserSkillList]
    # def skills(force_reload = false)
    #   unless force_reload
    #     return @skill_list unless @skill_list.nil?  
    #   end
    #   return nil unless self.id
  
    #   @skill_list = UserSkillList.new({:user_id => self.id})
    #   return @skill_list
    # end     


    # # The processes for this user.
    # #
    # # @return [UserProcessList]
    # def processes(force_reload = false)
    #   unless force_reload
    #     return @process_list unless @process_list.nil?  
    #   end
    #   return nil unless self.id
 
    #   @process_list = UserProcessList.new({:user_id => self.id})
    #   return @process_list
    # end   


    # # The invitations for this user.
    # #
    # # @return [UserInvitationList]
    # def invitations(force_reload = false)
    #   unless force_reload
    #     return @invitation_list unless @invitation_list.nil?  
    #   end
    #   return nil unless self.id
 
    #   @invitation_list = UserInvitationList.new({:user_id => self.id})
    #   return @invitation_list
    # end


    # # The invitations for this user.
    # #
    # # @return [UserAdminPrivilegeList]
    # def admin_privileges(force_reload = false)
    #   unless force_reload
    #     return @admin_privilege_list unless @admin_privilege_list.nil?  
    #   end
    #   return nil unless self.id

    #   @admin_privilege_list = UserAdminPrivilegeList.new({:user_id => self.id})
    #   return @admin_privilege_list
    # end

  end

end


