class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
      
      if user.admin?
        can :manage, :all
      elsif user.has_role? :manager
        can :admin, :all
      elsif user.has_role? :observer
        can :read, :all
      else
        can :read, Meeting
        can [:update,:index, :delete], RequestMeeting do |meeting|
          reqm.user == user && reqm.status == 1 #изменять можно, пока заявка не подтверждена
        end
        can :manage, RequestMeeting do |meeting|
          meeting.user == user && meeting.status != 2
        end
        can [:show, :update], User do |u|
          u == user
        end
        can [:calendar, :day], Meeting
      end
      
      can :request, Meeting do |meeting|
        meeting.user.nil? && RequestMeeting.where(user_id: user, meeting_id: meeting).count == 0 && !user.admin?
      end
      
      # can :manage, RequestMeeting do |reqm|
    #     reqm.user == user && reqm.status == 1 #изменять можно, пока заявка не подтверждена
    #   end
      
      can :add_request, Date do |date|
        
      end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
