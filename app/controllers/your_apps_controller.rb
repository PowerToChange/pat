require_dependency 'permissions'

class YourAppsController < ApplicationController
  include Permissions

  cache_sweeper :profiles_sweeper

  before_filter :user_owns_profile_with_message, :only => [ :acceptance, :continue ]
  before_filter :set_title

  skip_before_filter :restrict_students
  
  def index
    redirect_to :controller => :profiles
  end

  def view
    profiles = @viewer.profiles.find_all{ |profile| (profile.try(:project).try(:event_group_id) == @eg.id || profile.try(:appln).try(:form).try(:event_group_id) == @eg.id) && !profile.is_a?(StaffProfile) }
    if profiles.length > 1
      flash[:notice] = "You have multiple applications - please choose one to view."
      redirect_to :controller => :profiles, :action => :index
    elsif profiles.first.is_a?(Acceptance)
      redirect_to({ :controller => 'appln', :action => 'view_always_editable', :profile_id => profiles.first.id })
    elsif profiles.empty?
      if @eg.forms.find_all_by_hidden(false).count == 1
        redirect_to :controller => :profiles, :action => :start, :form_id => @eg.forms.find_all_by_hidden(false).first
      elsif @eg.forms.find_all_by_hidden(false).empty?
        # the profiles index page will show an appropriate message about no forms available yet
        redirect_to :controller => :profiles, :action => :index
      else
        # multiple forms, they need to choose
        flash[:notice] = "There are multiple application forms - please choose one"
        redirect_to :controller => :profiles, :action => :index
      end
    else
      redirect_to :controller => :appln, :profile_id => profiles.first.id
    end
  end

  def view_always_editable
    redirect_to :controller => :appln, :action => 'view_always_editable', :profile_id => @profile.id
  end

  def acceptance
    redirect_to :controller => :profiles, :action => :view, :id => params[:profile_id]
  end
  
  protected
  
    def set_title
      @page_title = "Application"
    end
end
